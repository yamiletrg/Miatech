


/*
 * Bank NIT Catalog
 * MPF153
 * Primary key = ID_NIT
 * 
 * CRUD 
 * 
 * 
 * GUIA: 
 * BUSCA: PXSAUDIT.SQP05649 AM
 * JALA LA DATA PARA EDITAR: SQP05648
 *  
 * CREA/ACTUALIZA/ELIMINA: PXSAUDIT.SQP05402   (IN_OPTON)
)
 * */


GRANT ALL ON PROCEDURE PRAXISMP.MPS245 TO PUBLIC

SELECT * FROM PRAXISMP.MPF153
WHERE NIT='30598910045' 
AND CCUST ='134'

--CALL PRAXISMP.MPS245('134','30598910045',0, 0, 0, 0)


DECLARE V_STATUS INTEGER;
DECLARE V_MESSAGE VARCHAR(300);

-- Crear registro
CALL PRAXISMP.MPS245(
    'C',                 -- IN_OPTION
    NULL,                -- IN_ID_NIT (no aplica en CREATE)
    '134',               -- IN_CCUST
    '30598910045',       -- IN_NIT
    '',                  -- IN_CODPRO
    'Cliente de prueba', -- IN_DESC
    'av-api',            -- IN_PGMRC
);
------------------------------------------------------------------

SELECT * FROM PRAXIS.INF021 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;

SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000659'
/*
 * 
 * CUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
39  |PX    |MAIN      |    1|15  |820  |00003 |Accounts Catalog                                  |                                                  |PX00000659|                                                                                                    |                                                                                                    |A   |UPRAXP    |20240905|170000|10.0.0.83      |          |        |      |               |
 

SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000657'
CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
139  |PX    |MAIN      |    1|15  |820  |00002 |Miscellaneous Catalog                             |                                                  |PX00000657|                                                                                                    |                                                                                                    |A   |UPRAXP    |20240905|170000|10.0.0.83      |          |        |      |               |


* 
 */


INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','15','8200','00004','Bank NIT Catalog','','PX00000675','','','A','UPRAXP','20250722','170000','10.0.0.83','','','','');





INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','15','8200','00004','Bank NIT Catalog','','PX00000675','','','A','UPRAXP','20250722','170000','10.0.0.83','','','','');




/*******************************************************************************************/

/*VARIABLES PARA PRRUEBA*/
CREATE OR REPLACE VARIABLE PRAXISMP.TES_STATUS INTEGER
CREATE OR REPLACE VARIABLE PRAXISMP.TES_MSG VARCHAR(300)
VALUES PRAXISMP.TES_MSG   -- PARA LA RESPUESTA


/*ELIMINAR VARIABLES*/
DROP VARIABLE PRAXISMP.TES_STATUS 
DROP VARIABLE PRAXISMP.TES_MSG

/*PRUEABA*/
CALL PRAXISMP.MPS245('C','','134','','1','pRUEBA','',PRAXISMP.TES_STATUS,PRAXISMP.TES_MSG)



CALL PRAXISMP.MPS245('C','','134','2222222222222222','1','pRUEBA','avi-test',PRAXISMP.TES_STATUS,PRAXISMP.TES_MSG)


GRANT ALL ON PROCEDURE PRAXISMP.MPS245 TO PUBLIC  -- PARA TODOS PUEDAN USAR


SELECT * FROM PRAXISMP.MPF153








/******************************************************************/





CREATE OR REPLACE PROCEDURE PRAXISMP.MPS245 (
  IN IN_OPTION VARCHAR(1),
  IN IN_ID_NIT VARCHAR(3),
  IN IN_CCUST VARCHAR(3),
  IN IN_NIT VARCHAR(40),
  IN IN_CODPRO VARCHAR(3),
  IN IN_DESC VARCHAR(100),
  INOUT OUT_STATUS INTEGER,
  INOUT OUT_MESSAGE VARCHAR(300)
)a
LANGUAGE SQL
SPECIFIC PRAXISMP.MPS245
BEGIN
    SET OUT_STATUS = 0;
    SET OUT_MESSAGE = '';

    CASE IN_OPTION
        WHEN 'C' THEN
            INSERT INTO PRAXISMP.MPF153 (
                CCUST, CODPRO, NIT, DESCR, USCR, FECR, HOCR,PGMCR
            ) VALUES (
                IN_CCUST, IN_CODPRO, IN_NIT, IN_DESC, SESSION_USER, CURRENT_DATE, CURRENT_TIME,'MPS245'
            );
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Created Successfully';

        WHEN 'U' THEN
            UPDATE PRAXISMP.MPF153 T
               SET T.DESCR = IN_DESC,
                   T.CODPRO = IN_CODPRO,
                   T.NIT = IN_NIT,
                   T.USUP = USER,
                   T.FEUP = CURRENT_DATE,
                   T.HOUP = CURRENT_TIME,
                   T.PGMUP = 'MPS245'
             WHERE T.ID_NIT = IN_ID_NIT;
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Updated Successfully';

        WHEN 'D' THEN
            DELETE FROM PRAXISMP.MPF153
             WHERE ID_NIT = IN_ID_NIT;
            SET OUT_STATUS = 1;
            SET OUT_MESSAGE = 'Deleted Successfully';

        ELSE
            SET OUT_STATUS = 0;
            SET OUT_MESSAGE = 'Invalid option';
    END CASE;
END
