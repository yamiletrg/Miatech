/*BUSCAR ULTIMOS CREADOS*/
SELECT * FROM PRAXIS.INF021 WHERE NPROG LIKE '%PX00000%' ORDER BY NPROG DESC LIMIT 10;




/*CREAR NUEVO MENU*/
INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','21','210','0006','Tax Log Error','','PX00000691','','','A','SAP54T','20251103','153000','10.0.0.83','','','','');


/*CREAR SUB MENU*/
INSERT INTO PRAXIS.INF050(APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM) 
VALUES ('PX','PX00000691','Tax Log Error','salesAudit-taxlogerror-form','','','A','SAP54T','20251103','153000','10.0.0.83','','','','');

/*DAR PERMISOS*/
INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAP54T','PX','PX00000698','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-12-30 09:36:01');


SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000631'   -- PERMISOS
SELECT * FROM PRAXIS.INF053 WHERE NPROG='PX00000661'   -- VISTA
SELECT * FROM PRAXIS.INF050 WHERE NPROG='PX00000116'

SELECT * FROM PRAXIS.INF053 WHERE NPROG='PX00000698'



/*
 * 
 * 
 CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
139  |PX    |MAIN      |    1|10  |500  |00003 |Inplant Commissions                               |                                                  |PX00000116|                                                                                                    |                                                                                                    |A   |RMC       |20140514|190501|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    3|10  |500  |00003 |Inplant Commissions                               |                                                  |PX00000116|                                                                                                    |                                                                                                    |A   |RMC       |20140514|190501|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    5|10  |500  |00003 |Inplant Commissions                               |                                                  |PX00000116|                                                                                                    |                                                                                                    |A   |RMC       |20140514|190501|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |   10|10  |500  |00003 |Inplant Commissions                               |                                                  |PX00000116|                                                                                                    |                                                                                                    |A   |SAP38     |20181107|170000|10.0.0.83      |          |        |      |               |
 * */
-----------------------------------------------------------------------------------------------------
INSERT INTO PRAXIS.INF021(CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM)
VALUES ('139','PX','MAIN','1','10','500','00004','Calendar load','','PX00000698','','','A','SAP54T','20251230','153000','10.0.0.83','','','','');



INSERT INTO PRAXIS.INF050(APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM) 
VALUES ('PX','PX00000698','Calendar Load','sales-calendar-load-form','','','A','SAP54T','20251230','173000','10.0.0.83','','','','')


INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','JYAURIT','PX','PX00000698','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-12-30 09:36:01');


INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','FBACAT','PX','PX00000698','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-12-30 09:36:01');



Ah es JYAURIT y de Frank es FBACAT

PX00000698



SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000698'  








