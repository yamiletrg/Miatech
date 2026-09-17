CREATE PROCEDURE PRAXISMP.SQP05042 ( IN IN_CCUST VARCHAR(3),
                                     IN IN_PRDA VARCHAR(8),
                                     IN IN_TDOC VARCHAR(1),
                                     IN IN_AREFNBR VARCHAR(23) )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXISMP.SQP05042

BEGIN

	/*******************************************************************************************************
 	* 13/09/2025 CREATE PROGRAM
 	* TITLE PROGRAM: Detalle contable de Accounting Transaction TMZ
 	*
 	* DEFINITIONS:

	P	A4183FFILE 	-- FECHA FILE ( PRDA )					PROCESSING DATE
	S	A4183IDFIL	-- FECHA ID FILE ( SALE DATE )			SALE DATE
	X	A4183FPRO 	-- FECHA PROCESADO ( PRDA )				EXECUTE DATE
	A	A4183FCONT	-- FECHA CONTABLE ( ACCOUNTING DATE )	ACCOUNTING DATE

 	*********************************************************************************************************/

	DECLARE V_SQL VARCHAR ( 5000 ) ;
	DECLARE V_WHERE VARCHAR ( 2000 ) DEFAULT '' ;

	DECLARE CURRES CURSOR FOR STMTRES ;

	--LIMPIA PARAMETRO
	SET IN_AREFNBR = TRIM ( IFNULL ( IN_AREFNBR , '' ) ) ;


	SET V_SQL = 'SELECT ROW_NUMBER() OVER () as RN,QRY.* FROM (
					SELECT A.*
	            		,A4183CIA || A4183FORMA || A4183SERIE AS TICKET
	            		,A.A4183CIAF  || A.A4183UNID  || A.A4183CECO  || A.A4183UBICA || A.A4183CUENT || A.A4183SUBCU || A.A4183EQUI  || A.A4183ICIA ACCOUNT
					FROM PRAXISMP.A4183 A
					WHERE A4183CCUST = ''{CCUST}''
					AND A4183FPRO = ''{PRDA}''
	            	{WHERE}
				) QRY' ;

	--SETEO DE VARIABLES
	SET V_SQL = REPLACE ( V_SQL , '{CCUST}' , IN_CCUST ) ;
	SET V_SQL = REPLACE ( V_SQL , '{PRDA}' , IN_PRDA ) ;
-- 	SET V_SQL = REPLACE ( V_SQL , '{TDOC}' , IN_TDOC ) ;
-- 	SET V_SQL = REPLACE ( V_SQL , '{AREFNBR}' , IN_AREFNBR ) ;
	IF ( IN_TDOC <> '' ) THEN
		SET V_WHERE = V_WHERE || ' AND A4183TDOC = ''' || IN_TDOC || ''' ' ;
	END IF ;
	IF ( IN_AREFNBR <> '' ) THEN
		SET V_WHERE = V_WHERE || ' AND A4183AREFN = ''' || IN_AREFNBR || ''' ' ;
	END IF ;

	SET V_SQL = REPLACE ( V_SQL , '{WHERE}' , V_WHERE ) ;


	PREPARE STMTRES FROM V_SQL ;
	OPEN CURRES ;
END


---------------------------------------------------------------------------------------











--- NEW
CREATE OR REPLACE PROCEDURE PRAXISMP.SQP05042 ( IN IN_CCUST VARCHAR(3),
                                     IN IN_PRDA VARCHAR(8),
                                     IN IN_TDOC VARCHAR(1),
                                     IN IN_AREFNBR VARCHAR(23) )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXISMP.SQP05042

BEGIN

	/*******************************************************************************************************
 	* 13/09/2025 CREATE PROGRAM
 	* TITLE PROGRAM: Detalle contable de Accounting Transaction TMZ
 	*
 	* DEFINITIONS:

	P	A4183FFILE 	-- FECHA FILE ( PRDA )					PROCESSING DATE
	S	A4183IDFIL	-- FECHA ID FILE ( SALE DATE )			SALE DATE
	X	A4183FPRO 	-- FECHA PROCESADO ( PRDA )				EXECUTE DATE
	A	A4183FCONT	-- FECHA CONTABLE ( ACCOUNTING DATE )	ACCOUNTING DATE

 	*********************************************************************************************************/

	DECLARE V_SQL VARCHAR ( 5000 ) ;
	DECLARE V_WHERE VARCHAR ( 2000 ) DEFAULT '' ;

	DECLARE CURRES CURSOR FOR STMTRES ;

	--LIMPIA PARAMETRO
	SET IN_AREFNBR = TRIM ( IFNULL ( IN_AREFNBR , '' ) ) ;


	SET V_SQL = 'SELECT ROW_NUMBER() OVER () as RN,QRY.* FROM (
					SELECT A.*
	            		,A4183CIA || A4183FORMA || A4183SERIE AS TICKET
						,A.A4183CLIEN AS CLIENT
	            		,A.A4183CIAF  || A.A4183UNID  || A.A4183CECO  || A.A4183UBICA || A.A4183CUENT || A.A4183SUBCU || A.A4183EQUI  || A.A4183ICIA ACCOUNT
					FROM PRAXISMP.A4183 A
					WHERE A4183CCUST = ''{CCUST}''
					AND A4183FPRO = ''{PRDA}''
	            	{WHERE}
				) QRY' ;

	--SETEO DE VARIABLES
	SET V_SQL = REPLACE ( V_SQL , '{CCUST}' , IN_CCUST ) ;
	SET V_SQL = REPLACE ( V_SQL , '{PRDA}' , IN_PRDA ) ;
-- 	SET V_SQL = REPLACE ( V_SQL , '{TDOC}' , IN_TDOC ) ;
-- 	SET V_SQL = REPLACE ( V_SQL , '{AREFNBR}' , IN_AREFNBR ) ;
	IF ( IN_TDOC <> '' ) THEN
		SET V_WHERE = V_WHERE || ' AND A4183TDOC = ''' || IN_TDOC || ''' ' ;
	END IF ;
	IF ( IN_AREFNBR <> '' ) THEN
		SET V_WHERE = V_WHERE || ' AND A4183AREFN = ''' || IN_AREFNBR || ''' ' ;
	END IF ;

	SET V_SQL = REPLACE ( V_SQL , '{WHERE}' , V_WHERE ) ;


	PREPARE STMTRES FROM V_SQL ;
	OPEN CURRES ;
END



