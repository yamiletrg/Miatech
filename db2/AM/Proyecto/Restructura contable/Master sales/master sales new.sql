 
CREATE OR REPLACE PROCEDURE PRAXIS.SQP04481 (
    IN IN_OPTION CHAR(1),
    IN IN_A1740CCUST VARCHAR(3),
    IN IN_A1740TITRA VARCHAR(4),
    IN IN_A1740TIPO VARCHAR(1),
    IN IN_A1740SUBTI VARCHAR(4),
    IN IN_A1740CATEG VARCHAR(4),
    IN IN_A1740CIA VARCHAR(2),
    IN IN_A1740UNIDA VARCHAR(2),
    IN IN_A1740CECOS VARCHAR(7),
    IN IN_A1740UBICA VARCHAR(4),
    IN IN_A1740CTA VARCHAR(6),
    IN IN_A1740SCTA VARCHAR(5),
    IN IN_A1740EQUI VARCHAR(4),
    IN IN_A1740ICIA VARCHAR(2),
    IN IN_A1740CLIE VARCHAR(40),
    IN IN_A1740FINI VARCHAR(8),
    IN IN_A1740FFIN VARCHAR(8),
    IN IN_USR VARCHAR(10),
    IN IN_FEC VARCHAR(8),
    IN IN_HOR VARCHAR(6),
    IN IN_A1740TITRA_OLD VARCHAR(4),
    IN IN_A1740TIPO_OLD VARCHAR(1),
    IN IN_A1740SUBTI_OLD VARCHAR(4),
    IN IN_A1740CATEG_OLD VARCHAR(4),
    IN IN_A1740INTNU CHAR(1)
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PRAXIS.SQP04481

BEGIN

    DECLARE VL_SQLCODE INTEGER DEFAULT 0;
    DECLARE SQLCODE INTEGER DEFAULT 0;
    DECLARE VL_MESSAGE VARCHAR(100) DEFAULT '';

    DECLARE CURQRY CURSOR WITH RETURN FOR
        SELECT VL_MESSAGE AS VMESSAGE,
               VL_SQLCODE AS VSQLCODE
        FROM SYSIBM.SYSDUMMY1;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SET VL_SQLCODE = REPLACE(SQLCODE, '-', '');
    
  

    ----------------------------------------------------------------
    -- INSERT
    ----------------------------------------------------------------
    IF IN_OPTION = 'I' THEN

        IF NOT EXISTS (
            SELECT 1
            FROM PRAXIS.A1740
            WHERE A1740TITRA = IN_A1740TITRA
            AND A1740TIPO  = IN_A1740TIPO
            AND A1740SUBTI = IN_A1740SUBTI
            AND A1740CATEG = IN_A1740CATEG
        ) THEN

            INSERT INTO PRAXIS.A1740 (
                A1740CCUST,
                A1740TITRA,
                A1740TIPO,
                A1740SUBTI,
                A1740CATEG,
                A1740CIA,
                A1740UNIDA,
                A1740CECOS,
                A1740UBICA,
                A1740CTA,
                A1740SCTA,
                A1740EQUI,
                A1740ICIA,
                A1740CLIE,
                A1740FINI,
                A1740FFIN,
                A1740REGIS,
                A1740FREGI,
                A1740HREGI,
                A1740INTNU
            )
            VALUES (
                IN_A1740CCUST,
                IN_A1740TITRA,
                IN_A1740TIPO,
                IN_A1740SUBTI,
                IN_A1740CATEG,
                IN_A1740CIA,
                IN_A1740UNIDA,
                IN_A1740CECOS,
                IN_A1740UBICA,
                IN_A1740CTA,
                IN_A1740SCTA,
                IN_A1740EQUI,
                IN_A1740ICIA,
                IN_A1740CLIE,
                IN_A1740FINI,
                IN_A1740FFIN,
                IN_USR,
                IN_FEC,
                IN_HOR,
                IN_A1740INTNU
            );

            SET VL_MESSAGE = 'RECORD INSERTED';

        ELSE
            SET VL_MESSAGE = 'RECORD EXISTS';
        END IF;

    ----------------------------------------------------------------
    -- UPDATE
    ----------------------------------------------------------------
    ELSEIF IN_OPTION = 'U' THEN

        IF NOT EXISTS (
            SELECT 1
            FROM PRAXIS.A1740
            WHERE A1740TITRA = IN_A1740TITRA
            AND A1740TIPO  = IN_A1740TIPO
            AND A1740SUBTI = IN_A1740SUBTI
            AND A1740CATEG = IN_A1740CATEG
            AND (
                A1740TITRA <> IN_A1740TITRA_OLD
                OR A1740TIPO <> IN_A1740TIPO_OLD
                OR A1740SUBTI <> IN_A1740SUBTI_OLD
                OR A1740CATEG <> IN_A1740CATEG_OLD
            )
        ) THEN

            UPDATE PRAXIS.A1740
            SET
                A1740TITRA = IN_A1740TITRA,
                A1740TIPO  = IN_A1740TIPO,
                A1740SUBTI = IN_A1740SUBTI,
                A1740CATEG = IN_A1740CATEG,
                A1740CIA   = IN_A1740CIA,
                A1740UNIDA = IN_A1740UNIDA,
                A1740CECOS = IN_A1740CECOS,
                A1740UBICA = IN_A1740UBICA,
                A1740CTA   = IN_A1740CTA,
                A1740SCTA  = IN_A1740SCTA,
                A1740EQUI  = IN_A1740EQUI,
                A1740ICIA  = IN_A1740ICIA,
                A1740CLIE  = IN_A1740CLIE,
                A1740FINI  = IN_A1740FINI,
                A1740FFIN  = IN_A1740FFIN,
                A1740REGVI = IN_USR,
                A1740FREVI = IN_FEC,
                A1740HREVI = IN_HOR,
                A1740INTNU = IN_A1740INTNU
            WHERE
                A1740TITRA = IN_A1740TITRA_OLD
            AND A1740TIPO  = IN_A1740TIPO_OLD
            AND A1740SUBTI = IN_A1740SUBTI_OLD
            AND A1740CATEG = IN_A1740CATEG_OLD;

            SET VL_MESSAGE = 'RECORD UPDATED';

        ELSE
            SET VL_MESSAGE = 'RECORD EXISTS';
        END IF;

    ----------------------------------------------------------------
    -- DELETE
    ----------------------------------------------------------------
    ELSE

        DELETE FROM PRAXIS.A1740
        WHERE A1740TITRA = IN_A1740TITRA_OLD
        AND A1740TIPO  = IN_A1740TIPO_OLD
        AND A1740SUBTI = IN_A1740SUBTI_OLD
        AND A1740CATEG = IN_A1740CATEG_OLD;

        SET VL_MESSAGE = 'RECORD REMOVED';

    END IF;

    ----------------------------------------------------------------
    -- CONTROL DE ERRORES
    ----------------------------------------------------------------
    IF VL_SQLCODE <> 0 THEN

        SELECT DB_MESSAGE
        INTO VL_MESSAGE
        FROM PRAXIS.INF054
        WHERE DB_SQLCODE = VL_SQLCODE
        FETCH FIRST 1 ROW ONLY;

        IF VL_MESSAGE IS NULL THEN
            SET VL_MESSAGE = 'AN UNEXPECTED ERROR OCCURRED, CODE ' CONCAT VL_SQLCODE;
        END IF;

    END IF;

    OPEN CURQRY;

END




SELECT IS_NULLABLE
FROM QSYS2.SYSCOLUMNS
WHERE TABLE_SCHEMA='PRAXIS'
AND TABLE_NAME='A1740'
AND COLUMN_NAME IN ('A1740SUBTI','A1740CATEG');
