--- SQP05813






SELECT * FROM PRAXISBI.A2936




CALL PRAXISBI.SQP05813('139','AAC','AAC','EG','INT','AFR')




CREATE OR REPLACE PROCEDURE PRAXISBI.SQP05813
(
   IN  IN_CCUST   VARCHAR(3),
   IN  IN_OPTION  VARCHAR(1),
   IN  IN_CODE    VARCHAR(3),
   IN  IN_NAME    VARCHAR(50),
   INOUT IO_PAGNUM INTEGER,
   INOUT IO_PAGROW INTEGER,
   INOUT IO_TOTPAG INTEGER,
   INOUT IO_TOTROW INTEGER
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PRAXISBI.SQP05813
BEGIN

    DECLARE V_SQL        VARCHAR(30000);  
    DECLARE PAGROWINIT   INTEGER;
    DECLARE SQLPAG01     VARCHAR(30000);
    DECLARE CURQRY01 CURSOR FOR STMTQRY01;

    --------------------------------------------------------------------
    -- Construir SELECT base con filtro CCUST (mayúsculas/minúsculas ignoradas)
    --------------------------------------------------------------------
    SET V_SQL = '
    SELECT ROW_NUMBER() OVER (ORDER BY X.A2936CCUST, X.A2936CATTO) AS RN,
           X.*
    FROM PRAXISBI.A2936 X
    WHERE (''' || IN_CCUST || ''' = '''' OR UPPER(X.A2936CCUST) = UPPER(''' || IN_CCUST || ''')) ';

    -- Filtro CODE según IN_OPTION (mayúsculas/minúsculas ignoradas)
    IF IN_CODE <> '' THEN
        IF IN_OPTION = '1' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936CATTO) = UPPER(''' || IN_CODE || ''')';
        ELSEIF IN_OPTION = '2' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936CCITY) = UPPER(''' || IN_CODE || ''')';
        ELSEIF IN_OPTION = '3' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936CPAIS) = UPPER(''' || IN_CODE || ''')';
        ELSEIF IN_OPTION = '4' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936IDZON) = UPPER(''' || IN_CODE || ''')';
        ELSEIF IN_OPTION = '5' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936CREGI) = UPPER(''' || IN_CODE || ''')';
        ELSEIF IN_OPTION = '6' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936CSREG) = UPPER(''' || IN_CODE || ''')';
        END IF;
    END IF;

    -- Filtro NAME si existe (mayúsculas/minúsculas ignoradas)
    IF IN_NAME <> '' THEN
        IF IN_OPTION = '1' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NATTO) = UPPER(''' || IN_NAME || ''')';
        ELSEIF IN_OPTION = '2' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NCITY) = UPPER(''' || IN_NAME || ''')';
        ELSEIF IN_OPTION = '3' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NPAIS) = UPPER(''' || IN_NAME || ''')';
        ELSEIF IN_OPTION = '4' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NZONE) = UPPER(''' || IN_NAME || ''')';
        ELSEIF IN_OPTION = '5' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NREGI) = UPPER(''' || IN_NAME || ''')';
        ELSEIF IN_OPTION = '6' THEN
            SET V_SQL = V_SQL || ' AND UPPER(X.A2936NCSRG) = UPPER(''' || IN_NAME || ''')';
        END IF;
    END IF;

    --------------------------------------------------------------------
    -- Paginación
    --------------------------------------------------------------------
    SET IO_PAGNUM  = PRAXIS.F0001('PAGNUM', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_PAGROW  = PRAXIS.F0001('PAGROW', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_TOTPAG  = PRAXIS.F0001('TOTPAG', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_TOTROW  = PRAXIS.F0001('TOTROW', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET PAGROWINIT = PRAXIS.F0001('PRINIT', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);

    -- Obtener total de filas si aún no se ha calculado
    IF IO_TOTROW = -1 THEN
        SET SQLPAG01 = 'SELECT COUNT(1) FROM (' || V_SQL || ') AS C';
        PREPARE STMTQRY01 FROM SQLPAG01;
        OPEN CURQRY01;
        FETCH CURQRY01 INTO IO_TOTROW;
        CLOSE CURQRY01;
    END IF;

    --------------------------------------------------------------------
    -- Query final con paginación
    --------------------------------------------------------------------
    SET SQLPAG01 = 'SELECT * FROM (' || V_SQL || ') AS RS WHERE RS.RN > ' 
                    || CAST(PAGROWINIT AS VARCHAR(20));

    IF IO_PAGROW > 0 THEN
        SET SQLPAG01 = SQLPAG01 || ' FETCH FIRST ' || CAST(IO_PAGROW AS VARCHAR(20)) || ' ROWS ONLY';
    END IF;

    PREPARE STMTQRY01 FROM SQLPAG01;
    OPEN CURQRY01;

END





GRANT ALL ON PROCEDURE PRAXISBI.SQP05813 TO PUBLIC  




