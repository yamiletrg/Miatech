/**
 * 
 * 
 * BACKUP

CREATE PROCEDURE PRAXIS.SQP05068 ( IN VP_CCUST CHAR(3),
                                   IN VP_FPROC1 CHAR(8),
                                   IN VP_FPROC2 CHAR(8) )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXIS.SQP05068

BEGIN
	*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
    ++ HISTORIAL DE CAMBIOS
    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ++  DEV     CODE    DATE        DESCRIPCION                                        
    ++  VHO     202300  13/09/2023  Creacion de SP
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
	DECLARE QRY01 CURSOR FOR			
	SELECT * FROM PRAXIS . A4493
	WHERE	A4493CCUST = VP_CCUST AND
			A4493PRDA BETWEEN VP_FPROC1 AND VP_FPROC2 ;
	OPEN QRY01 ;		
	
	END

*/















CREATE  OR REPLACE PROCEDURE PRAXIS.SQP05068 ( IN VP_CCUST CHAR(3),
                                   IN VP_FPROC1 CHAR(8),
                                   IN VP_FPROC2 CHAR(8) )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXIS.SQP05068

BEGIN
	/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
    ++ HISTORIAL DE CAMBIOS
    ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    ++  DEV     CODE    DATE        DESCRIPCION                                        
    ++  VHO     202300  13/09/2023  Creacion de SP
    ++  YR              23/10/2025  Obtiene el comentario nuevo
	++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	
	--OLD
	/*DECLARE QRY01 CURSOR FOR			
	SELECT * FROM PRAXIS . A4493
	WHERE	A4493CCUST = VP_CCUST AND
			A4493PRDA BETWEEN VP_FPROC1 AND VP_FPROC2 ;
	OPEN QRY01 ;		
	
	END*/
	
	--NEW
	DECLARE QRY01 CURSOR WITH RETURN TO CALLER FOR
    SELECT A.*,
           B.*
    FROM PRAXIS.A4493 A
    LEFT JOIN PRAXIS.A4859 B
      ON  A.A4493CCUST = B.A4859CCUST
      AND A.A4493PRDA  = B.A4859FECHA
      AND A.A4493PAIS  = B.A4859PAIS
      AND A.A4493MDA   = B.A4859MDA
    WHERE A.A4493CCUST = VP_CCUST
      AND A.A4493PRDA BETWEEN VP_FPROC1 AND VP_FPROC2;

	OPEN QRY01;

END

GRANT ALL ON PROCEDURE PRAXIS.SQP05068 TO PUBLIC 
--lunes coment 

CALL PRAXIS.SQP05068('139','20220306','20220309')


SELECT * FROM PRAXIS.A4493