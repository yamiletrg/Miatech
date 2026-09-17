


/*
 * Bank NIT Catalog
 * MPF153
 * Primary key = ID_NIT
 * 
 * CRUD 
 * 
 * 
 * GUIA: 
 * BUSCA: PXSAUDIT.SQP05649 AM
 * JALA LA DATA PARA EDITAR: SQP05648
 *  
 * CREA/ACTUALIZA/ELIMINA: PXSAUDIT.SQP05402   (IN_OPTON)
)
 * */


GRANT ALL ON PROCEDURE PRAXISMP.MPS244 TO PUBLIC

SELECT * FROM PRAXISMP.MPF153
WHERE NIT='30574816870' 
AND CCUST ='134'

CALL PRAXISMP.MPS244('134','30598910045',0, 0, 0, 0)


SELECT COLUMN_NAME, DATA_TYPE
FROM QSYS2.SYSCOLUMNS
WHERE TABLE_SCHEMA = 'PRAXISMP' 
  AND TABLE_NAME = 'MPF153'
  AND COLUMN_NAME IN ('FECR', 'HOCR', 'FEUP', 'HOUP');
------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------


GRANT ALL ON PROCEDURE PRAXISMP.MPS244  TO PUBLIC

---------------------------------------------------------------------------








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
			   X.DESCR,
			   X.CODPRO,
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





CALL PRAXISMP.MPS244('134','BSM970519DU8')





