
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

--- CSR 1301
	
/*
 * Se solicita actualizar el estatus del país BSP NI a partir de una 
 * fecha determinada, para que sea considerado con el estatus 
 * “Unscheduled File” (lunes a domingo), ya que, de acuerdo con
 * la confirmación del cliente AM, no se recibirán más archivos de este país.
 * */	
	
--FUENTE:BSP - PAIS:NI     | PONER EN LOS DIAS = 'N'  (NO RECIBIRA)
	SELECT * FROM PRAXIS.A4491 WHERE A4491FUENT ='BSP' AND A4491PAIS='NI'

	UPDATE PRAXIS.A4491 
	SET A4491LUN = 'N', A4491MAR = 'N', A4491MIE ='N', A4491JUE='N', A4491VIE='N', A4491SAB='N', A4491DOM='N'
	WHERE A4491PAIS IN('NI') AND A4491FUENT ='BSP'
		
	
	
/*
 * Se solicita cambiar la prioridad de recepción en el país BSP BG, 
 * para que se considere como moneda prioritaria la de EUR y no BGN 
 * como esta actualmente, y en caso de que BGN no se reciba se 
 * considere con el estatus “Currency File not reported
 * */
	
--FUENTE:BSP - PAIS:BG     |  MONEDA PRORITARIA EUR
SELECT * FROM PRAXIS.A4491 WHERE A4491FUENT ='BSP' AND A4491PAIS='BG'

UPDATE PRAXIS.A4491 
SET A4491FLG = 'Y'
WHERE A4491PAIS IN('BG') AND A4491MDA ='BGN'
	
--- CAMBIAR DE POSICION 



/*
SELECT * FROM PRAXIS.A4469 WHERE A4469PDATE ='20260106'
SELECT * FROM PRAXIS.A4493 WHERE A4493PRDA='20260106'
*/

--'20260106'










-- BUSQUEDA WEB 
SELECT * FROM PRAXIS.SQP05015









