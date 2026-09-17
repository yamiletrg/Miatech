


/*
 * Custom Profit Catalog
 * MPF170
 * Primary key = ID_CEBE
 * 
 * 
)
 * */


GRANT ALL ON PROCEDURE PRAXISMP.MPS244 TO PUBLIC

SELECT * FROM PRAXISMP.MPF170
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

 IN IN_CCUST VARCHAR(3),
    IN IN_SOCIETY VARCHAR(4),
    IN IN_BENCEN VARCHAR(10),
    IN IN_COSTCEN VARCHAR(10),
    IN IN_SCOUNTRY VARCHAR(2),
    IN IN_CODREF VARCHAR(6),
    IN IN_TIPO VARCHAR(3),



SELECT * FROM PRAXISMP.MPF170
CALL PRAXISMP.MPS246('547','','','','')
    
    

CREATE OR REPLACE PROCEDURE PRAXISMP.MPS246
(
    IN IN_CCUST   VARCHAR(3),
    IN IN_CODREF VARCHAR(4),
    IN IN_BENCEN  VARCHAR(10),
    IN IN_SOCIETY VARCHAR(4),
    IN IN_COSTCEN VARCHAR(10)
)
RESULT SETS 1
LANGUAGE SQL
SPECIFIC PRAXISMP.MPS246
BEGIN
    DECLARE CURRES CURSOR WITH RETURN FOR
        SELECT ROW_NUMBER() OVER (ORDER BY X.CCUST, X.ID_CEBE) AS RN,
               X.ID_CEBE,
               X.CCUST,
               X.SOCIETY,
               X.BENCEN,
               X.COSTCEN,
               X.SCOUNTRY,
               X.CODREF,
               X.TIPO,
               COALESCE(TO_CHAR(X.FECR, 'YYYY-MM-DD'), '') AS FECR
        FROM PRAXISMP.MPF170 X
        WHERE X.CCUST = IN_CCUST
          AND X.CODREF = CASE 
                             WHEN TRIM(IN_CODREF) = '' 
                             THEN X.CODREF  
                             ELSE TRIM(IN_CODREF) 
                           END
          AND X.BENCEN = CASE 
                             WHEN TRIM(IN_BENCEN) = '' 
                             THEN X.BENCEN  
                             ELSE TRIM(IN_BENCEN) 
                          END
		  AND X.SOCIETY = CASE 
                             WHEN TRIM(IN_SOCIETY) = '' 
                             THEN X.SOCIETY  
                             ELSE TRIM(IN_SOCIETY) 
                          END
		   AND X.COSTCEN = CASE 
                             WHEN TRIM(IN_COSTCEN) = '' 
                             THEN X.COSTCEN  
                             ELSE TRIM(IN_COSTCEN) 
                          END;

    OPEN CURRES;
END


--CALL PRAXISMP.MPS244('134','BSM970519DU8')





