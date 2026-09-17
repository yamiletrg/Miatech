CREATE OR REPLACE PROCEDURE PRAXISMP.MPS295 ( IN IN_IDCONT VARCHAR(25) )
    RESULT SETS 1
    LANGUAGE SQL
    SPECIFIC PRAXISMP.MPS295
BEGIN
    /*
     * Liquidaciones Credomatic
     */
    DECLARE V_SQL     VARCHAR(8000);
    DECLARE V_WHERE   VARCHAR(5000) DEFAULT '';

    -- Cursor 
    DECLARE CURQRY01 CURSOR WITH RETURN FOR STMTQRY01;

     SET
		SET V_SQL = '
		    SELECT TBL.*,
		           (TBL.MONTO_MOSTRAR - TBL.SUMA_VTA) AS SUM_DIFF
		    FROM (
		        SELECT BANDOC, SCARDN, SAUTHOC, SDATE, SVFOP, SCURRENCY, IMPORTEPAG, MONEDAPAGO,
		               SAGENT, MERCHNC, STVAL, GENCON,
		
		               COALESCE(
		                   CASE WHEN SCURRENCY = COALESCE((SELECT MAX(SCURRENCY)
		                                                  FROM PRAXISMP.MPF100 B
		                                                  WHERE B.DATEC = A.DATEC
		                                                    AND B.TRANC = A.TRANC
		                                                    AND B.CODPRO = A.CODPRO), SCURRENCY)
		                        THEN SVFOP ELSE IMPORTEPAG END, 0) AS MONTO_MOSTRAR,
		
		               COALESCE(
		                   CASE WHEN SCURRENCY = COALESCE((SELECT MAX(SCURRENCY)
		                                                  FROM PRAXISMP.MPF100 B
		                                                  WHERE B.DATEC = A.DATEC
		                                                    AND B.TRANC = A.TRANC
		                                                    AND B.CODPRO = A.CODPRO), SCURRENCY)
		                        THEN SCURRENCY ELSE MONEDAPAGO END, SCURRENCY) AS MONEDA,
		
		               COALESCE((SELECT SUM(CASE WHEN B.TDOC = ''S'' THEN ABS(B.SVFOP) ELSE -ABS(B.SVFOP) END)
		                         FROM PRAXISMP.MPF100 B
		                         WHERE B.DATEC = A.DATEC AND B.TRANC = A.TRANC AND B.CODPRO = A.CODPRO),0) AS SUMA_VTA,
		
		               (SELECT COUNT(*) FROM PRAXISMP.MPF100 B
		                WHERE B.DATEC = A.DATEC AND B.TRANC = A.TRANC AND B.CODPRO = A.CODPRO) AS QTY_TKT
		
		        FROM PRAXISMP.MPF101 A
		        WHERE IDCONT=''' || IN_IDCONT || '''
		          AND TDOC=''S''
		          AND TDOCORG=''''
		          AND STVAL IN (''1'',''5'')
		    ) AS TBL
		    ORDER BY SUM_DIFF ASC, GENCON
		';



  
    SET V_SQL = REPLACE(V_SQL, '{WHERE}', V_WHERE);

    PREPARE STMTQRY01 FROM V_SQL;
    OPEN CURQRY01;
END





/************************************************************************/

CALL PRAXISMP.MPS295('202REGCM12509250916085641')


SELECT TBL.*,
       --(CASE WHEN SCURRENCY = MDA_VTA THEN TBL.SVFOP ELSE TBL.IMPORTEPAG END) AS AMOUNT,
       ((CASE WHEN SCURRENCY = MDA_VTA 
              THEN TBL.SVFOP 
              ELSE TBL.IMPORTEPAG 
         END) - TBL.SUMA_VTA) AS SUM_DIFF
FROM (
    SELECT BANDOC,
           SCARDN,
           SAUTHOC,
           SDATE,
           SVFOP,
           SCURRENCY,
           IMPORTEPAG,
           MONEDAPAGO,
           SAGENT,
           MERCHNC,
           STVAL,
           GENCON,
           IFNULL((
               SELECT SUM(CASE WHEN B.TDOC = 'S' 
                               THEN ABS(B.SVFOP) 
                               ELSE ABS(B.SVFOP) * -1 END) 
               FROM PRAXISMP.MPF100 B 
               WHERE B.DATEC = A.DATEC 
                 AND B.TRANC = A.TRANC 
                 AND B.CODPRO = A.CODPRO
           ),0) AS SUMA_VTA,
           IFNULL((
               SELECT MAX(SCURRENCY) 
               FROM PRAXISMP.MPF100 B 
               WHERE B.DATEC = A.DATEC 
                 AND B.TRANC = A.TRANC 
                 AND B.CODPRO = A.CODPRO
           ),'') AS MDA_VTA,
           (SELECT COUNT(0) 
            FROM PRAXISMP.MPF100 B 
            WHERE B.DATEC = A.DATEC 
              AND B.TRANC = A.TRANC 
              AND B.CODPRO = A.CODPRO) AS QTY_TKT
    FROM PRAXISMP.MPF101 A
    WHERE IDCONT = '134REGCO12509250916183751'   -- 👈 aquí pruebas con un IDCONT específico
      AND TDOC = 'S' 
      AND TDOCORG = '' 
      AND STVAL IN ('1','5')
) AS TBL 
ORDER BY SUM_DIFF DESC, GENCON;










-------------------------------------------------------------




SELECT TBL.*,(TBL.SVFOP - TBL.SUMA_VTA) SUM_DIFF FROM (
SELECT BANDOC,SCARDN,SAUTHOC,SDATE,SVFOP,SCURRENCY,IMPORTEPAG,MONEDAPAGO,SAGENT,MERCHNC,STVAL,GENCON,
(SELECT SUM(CASE WHEN B.TDOC = 'S' THEN ABS(B.SVFOP) ELSE ABS(B.SVFOP) * -1 END) FROM PRAXISMP.MPF100 B WHERE B.DATEC = A.DATEC AND B.TRANC = A.TRANC AND B.CODPRO = A.CODPRO) SUMA_VTA,
(SELECT MAX(SCURRENCY) FROM PRAXISMP.MPF100 B WHERE B.DATEC = A.DATEC AND B.TRANC = A.TRANC AND B.CODPRO = A.CODPRO) MDA_VTA,
(SELECT COUNT(0) FROM PRAXISMP.MPF100 B WHERE B.DATEC = A.DATEC AND B.TRANC = A.TRANC AND B.CODPRO = A.CODPRO) QTY_TKT
FROM PRAXISMP.MPF101 A
WHERE IDCONT='202REGCM12509250916085641'
--AND BANDOC IN ('CM00001514') 
AND TDOC='S' 
AND TDOCORG='' 
--AND STVAL = '1'
AND STVAL IN ('1','5')
) AS TBL 
--WHERE (TBL.SVFOP - TBL.SUMA_VTA) <> 0
ORDER BY SUM_DIFF ASC, GENCON






