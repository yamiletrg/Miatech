


--  CREAR MENU

-- CREAR SUBMENU


-- TABLA: PRAXISBI/A2936

SELECT * FROM PRAXISBI.A2936

SELECT * 
FROM PRAXIS.INF021
WHERE CCUST='139'
  AND APLICA='PX'
  AND MODUL='MAIN'
  AND MTYPE='1'
  AND MENU='10'
  AND SMENU='310'
  AND TRANSA='00003';


/*BUSCAR ULTIMOS CREADOS*/
SELECT * FROM PRAXIS.INF021 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;

SELECT * FROM PRAXIS.INF021 WHERE NPROG ='PX00000023'
/*
CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
139  |PX    |MAIN      |    1|10  |310  |00003 |Regions Master File                               |                                                  |PX00000023|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    3|10  |310  |00003 |Regions Master File                               |                                                  |PX00000023|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    4|10  |310  |00003 |Regions Master File                               |                                                  |PX00000023|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    5|10  |310  |00003 |Regions Master File                               |                                                  |PX00000023|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |   10|10  |310  |00003 |Regions Master File                               |                                                  |PX00000023|                                                                                                    |                                                                                                    |A   |SAP38     |20181107|170000|10.0.0.83      |          |        |      |               |
 * */


SELECT * FROM PRAXIS.INF021 WHERE NPROG ='PX00000020'
/*
 CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
     |PX    |SALESPROC |    1|10  |100  |00005 |City Master File                                  |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |RMC       |20140321|120352|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    1|10  |310  |00002 |City &amp; Airports Master File                   |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    3|10  |310  |00002 |City &amp; Airports Master File                   |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    4|10  |310  |00002 |City Master File                                  |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    5|10  |310  |00002 |City &amp; Airports Master File                   |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |RMC       |20140421|200414|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |   10|10  |310  |00002 |City &amp; Airports Master File                   |                                                  |PX00000020|                                                                                                    |                                                                                                    |A   |SAP38     |20181107|170000|10.0.0.83      |          |        |      |               | 
 * */


/*CREAR NUEVO MENU*/
INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
--VALUES ('139','PX','MAIN','6','10','310','00004','ODV Citys','','PX00000685','','','A','SAP54T','20251022','200414','10.0.0.83','','','','');
VALUES ('139','PX','MAIN','1','10','310','00005','ODV Citys','','PX00000688','','','A','SAP54T','20251022','200414','10.0.0.83','','','','');


/*CREAR SUB MENU*/
INSERT INTO PRAXIS.INF050(APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM) 
VALUES ('PX','PX00000688','ODV Citys','odv-citys-form','','','A','SAP54T','20251022','153000','10.0.0.83','','','','');


/*el max creado*/
SELECT MAX(NPROG) AS MAXIMO_NPROG
FROM PRAXIS.INF021
WHERE NPROG LIKE 'PX00000%';


/*DAR PERMISOS*/
INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAP68T','PX','PX00000675','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-07-22 15:36:01');



SELECT * FROM PRAXIS.INF050 WHERE NAVTARG ='sales-screen-option-form'
SELECT * FROM PRAXIS.INF021 WHERE NPROG ='PX00000688'






