

SELECT * FROM PRAXISMP.MPF178

WHERE FECR='20250905'

--- HEADER: FILENAME, FILEID, STPRO(L= CARGADO, F=FORMATEO, P= PROCESADO),CORRL, STCAR(queda pendiente)


/*
 * 
 {
    "RN": 1,
    "FILEID": "0000000001",
    "STPRO": "F",
    "FILETYPE": "REJECTED  ",
    "FILEPATH": "\\\\10.0.0.87\\av\\RECHAZOS\\backup\\dev\\REJECTED_TC_2508_250829_160423_134_PAX_CO_1.txt                                                                                                                                                                                                                          ",
    "FILENAME": "REJECTED_TC_2508_250829_160423_134_PAX_CO_1.txt                                                                         ",
    "QTYROWS": 1,
    "HEADER": "TC_134-2025-08_02930",
    "FILEREF": "TC_2508_250829_160423_134_PAX_CO_1.txt                                                                                  ",
    "CORRL": 1,
    "STCAR": "2",
    "USCR": "SAV51T    ",
    "FECR": "20250909",
    "HOCR": "190847",
    "PGMCR": "MPS238    "
}
 **/



SELECT * FROM PRAXISMP.MPF177 

--- delivery: trama ()   --boton ir a delivery

/*
{
    "RN": 1,
    "TRAMA": "20250827\t0038367200011COP\tTC_134-2025-08_02930\t10\tID25:Campo texto incorrecto - 210139                                                                                                                                                                                                                                                                                                                          ",
    "TIPO": "R",
    "FILEID": "0000000001",
    "USCR": "QUSER     ",
    "FECR": "20250909",
    "HOCR": "190846",
    "PGMCR": "APICALL   "
 * */





SELECT * FROM PRAXISMP.MPF179

--- formateo: FILEID, VALDATE(FECHA DE VALOR),SEQ, CERROR,DESCERR, HEADER,STPRO(STATUS PROCESO,Y=, N=NO PROCESADO)   --boton ir a detalle

/*
{
    "RN": 1,
    "FILEID": "0000000001",
    "VALDATE": "20250827",
    "REFER": "0038367200011COP              ",
    "HEADER": "TC_134-2025-08_02930          ",
    "SEQ": 10,
    "CERROR": "25 ",
    "DESCERR": "Campo texto incorrecto - 210139                                                                                                                       ",
    "TIPOREC": " ",
    "STPRO": "Y",
    "STSAV": " ",
    "USCR": "SAV51T    ",
    "FECR": "20250909",
    "HOCR": "190939",
    "PGMCR": "MPS239    ",
    "USUP": "          ",
    "FEUP": "        ",
    "HOUP": "      ",
    "PGMUP": "          "
}  
*/




--------------


--CALL PRAXISMP.MPS294('','','','','','0000000001','D')





