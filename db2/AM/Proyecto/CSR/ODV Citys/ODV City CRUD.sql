-- SQP05815 

--SELECT * FROM PRAXISBI.A2936


/*
 * 
 * 
 * 
 SET V_SQL = '
        SELECT ROW_NUMBER() OVER (ORDER BY X.CCUST, X.ID_NIT) AS RN,
               X.ID_NIT,
               X.CCUST,
               X.NIT,
               IFNULL(X.USCR, '''') AS USCR,
               COALESCE(TO_CHAR(X.FECR, ''YYYY-MM-DD''), '''') AS FECR,
			   COALESCE(TO_CHAR(TIMESTAMP(CURRENT_DATE, X.HOCR), ''HH24:MI:SS''), '''') AS HOCR,
               IFNULL(X.USUP, '''') AS USUP,
               COALESCE(TO_CHAR(X.FEUP, ''YYYY-MM-DD''), '''') AS FEUP,
			   COALESCE(TO_CHAR(TIMESTAMP(CURRENT_DATE, X.HOUP), ''HH24:MI:SS''), '''') AS HOUP,
               X.PGMCR,
               X.PGMUP
        FROM PRAXISMP.MPF153 X
        WHERE X.CCUST = ''' || IN_CCUST || '''
          AND X.NIT = CASE WHEN ''' || TRIM(IN_NIT) || ''' = '''' THEN X.NIT  ELSE ''' || TRIM(IN_NIT) || ''' 
		END
    ';
 * 
 * 
 * */



GRANT ALL ON PROCEDURE PRAXISBI.SQP05815 TO PUBLIC 


CREATE OR REPLACE PROCEDURE PRAXISBI.SQP05815
(
    IN IN_OPTION      VARCHAR(1),          -- 'C' = CREATE, 'U' = UPDATE, 'D' = DELETE
    IN IN_CCUST       VARCHAR(3),
    IN IN_CATTO       VARCHAR(3),
    IN IN_CCITY       VARCHAR(3),
    IN IN_NCITY       VARCHAR(50),
    IN IN_NATTO       VARCHAR(50),
    IN IN_CPAIS       VARCHAR(2),
    IN IN_NPAIS       VARCHAR(50),
    IN IN_IDZON       VARCHAR(3),
    IN IN_NZONE       VARCHAR(20),
    IN IN_CREGI       VARCHAR(3),
    IN IN_NREGI       VARCHAR(20),
    IN IN_CSREG       VARCHAR(3),
    IN IN_NCSRG       VARCHAR(20),
    IN IN_IDHUB       VARCHAR(3),
    IN IN_GATTO       VARCHAR(20),
    IN IN_INGRE       VARCHAR(10),
    IN IN_FINGR       VARCHAR(8),
    IN IN_HINGR       VARCHAR(6),
    IN IN_MODIF       VARCHAR(10),
    IN IN_FMODI       VARCHAR(8),
    IN IN_HMODI       VARCHAR(6),
    
    INOUT OUT_STATUS  INTEGER,
    INOUT OUT_MESSAGE VARCHAR(300)
)
LANGUAGE SQL
SPECIFIC PRAXISBI.SQP05815
BEGIN
    DECLARE V_ROWS INT DEFAULT 0;

    -- Inicializamos variables de salida
    SET OUT_STATUS = 0;
    SET OUT_MESSAGE = '';

    --==========================
    -- CREAR REGISTRO
    --==========================
    IF IN_OPTION = 'C' THEN

        INSERT INTO PRAXISBI.A2936 (
            A2936CCUST,
            A2936CATTO,
            A2936CCITY,
            A2936NCITY,
            A2936NATTO,
            A2936CPAIS,
            A2936NPAIS,
            A2936IDZON,
            A2936NZONE,          
            A2936CREGI,
            A2936NREGI,
            A2936CSREG,
            A2936NCSRG,
            A2936IDHUB,
            A2936GATTO,
            A2936INGRE,
            A2936FINGR,
            A2936HINGR,
            A2936MODIF,
            A2936FMODI,
            A2936HMODI
        )
        VALUES (
            IN_CCUST,
            IN_CATTO,
            IN_CCITY,
            IN_NCITY,
            IN_NATTO,
            IN_CPAIS,
            IN_NPAIS,
            IN_IDZON,
            IN_NZONE,
            IN_CREGI,
            IN_NREGI,
            IN_CSREG,
            IN_NCSRG,
            IN_IDHUB,
            IN_GATTO,
            SESSION_USER,
            TO_CHAR(CURRENT_DATE, 'YYYYMMDD'),
            TO_CHAR(CURRENT_TIMESTAMP, 'HH24:MI'),
            IN_MODIF,
            '',
            ''
        );

        GET DIAGNOSTICS V_ROWS = ROW_COUNT;

        IF V_ROWS > 0 THEN
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Registro creado correctamente';
        ELSE
            SET OUT_STATUS = 0;
            SET OUT_MESSAGE = 'No se pudo insertar el registro';
        END IF;

    --==========================
    -- ACTUALIZAR REGISTRO
    --==========================
    ELSEIF IN_OPTION = 'U' THEN

        UPDATE PRAXISBI.A2936 T
           SET  T.A2936CCITY  = IN_CCITY,
                T.A2936NCITY  = IN_NCITY,
                T.A2936NATTO  = IN_NATTO,
                T.A2936CPAIS  = IN_CPAIS,
                T.A2936NPAIS  = IN_NPAIS,
                T.A2936IDZON  = IN_IDZON,
                T.A2936NZONE  = IN_NZONE,
                T.A2936CREGI  = IN_CREGI,
                T.A2936NREGI  = IN_NREGI,
                T.A2936CSREG  = IN_CSREG,
                T.A2936NCSRG  = IN_NCSRG,
                T.A2936IDHUB  = IN_IDHUB,
                T.A2936GATTO  = IN_GATTO,
                T.A2936INGRE  = IN_INGRE,
                T.A2936FINGR  = IN_FINGR,
                T.A2936HINGR  = IN_HINGR,
                T.A2936MODIF  = USER,
                T.A2936FMODI  = TO_CHAR(CURRENT_DATE, 'YYYYMMDD'),
                T.A2936HMODI  = TO_CHAR(CURRENT_TIMESTAMP, 'HH24:MI')
         WHERE T.A2936CCUST = IN_CCUST
           AND T.A2936CATTO = IN_CATTO;

        GET DIAGNOSTICS V_ROWS = ROW_COUNT;

        IF V_ROWS > 0 THEN
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Registro actualizado correctamente';
        ELSE
            SET OUT_STATUS = 0;
            SET OUT_MESSAGE = 'No se encontró el registro a actualizar';
        END IF;

    --==========================
    -- ELIMINAR REGISTRO
    --==========================
    ELSEIF IN_OPTION = 'D' THEN

        DELETE FROM PRAXISBI.A2936
         WHERE A2936CCUST = IN_CCUST
           AND A2936CATTO = IN_CATTO
           AND A2936CCITY = IN_CCITY;

        GET DIAGNOSTICS V_ROWS = ROW_COUNT;

        IF V_ROWS > 0 THEN
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Registro eliminado correctamente';
        ELSE
            SET OUT_STATUS = 0;
            SET OUT_MESSAGE = 'No se encontró el registro a eliminar';
        END IF;

    --==========================
    -- OPCIÓN INVÁLIDA
    --==========================
    ELSE
        SET OUT_STATUS = 0;
        SET OUT_MESSAGE = 'Opción inválida';
    END IF;

END
