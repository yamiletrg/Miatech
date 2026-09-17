CREATE PROCEDURE PRAXISMP.MPS295 ( IN IN_IDCONT VARCHAR(25),
                                   IN IN_BANDOC VARCHAR(25),
                                   IN IN_DATECI VARCHAR(25),
                                   IN IN_TRANCI VARCHAR(25) )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXISMP.MPS295

BEGIN
/*
     * Liquidaciones Credomatic
     */
DECLARE V_SQL VARCHAR ( 8000 ) ;
DECLARE V_WHERE VARCHAR ( 5000 ) DEFAULT '' ;

-- Cursor 
DECLARE CURQRY01 CURSOR WITH RETURN FOR STMTQRY01 ;

			IF IN_IDCONT IS NOT NULL AND IN_IDCONT <> '' THEN
		SET V_WHERE = 'IDCONT = ''' || IN_IDCONT || '''' ;
		ELSEIF IN_BANDOC IS NOT NULL AND IN_BANDOC <> ''
		AND IN_DATECI IS NOT NULL AND IN_DATECI <> ''
		AND IN_TRANCI IS NOT NULL AND IN_TRANCI <> '' THEN
		SET V_WHERE = 'BANDOC = ''' || IN_BANDOC || '''
		                       AND DATECI = ''' || IN_DATECI || '''
		                       AND TRANCI = ''' || IN_TRANCI || '''' ;
		ELSE
		SET V_WHERE = '1=0' ;
		END IF ;
		
		SET V_SQL = '
		        SELECT TBL.*,
		               ((CASE WHEN SCURRENCY = MDA_VTA 
		                      THEN TBL.SVFOP 
		                      ELSE TBL.IMPORTEPAG END) - TBL.SUMA_VTA) AS SUM_DIFF,
		               COALESCE(NULLIF(TRIM(TBL.MDA_VTA), ''''), 
		                        NULLIF(TRIM(TBL.SCURRENCY), ''''), 
		                        TBL.SCURRENCY) AS CURRENCY_FINAL
		        FROM (
		            SELECT BANDOC, SCARDN, SAUTHOC, SDATE, SVFOP, SCURRENCY, IMPORTEPAG, MONEDAPAGO, SAGENT, MERCHNC, STVAL, GENCON,
		                   IFNULL((SELECT SUM(CASE WHEN B.TDOC = ''S'' 
		                                           THEN ABS(B.SVFOP) 
		                                           ELSE ABS(B.SVFOP) * -1 END)
		                           FROM PRAXISMP.MPF100 B 
		                           WHERE B.DATEC = A.DATEC 
		                             AND B.TRANC = A.TRANC 
		                             AND B.CODPRO = A.CODPRO),0) AS SUMA_VTA,
		                   IFNULL((SELECT MAX(SCURRENCY) 
		                           FROM PRAXISMP.MPF100 B 
		                           WHERE B.DATEC = A.DATEC 
		                             AND B.TRANC = A.TRANC 
		                             AND B.CODPRO = A.CODPRO), '''') AS MDA_VTA,
		                   (SELECT COUNT(0) 
		                    FROM PRAXISMP.MPF100 B 
		                    WHERE B.DATEC = A.DATEC 
		                      AND B.TRANC = A.TRANC 
		                      AND B.CODPRO = A.CODPRO) AS QTY_TKT
		            FROM PRAXISMP.MPF101 A
		            WHERE ' || V_WHERE || '
		              AND TDOC = ''S''
		              AND TDOCORG = ''''
		              AND STVAL IN (''1'',''5'')
		        ) AS TBL
		        ORDER BY SUM_DIFF DESC, GENCON
		    ' ;

PREPARE STMTQRY01 FROM V_SQL ;
OPEN CURQRY01 ;
END