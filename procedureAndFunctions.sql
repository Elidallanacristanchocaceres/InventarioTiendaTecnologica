5. Procedimientos y Funciones (ProcedureAndFunctions.sql)

CREATE OR REPLACE PROCEDURE sp_registrar_venta(
    IN p_cliente_id INTEGER,
    IN p_productos_ids INTEGER[],
    IN p_cantidades INTEGER[],
    OUT p_resultado TEXT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_venta_id INTEGER;
    v_total_venta DECIMAL(10,2) := 0;
    v_stock_actual INTEGER;
    v_i INTEGER;
    v_precio_producto DECIMAL(10,2);
    v_cliente_existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM clientes WHERE id = p_cliente_id) INTO v_cliente_existe;

    IF NOT v_cliente_existe THEN
        p_resultado := 'Error: El cliente con ID ' || p_cliente_id || ' no existe';
        RAISE NOTICE '%', p_resultado;
        RETURN;
    END IF;

    IF array_length(p_productos_ids, 1) IS DISTINCT FROM array_length(p_cantidades, 1) THEN
        p_resultado := 'Error: La cantidad de productos no coincide con las cantidades especificadas';
        RAISE NOTICE '%', p_resultado;
        RETURN;
    END IF;

    FOR v_i IN 1..array_length(p_productos_ids, 1) LOOP
        IF NOT EXISTS(SELECT 1 FROM productos WHERE id = p_productos_ids[v_i]) THEN
            p_resultado := 'Error: El producto con ID ' || p_productos_ids[v_i] || ' no existe';
            RAISE NOTICE '%', p_resultado;
            RETURN;
        END IF;

        SELECT stock INTO v_stock_actual FROM productos WHERE id = p_productos_ids[v_i];

        IF v_stock_actual < p_cantidades[v_i] THEN
            p_resultado := 'Error: Stock insuficiente para el producto ID ' || p_productos_ids[v_i] ||
                        '. Stock actual: ' || v_stock_actual || ', cantidad solicitada: ' || p_cantidades[v_i];
            RAISE NOTICE '%', p_resultado;
            RETURN;
        END IF;
    END LOOP;

    BEGIN
        INSERT INTO ventas (cliente_id, total)
        VALUES (p_cliente_id, 0)
        RETURNING id INTO v_venta_id;

        FOR v_i IN 1..array_length(p_productos_ids, 1) LOOP
            SELECT precio INTO v_precio_producto FROM productos WHERE id = p_productos_ids[v_i];

            INSERT INTO detalles_venta (venta_id, producto_id, cantidad, precio_unitario)
            VALUES (v_venta_id, p_productos_ids[v_i], p_cantidades[v_i], v_precio_producto);

            UPDATE productos
            SET stock = stock - p_cantidades[v_i]
            WHERE id = p_productos_ids[v_i];

            v_total_venta := v_total_venta + (v_precio_producto * p_cantidades[v_i]);
        END LOOP;

        UPDATE ventas SET total = v_total_venta WHERE id = v_venta_id;

        p_resultado := 'Venta registrada exitosamente. ID de venta: ' || v_venta_id ||
                    ', Total: $' || v_total_venta;
        RAISE NOTICE '%', p_resultado;

    EXCEPTION
        WHEN OTHERS THEN
            p_resultado := 'Error al registrar la venta: ' || SQLERRM;
            RAISE NOTICE '%', p_resultado;
    END;
END;
$$;



--Usar
DO $$
DECLARE
    resultado TEXT;
BEGIN
    CALL sp_registrar_venta(
        1,                          
        ARRAY[1, 3, 5],            
        ARRAY[2, 1, 1],            
        resultado                   
    );
    RAISE NOTICE 'Resultado: %', resultado;
END;
$$;


--cliente no existe
DO $$
DECLARE
    v_resultado TEXT;
BEGIN
    CALL sp_registrar_venta(
        98,                
        ARRAY[1, 2],        
        ARRAY[1, 1],        
        v_resultado
    );
END;
$$;


--stock insuficiente
DO $$
DECLARE
    v_resultado TEXT;
BEGIN
    CALL sp_registrar_venta(
        1,                  
        ARRAY[1],           
        ARRAY[98],         
        v_resultado
    );
END;
$$;
