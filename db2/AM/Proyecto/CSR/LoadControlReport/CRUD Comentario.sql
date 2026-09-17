

-- PRAXIS.SQP05804
-- Insercción de comentario para la pantalla Load Report

GRANT ALL ON PROCEDURE PRAXIS.SQP05804 TO PUBLIC 


CREATE OR REPLACE PROCEDURE PRAXIS.SQP05804 (
    IN IN_OPTION      VARCHAR(1),          -- 'C' = CREATE, 'U' = UPDATE
    IN IN_CCUST       VARCHAR(3),
    IN IN_FUENT       VARCHAR(3),
    IN IN_PAIS        VARCHAR(2),
    IN IN_MDA         VARCHAR(3),
    IN IN_DIA         VARCHAR(1),
    IN IN_DIAT        VARCHAR(12),         -- Texto del día (ej: 'Lunes')
    IN IN_STATUS      VARCHAR(1),
    IN IN_FECHA       VARCHAR(8),
    IN IN_COMENT      VARCHAR(300),
    INOUT OUT_STATUS  INTEGER,
    INOUT OUT_MESSAGE VARCHAR(300)
)
LANGUAGE SQL
SPECIFIC PRAXIS.SQP05804
BEGIN
    DECLARE V_ROWS INT DEFAULT 0;

    -- Inicializamos variables de salida
    SET OUT_STATUS = 0;
    SET OUT_MESSAGE = '';

    CASE IN_OPTION
        /*======================================================
          CREAR COMENTARIO NUEVO
        ======================================================*/
        WHEN 'C' THEN
            INSERT INTO PRAXIS.A4859 (
                A4859CCUST,
                A4859FUENT,
                A4859PAIS,
                A4859MDA,
                A4859DIA,
                A4859DIAT,
                A4859FECHA,
                A4859STA,
                A4859COME,
                A4859FCR,
                A4859USCR
            )
            VALUES (
                IN_CCUST,
                IN_FUENT,
                IN_PAIS,
                IN_MDA,
                IN_DIA,
                TRIM(IN_DIAT),
                IN_FECHA,
                IN_STATUS,
                IN_COMENT,
                CURRENT_DATE,
                SESSION_USER
            );

            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Comentario creado correctamente';

        /*======================================================
          ACTUALIZAR COMENTARIO EXISTENTE
        ======================================================*/
        WHEN 'U' THEN
            UPDATE PRAXIS.A4859 T
               SET T.A4859COME = IN_COMENT,
				   T.A4859FUP  = CURRENT_DATE,
				   T.A4859USUP = USER
             WHERE T.A4859CCUST = IN_CCUST
               AND T.A4859PAIS  = IN_PAIS
               AND T.A4859MDA   = IN_MDA
               --AND T.A4859DIA   = IN_DIA
               AND T.A4859DIAT  = TRIM(IN_DIAT)
               AND T.A4859FECHA = IN_FECHA;
               

            -- Captura el número de filas afectadas
            GET DIAGNOSTICS V_ROWS = ROW_COUNT;

            IF (V_ROWS = 0) THEN
                SET OUT_STATUS = 0;
                SET OUT_MESSAGE = 'No se encontró el registro a actualizar';
            ELSE
                SET OUT_STATUS = 1;
                SET OUT_MESSAGE = 'Comentario actualizado correctamente';
            END IF;

        /*======================================================
          OPCIÓN INVÁLIDA
        ======================================================*/
        ELSE
            SET OUT_STATUS = 0;
            SET OUT_MESSAGE = 'Opción inválida';
    END CASE;
END


-----------------



SELECT * FROM PRAXIS.A4493 

SELECT * FROM PRAXIS.A4859





DELETE FROM PRAXIS.A4859 WHERE A4859DIAT = '3';


	GRANT ALL ON PROCEDURE PRAXIS.SQP05068 TO PUBLIC  -- PARA TODOS PUEDAN USAR


SELECT *
FROM PRAXIS.A4859
WHERE A4859CCUST = '139'
  AND A4859PAIS  = 'PA'
  AND A4859MDA   = 'USD'
 -- AND A4859DIA   = '1'
  AND A4859DIAT  = TRIM('Sábado')
  AND A4859FECHA = '20220305';