CREATE OR REPLACE PROCEDURE PRAXISMP.MPS294
(
	IN IN_DATEF 	VARCHAR(10) ,
	IN IN_DATET     VARCHAR(10) ,
	IN IN_FILENAME  VARCHAR(120) ,
    IN IN_FILEREF  	VARCHAR(120) ,
    IN IN_STATUS    VARCHAR(10) ,
    IN IN_FILEID    VARCHAR(50) ,
    IN IN_MODE      VARCHAR(1), -- 'MAIN' | 'DELIVERY' | 'FORMATO'
    INOUT IO_PAGNUM INTEGER,
    INOUT IO_PAGROW INTEGER,
    INOUT IO_TOTPAG INTEGER,
    INOUT IO_TOTROW INTEGER
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PRAXISMP.MPS294
BEGIN
	DECLARE V_SQL VARCHAR ( 10000 ) ;
	DECLARE PAGROWINIT INTEGER ;
	DECLARE SQLPAG01 VARCHAR ( 1500 ) ;

	-- CURSORES
	DECLARE CUR_MAIN CURSOR FOR STMT_MAIN ;
	DECLARE CUR_DELIV CURSOR FOR STMT_DELIV;
	DECLARE CUR_FORMAT CURSOR FOR STMT_FORMAT;
	
	--------------------------------
	-- PRNCIPAL: MPF178
	--------------------------------
	IF IN_MODE = 'M' THEN
		SET V_SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY X.FECR) AS RN, 
		       X.*
			FROM PRAXISMP.MPF178 X 
			WHERE X.FECR BETWEEN ''' || IN_DATEF || ''' AND ''' || IN_DATET || '''';
			IF IN_FILEID <> '' THEN
		        SET V_SQL = V_SQL CONCAT ' AND X.FILEID = ''' || IN_FILEID || '''';
		    END IF;
		
		    IF IN_FILENAME <> '' THEN
		        SET V_SQL = V_SQL CONCAT ' AND X.FILENAME = ''' || IN_FILENAME || '''';
		    END IF;
		
		    IF IN_FILEREF <> '' THEN
		        SET V_SQL = V_SQL CONCAT ' AND X.FILEREF = ''' || IN_FILEREF || '''';
		    END IF;
		
		    IF IN_STATUS <> '' THEN
		        SET V_SQL = V_SQL CONCAT ' AND X.STPRO = ''' || IN_STATUS || '''';
		    END IF;
			
		/*
		 * WHERE FILEID = '''' 
	
			AND FILENAME = CASE WHEN IFNULL(''' || IN_FILENAME || ''','''') = '''' 
			THEN FILENAME ELSE ''' || IN_FILENAME || ''' END  
			
			AND FILEREF = CASE WHEN IFNULL(''' || IN_FILEREF || ''','''') = '''' 
			THEN FILEREF ELSE ''' || IN_FILEREF || ''' END 
			
			AND STPRO = CASE WHEN IFNULL(''' || IN_STATUS || ''','''') = '''' 
			THEN STPRO ELSE ''' || IN_STATUS || ''' END ' ;
			*/
	
		--CONTEO
		IF IO_TOTROW = - 1 THEN
			SET SQLPAG01 = 'SELECT COUNT(1) FROM (' CONCAT V_SQL CONCAT ') AS C1' ;
			PREPARE STMT_MAIN FROM SQLPAG01 ;
			OPEN CUR_MAIN ;
			FETCH_LOOP : LOOP
			FETCH CUR_MAIN INTO IO_TOTROW ;
			LEAVE FETCH_LOOP ;
			END LOOP FETCH_LOOP ;
			CLOSE CUR_MAIN ;
		END IF ;
		
		--PAGINACIÓN
		SET IO_PAGNUM = PRAXIS . F0001 ( 'PAGNUM' , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;
		SET IO_PAGROW = PRAXIS . F0001 ( 'PAGROW' , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;
		SET IO_TOTPAG = PRAXIS . F0001 ( 'TOTPAG' , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;
		SET IO_TOTROW = PRAXIS . F0001 ( 'TOTROW' , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;
		SET PAGROWINIT = PRAXIS . F0001 ( 'PRINIT' , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;
		
		-- FINAL CON PAG
		SET SQLPAG01 = 'SELECT * FROM (' CONCAT V_SQL CONCAT ') AS RS WHERE RS.RN > ' CONCAT PAGROWINIT ;
		IF IO_PAGROW > 0 THEN
			SET SQLPAG01 = SQLPAG01 CONCAT ' FETCH FIRST ' CONCAT IO_PAGROW CONCAT ' ROWS ONLY' ;
		END IF ;
		
		PREPARE STMT_MAIN FROM SQLPAG01 ;
		OPEN CUR_MAIN ;
	END IF;
	--------------------------------
	-- DELIVERY: MPF177
	--------------------------------	
	IF IN_MODE = 'D' THEN
			
        SET V_SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY X.FILEID) AS RN, ' ||
                    '       X.* ' ||
                    'FROM PRAXISMP.MPF177 X ' ||
                    'WHERE FILEID = ''' || IN_FILEID || ''' ';

        PREPARE STMT_DELIV FROM V_SQL;
        OPEN CUR_DELIV;
    END IF;
	--------------------------------
	-- DELIVERY: MPF179
	--------------------------------	
	IF IN_MODE = 'F' THEN
        SET V_SQL = 'SELECT ROW_NUMBER() OVER (ORDER BY X.FILEID) AS RN, ' ||
                    '       X.* ' ||
                    'FROM PRAXISMP.MPF179 X ' ||
                    'WHERE FILEID = ''' || IN_FILEID || ''' ';

        PREPARE STMT_FORMAT FROM V_SQL;
        OPEN CUR_FORMAT;
    END IF;
	
END

