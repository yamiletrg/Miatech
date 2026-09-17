

/**********************************************************************/
SELECT * FROM PRAXISMP.MPF100 
WHERE 
--BANDOC ='1700094824' 
-- fecha date bank 20250304
DATECI='20250916' -- fecha del padre posting date
AND TRANCI = '000000557'  


/**********************************************************************/
SELECT * FROM PRAXISMP.MPF083
--WHERE PRDA BETWEEN '20240930' AND '20240930'
WHERE CODPRO='CM'