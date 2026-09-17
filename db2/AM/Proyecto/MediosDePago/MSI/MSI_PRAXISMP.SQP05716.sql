

--<ScriptOptions statementTerminator=";"/>

CREATE OR REPLACE PROCEDURE PRAXISMP.SQP05716 ( IN IN_PRDAF VARCHAR(8),
                                     IN IN_PRDATO VARCHAR(8),
                                     INOUT IO_PAGNUM INTEGER,
                                     INOUT IO_PAGROW INTEGER,
                                     INOUT IO_TOTPAG INTEGER,
                                     INOUT IO_TOTROW INTEGER )
	RESULT SETS 1
	LANGUAGE SQL
	SPECIFIC PRAXISMP.SQP05716

BEGIN
DECLARE V_SQL VARCHAR ( 30000 ) ;
DECLARE CURRES CURSOR FOR STMTRES ;

-- Construimos el SQL dinámico
SET V_SQL = '
    SELECT ROW_NUMBER() OVER(ORDER BY FPROC, TKT) AS RN,
           PROCESADOR, FPROC, FVTA,TKT, CANAL, MDALIQ, MONTOLIQ, MDABOL, TARIFBOL,  RFIC, RFIS,  TARJETA, AUTH, INSTANBR,  NBRINSTA, BANCO,
           (SELECT A4496SFUEN
            FROM PRAXISMP.A4496
            WHERE A4496CCUST = SUBSTRING(TKTS,1,3)
              AND A4496CIA   = SUBSTRING(TKTS,4,3)
              AND A4496FORMA = SUBSTRING(TKTS,7,4)
              AND A4496SERIE = SUBSTRING(TKTS,11,6)
              AND A4496SEQ   = SUBSTRING(TKTS,17,2)
              AND A4496TDOC  = SUBSTRING(TKTS,19,1)
           ) AS CANALTKT,
           COALESCE((
               SELECT A720TTAX
               FROM PRAXIS.A720
               WHERE A720AIRLIN = SUBSTRING(TKT,1,3)
                 AND A720CIA    = SUBSTRING(TKT,1,3)
                 AND A720FORMA  = SUBSTRING(TKT,5,4)
                 AND A720SERIE  = SUBSTRING(TKT,9,6)
                 AND A720SEQ    = ''00''
           ),0) AS TAX
    FROM (
        SELECT PROCTYPE AS PROCESADOR,
               PRDA AS FPROC,
               A4501FECVT AS FVTA,
               --A4501CIA || '-' || A4501FORMA || A4501SERIE AS TKT,
			   CONCAT(CONCAT(CONCAT(A4501CIA, '-'), A4501FORMA), A4501SERIE) AS TKT,
               A4496SFUEN AS CANAL,
               SCURRENCY AS MDALIQ,
               TGROSAMOUN AS MONTOLIQ,
               A4501MFOP AS MDABOL,
               A4501VFOP AS TARIFBOL,
               A4496RFIC AS RFIC,
               A4496RFIS1 AS RFIS,
               SCARDN AS TARJETA,
               SAUTHOC AS AUTH,
               INSTANBR,
               NBRINSTA,
               COALESCE((
                   SELECT TRIM(A4775BANCO)
                   FROM PRAXISMP.A4775
                   WHERE A4775NUMTJ = SCARDN
                     AND A4775NUMAT = SAUTHOC
                   FETCH FIRST 1 ROWS ONLY
               ), '''') AS BANCO,
               (SELECT LISTAGG(CCUST||CCIA||FORMA||SERIE||SEQ||TDOC, ''-'')
                       WITHIN GROUP (ORDER BY CCIA, FORMA, SERIE, SEQ, TDOC)
                FROM PRAXISMP.A4335 B
                WHERE B.CCUST=A.CCUST
                  AND B.PRDA=A.PRDA
                  AND B.AREFNBR=A.AREFNBR
                  AND CCIA||FORMA||SERIE != A4501CIA||A4501FORMA||A4501SERIE
               ) AS TKTS
        FROM PRAXISMP.A4331 A
        INNER JOIN PRAXISMP.A4501
            ON A4501CCUST=CCUST
           AND A4501PRDA=PRDA
           AND A4501ARN=AREFNBR
        INNER JOIN PRAXISMP.A4496
            ON A4496CCUST=A4501CCUST
           AND A4496CIA=A4501CIA
           AND A4496FORMA=A4501FORMA
           AND A4496SERIE=A4501SERIE
           AND A4496SEQ=A4501SEQ
           AND A4496TDOC=A4501TDOC
        WHERE CCUST = ''139''
          AND PRDA BETWEEN ''' || IN_PRDAF || ''' AND ''' || IN_PRDATO || '''
          AND INSTANBR<>0
		  AND TDOC=''S''
          AND LEFT(A4496TIPOD,3)=''EMD''
          AND LEFT(A4496RFIS1,1)=''M''
    ) TMP
' ;


-- Llamamos al paginador
CALL PRAXISMP . PAGINATE ( V_SQL , IO_PAGNUM , IO_PAGROW , IO_TOTPAG , IO_TOTROW ) ;

-- Preparamos y abrimos el cursor
PREPARE STMTRES FROM V_SQL ;
OPEN CURRES ;
END



