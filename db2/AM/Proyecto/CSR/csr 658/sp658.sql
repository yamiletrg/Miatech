SELECT * FROM PXSAUDIT.A4877



-------------------------------------------------------------------------------------------
---SIN PAGINADO
-------------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE PXSAUDIT.SQP05832  
(
   IN IN_OPTION VARCHAR(1),       -- 1 = PNR exacto, 2 = Fecha PRDA (from/to)
   IN IN_DATEFROM VARCHAR(8),     
   IN IN_DATETO VARCHAR(8),       
   IN IN_CCUST VARCHAR(10)        
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PXSAUDIT.SQP05832
BEGIN
    DECLARE V_SQL VARCHAR(30000);  
    DECLARE CURQRY01 CURSOR WITH RETURN FOR STMTQRY01;

    --------------------------------------------------------------------
    -- BASE QUERY
    --------------------------------------------------------------------
    SET V_SQL = '
        SELECT X.*
        FROM PXSAUDIT.A2532 X
        WHERE 1=1
          AND X.CCUST = ''' || IN_CCUST || '''
    ';

    --------------------------------------------------------------------
    -- FILTRO S
    --------------------------------------------------------------------
    IF IN_OPTION = '1' THEN
        -- FILTRAR POR PNR EXACTO
        SET V_SQL = V_SQL || ' AND X.A2532PNR = ''' || IN_DATEFROM || '''';

    ELSEIF IN_OPTION = '2' THEN
        -- FILTRAR POR RANGO PRDA (FROM–TO)
        SET V_SQL = V_SQL 
            || ' AND X.A2532PRDA BETWEEN ''' 
            || IN_DATEFROM || ''' AND ''' || IN_DATETO || '''';
    END IF;

    
    PREPARE STMTQRY01 FROM V_SQL;
    OPEN CURQRY01;

END





--------------------------------------------------------------------
-- CON PAGINADO
--------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE PXSAUDIT.SQP05832  
(
   IN IN_OPTION VARCHAR(1),       -- 1 = PNR, 2 = Fecha PRDA 
   IN IN_CCUST VARCHAR(10),
   IN IN_DATEFROM VARCHAR(8),     
   IN IN_DATETO VARCHAR(8),      
   IN IN_PNR VARCHAR(8),  
   INOUT IO_PAGNUM INTEGER,
   INOUT IO_PAGROW INTEGER,
   INOUT IO_TOTPAG INTEGER,
   INOUT IO_TOTROW INTEGER
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PXSAUDIT.SQP05832
BEGIN
    DECLARE V_SQL        VARCHAR(30000);  
    DECLARE PAGROWINIT   INTEGER;
    DECLARE SQLPAG01     VARCHAR(30000);
    DECLARE CURQRY01 CURSOR WITH RETURN FOR STMTQRY01;

    SET V_SQL = '
        SELECT ROW_NUMBER() OVER (ORDER BY X.ID ASC) AS RN,
               X.*
        FROM PXSAUDIT.A4877 X
        WHERE 1=1
          AND X.CCUST = ''' || IN_CCUST || '''     -- Siempre se filtra
    ';

    --------------------------------------------------------------------
    -- FILTROS 
    --------------------------------------------------------------------
    --------------------------------------------------------------------
-- FILTROS 
--------------------------------------------------------------------
	IF IN_OPTION = '1' THEN
	    -- SOLO PNR
	    IF IN_PNR IS NOT NULL AND IN_PNR <> '' THEN
	        SET V_SQL = V_SQL || ' AND X.PNR = ''' || IN_PNR || '''';
	    END IF;
	
	ELSEIF IN_OPTION = '2' THEN
	    -- SOLO FECHAS
	    IF IN_DATEFROM IS NOT NULL AND IN_DATEFROM <> '' 
	       AND IN_DATETO IS NOT NULL AND IN_DATETO <> '' THEN
	        SET V_SQL = V_SQL 
	            || ' AND X.PRDA BETWEEN ''' 
	            || IN_DATEFROM || ''' AND ''' || IN_DATETO || '''';
	    END IF;
	
	END IF;

	

    --------------------------------------------------------------------
    -- PAGINACIÓN
    --------------------------------------------------------------------
    SET IO_PAGNUM  = PRAXIS.F0001('PAGNUM', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_PAGROW  = PRAXIS.F0001('PAGROW', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_TOTPAG  = PRAXIS.F0001('TOTPAG', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET IO_TOTROW  = PRAXIS.F0001('TOTROW', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);
    SET PAGROWINIT = PRAXIS.F0001('PRINIT', IO_PAGNUM, IO_PAGROW, IO_TOTPAG, IO_TOTROW);

    IF IO_TOTROW = -1 THEN
        SET SQLPAG01 = 'SELECT COUNT(1) FROM (' || V_SQL || ') AS C';
        PREPARE STMTQRY01 FROM SQLPAG01;
        OPEN CURQRY01;
        FETCH CURQRY01 INTO IO_TOTROW;
        CLOSE CURQRY01;
    END IF;

    SET SQLPAG01 = 'SELECT * FROM (' || V_SQL || ') AS RS WHERE RS.RN > ' 
                   || CAST(PAGROWINIT AS VARCHAR(20));

    IF IO_PAGROW > 0 THEN
        SET SQLPAG01 = SQLPAG01 || ' FETCH FIRST ' || CAST(IO_PAGROW AS VARCHAR(20)) 
                        || ' ROWS ONLY';
    END IF;

    PREPARE STMTQRY01 FROM SQLPAG01;
    OPEN CURQRY01;

END

