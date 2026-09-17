

-- columnas de tabla
SELECT * FROM QSYS2.SYSCOLUMNS
WHERE TABLE_NAME = 'A2393' 
  AND TABLE_SCHEMA = 'PXFARES'

  
SELECT COLUMN_NAME,COLUMN_HEADING,LENGTH FROM QSYS2.SYSCOLUMNS
WHERE TABLE_NAME = 'A2393' 
  AND TABLE_SCHEMA = 'PXFARES'
}







/*
 * 
 |  #  | Store      | Tabla   |    Tipo    | Descripción         |
| :-: | :--------- | :------ | :--------: | :------------------ |
| 01  | `SQP06107` | `A2390` |   🔵 R1    | Fare Class ATPCO    |  
| 02  | `SQP06108` | `A2393` |   🟣 R2    | Rules ATPCO         |
| 03  | `SQP06109` | `A2245` |   🟢 R3    | Categories ATPCO    |
| 04  | `SQP06110` | `A2372` | 🟡 R3 S900 | Tablas Auxiliares   |
| 05  | `SQP06111` | `A2468` |   🟣 R2    | Footnotes           |
| 06  | `SQP06112` | `A2419` |  🔴 FARE   | Tarifas             |
| 07  | `SQP06113` | `A2233` |  🟠 AP A   | Passenger Type Code |
| 08  | `SQP06114` | `A2234` |  🟠 AP B   | Services            |
| 09  | `SQP06115` | `A2235` |  🟠 AP C   | Zones               |
| 10  | `SQP06116` | `A2236` |  🟠 AP D   | Country Currency    |
| 11  | `SQP06117` | `A2237` |  🟠 AP E   | State Province      |
| 12  | `SQP06118` | `A2238` |  🟠 AP F   | Equipment Codes     |
| 13  | `SQP06119` | `A2239` |  🟠 AP G   | TSIs                |
| 14  | `SQP06120` | `A2240` |  🟠 AP H   | Tariff Matrix       |
| 15  | `SQP06121` | `A2241` |  🟠 AP I   | Surcharge Codes     |
| 16  | `SQP06122` | `A2242` |  🟠 AP J   | Global Area         |
| 17  | `SQP06123` | `A2243` |  🟠 AP K   | Group Type          |
| 18  | `SQP06124` | `A2244` |  🟠 AP L   | Tour Type           |
 * 
 */


--=================================================================================================================



-- Fare Class ATPCO - R1(SQP06108)
SELECT * FROM PXFARES.A2390
SELECT * FROM PXFARES.A2390 WHERE A2390DDISC!= '0999999'
-- 20140220 |20140701

--=================================================================================================================
-- Fare - TARIFAS(SQP06112)
SELECT * FROM PXFARES.A2419
SELECT * FROM PXFARES.A2419 WHERE A2419DISC <> '000000'
SELECT A2419EFFE,A2419DISC,A2419TARDT  FROM PXFARES.A2419
SELECT A2419EFFE,A2419DISC,A2419TARDT FROM PXFARES.A2419 WHERE A2419EFFE <> '000000'

SELECT *
FROM PXFARES.A2419 A
WHERE 
	A2419CXRCD ='AM'
	AND A2419OCITY='ATL'
	AND A2419DCITY ='SHA'
	AND A2419FCLAS='AOPM'
  	AND A2419DISC = '131012'
	AND A2419TARDT = '130215'
FETCH FIRST 10 ROWS ONLY;

--- 
--- A2419TARDT = efectividad, 
--- A2419GDATE = creacion 
-- A2419EFFE|A2419DISC
-- 000000   |131012   

/*
 * A2419H -> LOGICO
A2419CXRCD  -> carrier
A2419OCITY -> origen
A2419DCITY -> destino
A2419FCLAS  -Z fare basis 
A2419DISC  - > discontinuidad
A2419TARDT  - > efectividad
*/


--=================================================================================================================
-- RULES ATPCO - R2 (SQP06108)
SELECT * FROM PXFARES.A2393
SELECT * FROM PXFARES.A2393 WHERE A2393DISC!= '0999999'
-- 20140116  |20140630


--=================================================================================================================
-- CATEGORIES ATPCO - R3 (SQP06109)
SELECT * FROM PXFARES.A2245

SELECT * FROM PXFARES.A2245 WHERE A2245CATNO='020'



--=================================================================================================================
-- R3 S900 (SQP06110)
SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='961'
SELECT * FROM PXFARES.A2372 WHERE A2372TBLNO='961'


SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='9674'


/*
 * 
 *
961 -no hay
989 -
990 -
986 -
979 - 
974 - no hay
995 - 
997-1 - no hay
997-2 - no hay
997-3 - no hay 
994 -
999 -
988 - 
993 -
966 - no hay
983 - 
976 -
978 -
987 -


Apendice
TAB 1 - A
TAB 8 - H
TAB 9 - I
TAB 10- J
TAB 11 - K
TAB 12 - L
TAB 13 - M
 * 
 */




--=================================================================================================================
-- Footnotes R2 (SQP06111)
SELECT * FROM PXFARES.A2468


--=================================================================================================================
-- Apendice A (SQP06113)
SELECT * FROM PXFARES.A2233


--=================================================================================================================
-- Apendice H (SQP06120)
SELECT * FROM PXFARES.A2240


--=================================================================================================================
-- Apendice I (SQP06121)
SELECT * FROM PXFARES.A2241


--=================================================================================================================
-- Apendice J (SQP06122)
SELECT * FROM PXFARES.A2242


--=================================================================================================================
-- Apendice K (SQP06123)
SELECT * FROM PXFARES.A2243


--=================================================================================================================
-- Apendice L (SQP06124)
SELECT * FROM PXFARES.A2244







--=================================================================================================================
-- serie 900
SELECT * FROM PXFARES.A2372

SELECT
    A2372TBLID,
    A2372TBLNO,
    A2372TRAMA
FROM PXFARES.A2372
WHERE A2372TBLID IN ('961')
FETCH FIRST 100 ROWS ONLY


SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='961'
SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='974'
SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='997'
SELECT * FROM PXFARES.A2372 WHERE A2372TBLID='966'