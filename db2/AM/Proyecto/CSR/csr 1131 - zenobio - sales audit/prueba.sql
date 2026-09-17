
/*BUSCAR ULTIMOS CREADOS*/
SELECT * FROM PRAXIS.INF021 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;


/*CREAR NUEVO MENU*/
INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','21','200','00017','Workload Reassignment','','PX00000697','','','A','SAP54T','20251117','154800','10.0.0.83','','','','');


/*CREAR SUB MENU*/
INSERT INTO PRAXIS.INF050(APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM) 
VALUES ('PX','PX00000697','Workload Reassignment','salesaudit-workload-reassignment-form','','','A','SAP54T','20251117','154800','10.0.0.83','','','','');

/*DAR PERMISOS*/
INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAP54T','PX','PX00000697','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-11-17 15:36:01');


--- PX00000355
SELECT * FROM PRAXIS.INF021 WHERE NPROG = 'PX00000696'

SELECT * FROM PRAXIS.INF050 WHERE NPROG = 'PX00000355'
SELECT * FROM PRAXIS.INF021 WHERE NPROG = 'PX00000306'
SELECT * FROM PRAXIS.INF021 WHERE NPROG = 'PX00000303'
SELECT * FROM PRAXIS.INF021 WHERE NPROG = 'PX00000691'

PX00000691


PX00000303





CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
139  |PX    |MAIN      |    1|21  |200  |00013 |IATAS BSP                                         |                                                  |PX00000355|                                                                                                    |                                                                                                    |A   |SAP13     |20160712|153000|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    3|21  |200  |00013 |IATAS BSP                                         |                                                  |PX00000355|                                                                                                    |                                                                                                    |A   |SAP13     |20160712|153000|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    5|21  |200  |00013 |IATAS BSP                                         |                                                  |PX00000355|                                                                                                    |                                                                                                    |A   |SAP13     |20160712|153000|10.0.0.83      |          |        |      |               |


139  |PX    |MAIN      |    1|21  |200  |00010 |Master Tax 3 Digits                               |                                                  |PX00000306|                        

139  |PX    |MAIN      |    1|21  |200  |00004 |Numbering ranges for ADMs                         |                                                  |PX00000303|                        

139  |PX    |MAIN      |    1|21  |210  |0006  |Tax Log Error                                     |                                                  |PX00000691|                        






