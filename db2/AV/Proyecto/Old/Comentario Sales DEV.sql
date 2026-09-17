CREATE OR REPLACE PROCEDURE PRAXIS.SQP05804 (
    IN IN_OPTION   CHAR(1),         -- 'C' = CREATE, 'U' = UPDATE
    IN IN_CCUST    INTEGER,         -- NHOT (por ejemplo)
    IN IN_FUENT    CHAR(10),
    IN IN_PAIS     CHAR(10),
    IN IN_DIA      CHAR(8),         -- formato tipo '20220307'
    IN IN_COMENT   VARCHAR(200),
    INOUT OUT_STATUS  INTEGER,
    INOUT OUT_MESSAGE VARCHAR(300)
)
LANGUAGE SQL
SPECIFIC PRAXIS.SQP05804
BEGIN
    -- Inicializamos variables
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
                A4859DIA,
                A4859COME,
                A4859STA
            )
            VALUES (
                IN_CCUST,
                IN_FUENT,
                IN_PAIS,
                IN_DIA,
                IN_COMENT,
                'A'
            );

            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Comentario creado correctamente';

        /*======================================================
          ACTUALIZAR COMENTARIO EXISTENTE
        ======================================================*/
        WHEN 'U' THEN
            UPDATE PRAXIS.A4859 T
               SET T.A4859COME = IN_COMENT
             WHERE T.A4859CCUST = IN_CCUST
               AND T.A4859FUENT = IN_FUENT
               AND T.A4859PAIS  = IN_PAIS
               AND T.A4859DIA   = IN_DIA;

            IF (ROW_COUNT = 0) THEN
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
