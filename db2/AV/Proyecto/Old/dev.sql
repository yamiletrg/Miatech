
-- CREAR MENU
SELECT * FROM PRAXIS.INF021 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;
INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','15','820','00004','Bank NIT Catalog','','PX00000966','','','A','SAV54D','20250925','170000','10.0.0.83','','','','');


--CREAR SUBMENU
SELECT * FROM PRAXIS.INF050 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;
INSERT INTO PRAXIS.INF050(APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM) 
VALUES ('PX','PX00000966','Bank NIT Catalog','bank-nit-catalog--form','','','A','SAV54','20250925','170000','10.0.0.83','','','','');


--PERMISOS
SELECT * FROM PRAXIS.INF053 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;
INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAV54D','PX','PX00000966','Y','Y','Y','Y','Y','Y','A','SAV54D','2025-09-25 15:36:01');



CREATE OR REPLACE PROCEDURE PRAXISMP.MPS295 (  
											IN IN_IDCONT  VARCHAR(25) DEFAULT '',
										    IN IN_BANDOC  VARCHAR(25) DEFAULT '',
										    IN IN_DATECI  VARCHAR(25) DEFAULT '',
										    IN IN_TRANCI  VARCHAR(25) DEFAULT ''
											)
											  
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
		        SET V_WHERE = 'IDCONT = ''' || IN_IDCONT || '''';
		    ELSEIF IN_BANDOC IS NOT NULL AND IN_BANDOC <> '' 
		       AND IN_DATECI IS NOT NULL AND IN_DATECI <> '' 
		       AND IN_TRANCI IS NOT NULL AND IN_TRANCI <> '' THEN
		        SET V_WHERE = 'BANDOC = ''' || IN_BANDOC || '''
		                       AND DATECI = ''' || IN_DATECI || '''
		                       AND TRANCI = ''' || IN_TRANCI || '''';
		    ELSE
		        SET V_WHERE = '1=0';
		    END IF;
		
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
		                      AND B.CODPRO = A.CODPRO) AS QTY_TKT,
							(SELECT LISTAGG(B.CCIA||B.FORMA||B.SERIE,''-'')
		                    FROM PRAXISMP.MPF100 B 
		                    WHERE B.DATEC = A.DATEC 
		                      AND B.TRANC = A.TRANC 
		                      AND B.CODPRO = A.CODPRO)
							 LST_TKT
		            FROM PRAXISMP.MPF101 A
		            WHERE ' || V_WHERE || '
		              AND TDOC = ''S''
		              AND TDOCORG = ''''
		              AND STVAL IN (''1'',''5'')
		        ) AS TBL
		        ORDER BY SUM_DIFF DESC, GENCON
		    ';

PREPARE STMTQRY01 FROM V_SQL ;
OPEN CURQRY01 ;
END














------------------------


CREATE OR REPLACE PROCEDURE PRAXISMP.MPS244 
(
    IN IN_CCUST VARCHAR(3),
    IN IN_NIT VARCHAR(40)
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PRAXISMP.MPS244
BEGIN
    /*******************************************************************************************************
    * 24/09/2025 CREATE PROGRAM YR
    * TITLE PROGRAM: Bank NIT Catalog
    * DEFINITIONS:
    *   - Lista los NIT registrados por cliente (sin paginación)
    *********************************************************************************************************/

    DECLARE V_SQL   VARCHAR(30000);  
    DECLARE CURRES CURSOR FOR STMTRES;

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
    PREPARE STMTRES FROM V_SQL;
    OPEN CURRES;

END





















/***************************************************************/






SELECT * FROM PRAXISMP.MPF083
--WHERE PRDA BETWEEN '20240930' AND '20240930'
--WHERE PRDA='20240930' 
WHERE  CODPRO='CM' AND PRDA='20240930' 


