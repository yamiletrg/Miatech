

-- MODIFICACION 18/11/2025

	--SELECT * FROM PRAXIS . A4491 WHERE A4491PAIS='VE'
	
	UPDATE PRAXIS.A4491 
	SET A4491LUN = 'N', A4491MAR = 'N', A4491MIE ='N', A4491JUE='N', A4491VIE='N', A4491SAB='N', A4491DOM='N'
	WHERE A4491PAIS IN('VE')
		
	
	
	--SELECT * FROM PRAXIS . A4491 WHERE A4491FUENT='ARC' 
	
	UPDATE PRAXIS.A4491 
	SET A4491MAR = 'N'
	WHERE A4491FUENT='ARC' 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	------OLD 
	
--TABLA CALENDARIO

--- CAMBIAR EN LA TABLA CALENDARIO A N= NO, S = SI   : para lo que recibe
--- AGREGAR FILA PARA PAIS BG - LA MONEDA
	
	
	SELECT * FROM PRAXIS . A4491 WHERE A4491PAIS IN ('BG','CL','RS')
	
	SELECT * FROM PRAXIS . A4491 WHERE A4491PAIS = 'BG'
	-- OK
	
---====================================================================================
-- actualizar estados paises fin de semana	
UPDATE PRAXIS.A4491
SET 
    A4491SAB = 'S',
    A4491DOM = 'S'
WHERE A4491PAIS IN ('AU', 'CA', 'HK', 'ID', 'JP', 'MY', 'NZ', 'PH', 'SG', 'TH', 'TW');

-- insertar nueva moneda BG

INSERT INTO PRAXIS.A4491 (
    A4491CCUST,
    A4491FUENT,
    A4491PAIS,
    A4491MDA,
    A4491LUN,
    A4491MAR,
    A4491MIE,
    A4491JUE,
    A4491VIE,
    A4491SAB,
    A4491DOM,
    A4491FLG,
    A4491USRIN,
    A4491FECIN,
    A4491HORIN,
    A4491USRAC,
    A4491FECAC,
    A4491HORAC
)
VALUES (
    '139',
    'BSP',
    'BG',
    'EUR',
    'S',
    'S',
    'S',
    'S',
    'S',
    'S',
    'S',
    'Y',
    'SAP04',
    '20230825',
    '145000',
    '',
    '',
    ''
);
---====================================================================================

	

----old 2025-10-29
/*
A4491CCUST|A4491FUENT|A4491PAIS|A4491MDA|A4491LUN|A4491MAR|A4491MIE|A4491JUE|A4491VIE|A4491SAB|A4491DOM|A4491FLG|A4491USRIN|A4491FECIN|A4491HORIN|A4491USRAC|A4491FECAC|A4491HORAC|
----------+----------+---------+--------+--------+--------+--------+--------+--------+--------+--------+--------+----------+----------+----------+----------+----------+----------+
139       |BSP       |AU       |AUD     |S       |S       |S       |S       |S       |S       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |CA       |CAD     |S       |S       |S       |S       |S       |S       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |HK       |HKD     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |ID       |IDR     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |JP       |JPY     |S       |S       |S       |S       |S       |S       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |MY       |MYR     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |NZ       |NZD     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |PH       |PHP     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |PH       |USD     |S       |S       |S       |S       |S       |N       |N       |Y       |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |TH       |THB     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |TW       |TWD     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
139       |BSP       |SG       |SGD     |S       |S       |S       |S       |S       |N       |N       |        |SAP04     |20230825  |145000    |          |          |          |
	
*/	
	



































----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

--- CSR 1301



	
	UPDATE PRAXIS.A4491 
	SET A4491LUN = 'N', A4491MAR = 'N', A4491MIE ='N', A4491JUE='N', A4491VIE='N', A4491SAB='N', A4491DOM='N'
	WHERE A4491PAIS IN('VE')
		
	
	
	--SELECT * FROM PRAXIS . A4491 WHERE A4491FUENT='ARC' 
	
	UPDATE PRAXIS.A4491 
	SET A4491MAR = 'N'
	WHERE A4491FUENT='' 
	
	
	
	
	
--FUENTE:BSP - PAIS:NI     | PONER EN LOS DIAS = 'N'  (NO RECIBIRA)
	SELECT * FROM PRAXIS.A4491 WHERE A4491FUENT ='BSP' AND A4491PAIS='NI'


	
--FUENTE:BSP - PAIS:NI     | PONER EN LOS DIAS = 'N'  (NO RECIBIRA)


	
	
	








