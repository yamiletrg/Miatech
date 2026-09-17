
/*( IN IN_OPTION VARCHAR(15),
    IN IN_CCUST VARCHAR(3),
    IN IN_DATEFROM VARCHAR(10),
    IN IN_DATETO VARCHAR(10),
    IN IN_USER VARCHAR(10),
    IN IN_PROCESADOR VARCHAR(30),
    IN IN_TYPE VARCHAR(2) )
*/


--CALL PRAXISMP.SQP05743('1','139','20251001','20251031','','','RP');
/*
 * 
'AU' → análisis de tiempos por usuario
'RU' → rendimiento por usuario
'RP' → ranking de productividad
 */



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
VALUES('139','LTIRADOT','PX','PX00000690','Y','Y','Y','Y','Y','Y','A','LTIRADOT','2025-11-17 17:54:01');

---PX00000690
SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000690'


CCUST|APLICA|MODUL     |MTYPE|MENU|SMENU|TRANSA|DESC1                                             |DESC2                                             |NPROG     |ICONO                                                                                               |ICONO2                                                                                              |STAT|USRC      |DATC    |TIMC  |CRTC           |USRM      |DATM    |TIMM  |CRTM           |
-----+------+----------+-----+----+-----+------+--------------------------------------------------+--------------------------------------------------+----------+----------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------+----+----------+--------+------+---------------+----------+--------+------+---------------+
139  |PX    |MAIN      |    1|15  |800  |00005 |BPO Control and Analytics                         |                                                  |PX00000690|                                                                                                    |                                                                                                    |A   |SAP55T    |20251031|092937|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    3|15  |800  |00005 |BPO Control and Analytics                         |                                                  |PX00000690|                                                                                                    |                                                                                                    |A   |SAP55T    |20251031|092938|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    4|15  |800  |00005 |BPO Control and Analytics                         |                                                  |PX00000690|                                                                                                    |                                                                                                    |A   |SAP55T    |20251031|092938|10.0.0.83      |          |        |      |               |
139  |PX    |MAIN      |    5|15  |800  |00005 |BPO Control and Analytics                         |                                                  |PX00000690|                                                                                                    |                                                                                                    |A   |SAP55T    |20251031|092939|10.0.0.83      |          |        |      |               |







CALL PRAXISMP.SQP05743('1','139','20251001','20251031','','','AU')


--Auditores
CALL PXSAUDIT.SQP02745('4','139')





--Detalle
CREATE OR REPLACE VARIABLE PXRFNDESP.IO_PAGNUM INTEGER DEFAULT 1
CREATE OR REPLACE VARIABLE PXRFNDESP.IO_PAGROW INTEGER DEFAULT 11
CREATE OR REPLACE VARIABLE PXRFNDESP.IO_TOTPAG INTEGER DEFAULT 0
CREATE OR REPLACE VARIABLE PXRFNDESP.IO_TOTROW INTEGER DEFAULT -1
	



CALL PRAXISMP.SQP05744('139','20251027','20251031','MAGALIT',PXRFNDESP.IO_PAGNUM,PXRFNDESP.IO_PAGROW,PXRFNDESP.IO_TOTPAG,PXRFNDESP.IO_TOTROW)


DROP VARIABLE PXRFNDESP.IO_PAGNUM 
DROP VARIABLE PXRFNDESP.IO_PAGROW 
DROP VARIABLE PXRFNDESP.IO_TOTPAG 
DROP VARIABLE PXRFNDESP.IO_TOTROW








---------------------------------



INSERT INTO PRAXIS.INF021
(CCUST, APLICA, MODUL, MTYPE, MENU, SMENU, TRANSA, DESC1, DESC2, NPROG, ICONO, ICONO2, STAT, USRC, DATC, TIMC, CRTC, USRM, DATM, TIMM, CRTM)
VALUES
('139','PX','MAIN','1','15','800','00005','BPO Control and Analytics','', 'PX00000690','','','A','SAP55T','20251031','092937','10.0.0.83','','','','');

INSERT INTO PRAXIS.INF021
(CCUST, APLICA, MODUL, MTYPE, MENU, SMENU, TRANSA, DESC1, DESC2, NPROG, ICONO, ICONO2, STAT, USRC, DATC, TIMC, CRTC, USRM, DATM, TIMM, CRTM)
VALUES
('139','PX','MAIN','3','15','800','00005','BPO Control and Analytics','', 'PX00000690','','','A','SAP55T','20251031','092938','10.0.0.83','','','','');

INSERT INTO PRAXIS.INF021
(CCUST, APLICA, MODUL, MTYPE, MENU, SMENU, TRANSA, DESC1, DESC2, NPROG, ICONO, ICONO2, STAT, USRC, DATC, TIMC, CRTC, USRM, DATM, TIMM, CRTM)
VALUES
('139','PX','MAIN','4','15','800','00005','BPO Control and Analytics','', 'PX00000690','','','A','SAP55T','20251031','092938','10.0.0.83','','','','');

INSERT INTO PRAXIS.INF021
(CCUST, APLICA, MODUL, MTYPE, MENU, SMENU, TRANSA, DESC1, DESC2, NPROG, ICONO, ICONO2, STAT, USRC, DATC, TIMC, CRTC, USRM, DATM, TIMM, CRTM)
VALUES
('139','PX','MAIN','5','15','800','00005','BPO Control and Analytics','', 'PX00000690','','','A','SAP55T','20251031','092939','10.0.0.83','','','','');


INSERT INTO PRAXIS.INF050
(APLICA, NPROG, PROG, NAVTARG, DESC1, DESC2, STAT, USRC, DATC, TIMC, CRTC, USRM, DATM, TIMM, CRTM)
VALUES
('PX','PX00000690','BPO Control and Analytics','payments-bpo-control-analytics-form','','','A','SAP55T','20251031','092853','10.0.0.83','','','','');


INSERT INTO PRAXIS.INF053
(CCUST, USR, APLICA, NPROG, PERMA, PERML, PERMC, PERMM, PERME, PERMX, STAT, USCR, DTCR)
VALUES
('139','SAP54T','PX','PX00000690','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-10-28 15:36:01.000');






