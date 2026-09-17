
======================================================
--- GIT ---
git stash       ->  guardar cambios
git stash pop   ->  recuperar cambios

======================================================
--- DOCKER ---

#más_usados
docker logs -f <container_name>
docker stop <container_name>
docker start <container_name>




docker ps -> contenedores activos
docker ps -a  -> todos los contenedores : 


docker logs "id_contenedor"      -> log hasta el momento que esta esta configurado:  
docker logs -f "id_contenedor"   ->	en vivo  
	
docker logs 8023cba29376(id contenedor) -> error 404, revisar el traefic  

-- comando contenedor especifico
docker exec -it "id contenedor"

-- comando contenedor especifico (como terminal carpeta especifica)
docker exec -it aa8251824e25 /bin/sh
ls
cd logs
ls
cat 20260506.json


docker exec -it 4da3f68940ab /bin/sh
======================================================
--- AS400 ---
EDTLBL -- Agregasibrerias


----
COMANDOS :
WRKOBJ   - OBJETOS
WRKMBRPDM - MIEMBRO O FUENTE   (SE DEBE COMPILAR PARA CONVERTIRSE EN OBJETO)  
 -F4   SR /PRAXISJS
 
 
 WRKMBRPDM -14(CREATE ARCHIVO FISICO) -F4(ENTER/ACEPTAR)-F10(EXPANDIR OPCIONES/PARAM. ADICIONALES)
F11 - VER  LOS NOMBRES DE PARAMETROS


.--CUANDO SE LAGEA
SHIFT+ ESC + 2 = VUELVES A INICIO
SHIFT + ESC +1 = INICIO
----


 --ADM TAREAS AS400
WRKACTJOB 
 
SHIF + F4 ORDENAR COLUMNA
 5 ---- ENTRAR A OPCIONES/LISTA GUIA DE OPCIONES  (SIEMPRE INGRESAR PRIMERO Y LUEGOSELCCIONAR  (10, 11, 41))
 
 10 -   --- PARA EL MSG(PARALIZADO EN BUCLE VER MSJ)
 11 -  -- DONDE SE QUEDO
 41 ----- MATAR PROCESO  (*IMMED)
 
 
 
STRPDM
3
ENTER
SP



WRKOBJ , F4
F9 TRAE LO ANTERIOR
*ALL  




======================================================
--- MICROSERVICIOS ---
-abrir terminal
	 wsl
	 wsl --shutdown
	 ls
	 cd repositories/mi-praxis-am-web/
	 antigravity .
	 
-- ejecutar
TOKEN WSL   
 ./vault-login.sh
 ./start-dev.sh
user : yadira
contraseña: JABBEA
	 
-- Lueg de jalar cambvios de main
yarn en : shared, common-services-ms, auth-ms, client_gateway, (modulo que usas)

	 
-- frontend
prototype.url = API_BASE + '/sales/sales-masterdata/processing-commissions';
======================================================

-- DB2  PRAXIS
-- MENU
SELECT * FROM PRAXIS.INF021 WHERE NPROG IN ( 'PX00000628', 'PX00000678', 'PX00000369', 'PX00000701','PX00000659') ;

-- SUB MENU
SELECT * FROM PRAXIS.INF050 WHERE NPROG IN ( 'PX00000628', 'PX00000659') ;

-- PERMISOS
SELECT * FROM PRAXIS.INF053 WHERE NPROG IN ( 'PX00000605', 'PX00000605') AND USR = 'SAP68T' ;
SELECT * FROM PRAXIS.INF053 WHERE NPROG IN ( 'PX00000697' ) ;







/*CONSULTAS PARA LOS TAB DE LA VISTA */
	SELECT * FROM PRAXIS.INF053 WHERE NPROG='PX00000676';   -- PERMISOS
	SELECT * FROM PRAXIS.INF021 WHERE NPROG='PX00000676';   -- VISTA
	SELECT * FROM PRAXIS.INF050 WHERE NPROG='PX00000676';


/* PERMISOS*/
	GRANT ALL ON PROCEDURE PRAXISMP.SQP05716 TO PUBLIC  -- PARA TODOS PUEDAN USAR


/*VARIABLES PARA PRRUEBA*/
	CREATE OR REPLACE VARIABLE PRAXISMP.TES_STATUS INTEGER
	CREATE OR REPLACE VARIABLE PRAXISMP.TES_MSG VARCHAR(300)
	VALUES PRAXISMP.TES_MSG   -- PARA LA RESPUESTA
	

/*ELIMINAR VARIABLES*/
	DROP VARIABLE PRAXISMP.TES_STATUS 
	DROP VARIABLE PRAXISMP.TES_MSG


/*PRUEBA STORE PROCEDURE*/
	CALL PRAXISMP.MPS245('C','','134','','1','pRUEBA','',PRAXISMP.TES_STATUS,PRAXISMP.TES_MSG)


/*BUSCAR PARAMETROS QUE TIENE UNA TABLA*/
	SELECT SPECIFIC_SCHEMA,
		   SPECIFIC_NAME,
		   ORDINAL_POSITION,
		   PARAMETER_MODE,
		   PARAMETER_NAME,
		   DATA_TYPE,
		   CHARACTER_MAXIMUM_LENGTH
	FROM QSYS2.SYSPARMS
	WHERE SPECIFIC_SCHEMA = 'PRAXIS'
	  AND SPECIFIC_NAME = 'SQP05424'
	ORDER BY ORDINAL_POSITION;

/*BUSCAR VALORES QUE TIENE UN CAMPO DE LA TABLA*/
	SELECT DISTINCT TPAX 
	FROM PRAXIS.A4622
	ORDER BY TPAX;
	
	
/*PERMISOS PANTALLA*/
INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAP68T','PX','PX00000675','Y','Y','Y','Y','Y','Y','A','SAP54T','2025-07-22 15:36:01');

======================================================


=====SQL
/* =====================================
   PERMISOS_USO
===================================== */
SELECT * FROM PRAXISJS.INF053; 

SELECT * FROM PRAXISJS.INF053 WHERE NPROG ='PX00000040';

SELECT * FROM PRAXISJS.INF053 WHERE USCR ='SAJ45T';

INSERT INTO PRAXIS.INF053(CCUST,USR,APLICA,NPROG,PERMA,PERML,PERMC,PERMM,PERME,PERMX,STAT,USCR,DTCR)
VALUES('139','SAP54T','PX','PX00000669','Y','Y','Y','Y','Y','Y','A','SAP54T','2026-05-12 10:36:01');


PX00000669

--<CONSULTA_PERMISOS_MASIVOS>
SELECT * 
FROM PRAXIS.INF021 
WHERE NPROG IN ('PX00000661','PX00000662','PX00000672','PX00000673','PX00000367','PX00000368','PX00000369');

SELECT * 
FROM PRAXIS.INF050 
WHERE NPROG IN ('PX00000661','PX00000662','PX00000672','PX00000673','PX00000369');

SELECT * 
FROM PRAXIS.INF053 
WHERE NPROG IN ('PX00000661','PX00000662','PX00000672','PX00000673');
--</CONSULTA_PERMISOS_MASIVOS>


--<BUSQUEDAS>
SELECT * 
FROM PRAXIS.INF021 
WHERE NPROG LIKE '%PX00000%' 
ORDER BY NPROG DESC 
LIMIT 10;
--</BUSQUEDAS>


--<CREACION_MENU>
INSERT INTO PRAXIS.INF021(
    CCUST,APLICA,MODUL,MTYPE,MENU,SMENU,TRANSA,
    DESC1,DESC2,NPROG,ICONO,ICONO2,STAT,
    USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM
)
VALUES (
    '139','PX','MAIN','1','25','100','00017',
    'Reports','','PX00000675','','','A',
    'SAP54T','20250722','235600','10.0.0.83','','','',''
);
--</CREACION_MENU>


--<CREACION_SUBMENU>
INSERT INTO PRAXIS.INF050(
    APLICA,NPROG,PROG,NAVTARG,DESC1,DESC2,STAT,
    USRC,DATC,TIMC,CRTC,USRM,DATM,TIMM,CRTM
) 
VALUES (
    'PX','PX00000675','Reports','payments-reports-form','','','A',
    'SAP54T','20250722','153000','10.0.0.83','','','',''
);
--</CREACION_SUBMENU>


--<ASIGNACION_PERMISOS>
INSERT INTO PRAXIS.INF053(
    CCUST,USR,APLICA,NPROG,
    PERMA,PERML,PERMC,PERMM,PERME,PERMX,
    STAT,USCR,DTCR
)
VALUES(
    '139','SAP54T','PX','PX00000643',
    'Y','Y','Y','Y','Y','Y',
    'A','SAP54T','2025-07-22 15:36:01'
);
--</ASIGNACION_PERMISOS>


--<BUSQUEDA_SP>
SELECT
    ROUTINE_NAME,
    SPECIFIC_NAME,
    EXTERNAL_NAME
FROM QSYS2.SYSPROCS
WHERE ROUTINE_SCHEMA = 'PRAXIS'
  AND SPECIFIC_NAME = 'PX172S02A1838';
--</BUSQUEDA_SP>


--<BUSQUEDA_TABLA>
SELECT 
    TABLE_SCHEMA, 
    TABLE_NAME, 
    SYSTEM_TABLE_NAME
FROM QSYS2.SYSTABLES
WHERE TABLE_SCHEMA = 'PRAXIS'🔐 Permisos de Usuario (INF053)
Ver todos los permisos
SELECT *
FROM PRAXISJS.INF053;
Buscar permisos por programa
SELECT *
FROM PRAXISJS.INF053
WHERE NPROG = 'PX00000040';
Buscar permisos por usuario
SELECT *
FROM PRAXISJS.INF053
WHERE USCR = 'SAJ45T';
Asignar permisos a un usuario
INSERT INTO PRAXIS.INF053
(
    CCUST,
    USR,
    APLICA,
    NPROG,
    PERMA,
    PERML,
    PERMC,
    PERMM,
    PERME,
    PERMX,
    STAT,
    USCR,
    DTCR
)
VALUES
(
    '139',
    'SAP54T',
    'PX',
    'PX00000669',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    'A',
    'SAP54T',
    '2026-05-12 10:36:01'
);
📋 Consultar permisos masivos
Programas registrados (INF021)
SELECT *
FROM PRAXIS.INF021
WHERE NPROG IN (
    'PX00000661',
    'PX00000662',
    'PX00000672',
    'PX00000673',
    'PX00000367',
    'PX00000368',
    'PX00000369'
);
Configuración de programas (INF050)
SELECT *
FROM PRAXIS.INF050
WHERE NPROG IN (
    'PX00000661',
    'PX00000662',
    'PX00000672',
    'PX00000673',
    'PX00000369'
);
Permisos asignados (INF053)
SELECT *
FROM PRAXIS.INF053
WHERE NPROG IN (
    'PX00000661',
    'PX00000662',
    'PX00000672',
    'PX00000673'
);
🔍 Búsqueda de programas

Buscar los últimos programas creados.

SELECT *
FROM PRAXIS.INF021
WHERE NPROG LIKE '%PX00000%'
ORDER BY NPROG DESC
LIMIT 10;
📂 Crear un nuevo menú (INF021)
INSERT INTO PRAXIS.INF021
(
    CCUST,
    APLICA,
    MODUL,
    MTYPE,
    MENU,
    SMENU,
    TRANSA,
    DESC1,
    DESC2,
    NPROG,
    ICONO,
    ICONO2,
    STAT,
    USRC,
    DATC,
    TIMC,
    CRTC,
    USRM,
    DATM,
    TIMM,
    CRTM
)
VALUES
(
    '139',
    'PX',
    'MAIN',
    '1',
    '25',
    '100',
    '00017',
    'Reports',
    '',
    'PX00000675',
    '',
    '',
    'A',
    'SAP54T',
    '20250722',
    '235600',
    '10.0.0.83',
    '',
    '',
    '',
    ''
);
📄 Crear un Submenú (INF050)
INSERT INTO PRAXIS.INF050
(
    APLICA,
    NPROG,
    PROG,
    NAVTARG,
    DESC1,
    DESC2,
    STAT,
    USRC,
    DATC,
    TIMC,
    CRTC,
    USRM,
    DATM,
    TIMM,
    CRTM
)
VALUES
(
    'PX',
    'PX00000675',
    'Reports',
    'payments-reports-form',
    '',
    '',
    'A',
    'SAP54T',
    '20250722',
    '153000',
    '10.0.0.83',
    '',
    '',
    '',
    ''
);
👤 Asignar permisos a un programa (INF053)
INSERT INTO PRAXIS.INF053
(
    CCUST,
    USR,
    APLICA,
    NPROG,
    PERMA,
    PERML,
    PERMC,
    PERMM,
    PERME,
    PERMX,
    STAT,
    USCR,
    DTCR
)
VALUES
(
    '139',
    'SAP54T',
    'PX',
    'PX00000643',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    'Y',
    'A',
    'SAP54T',
    '2025-07-22 15:36:01'
);
⚙️ Buscar un Stored Procedure
SELECT
    ROUTINE_NAME,
    SPECIFIC_NAME,
    EXTERNAL_NAME
FROM QSYS2.SYSPROCS
WHERE ROUTINE_SCHEMA = 'PRAXIS'
  AND SPECIFIC_NAME = 'PX172S02A1838';
🗄️ Buscar una tabla
SELECT
    TABLE_SCHEMA,
    TABLE_NAME,
    SYSTEM_TABLE_NAME
FROM QSYS2.SYSTABLES
WHERE TABLE_SCHEMA = 'PRAXIS'
  AND TABLE_NAME = 'A2462';
📑 Consultar parámetros de un Stored Procedure
SELECT
    SPECIFIC_SCHEMA AS ESQUEMA,
    SPECIFIC_NAME AS NOMBRE_SP,
    PARAMETER_NAME AS PARAMETRO,
    DATA_TYPE AS TIPO
FROM QSYS2.SYSPARMS
WHERE SPECIFIC_NAME = 'PX095S01A1691';
  AND TABLE_NAME = 'A2462';
--</BUSQUEDA_TABLA>


--<BUSQUEDA_PARAMETROS_SP>
SELECT 
    SPECIFIC_SCHEMA AS ESQUEMA,
    SPECIFIC_NAME AS NOMBRE_SP,
    PARAMETER_NAME AS PARAMETRO,
    DATA_TYPE AS TIPO
FROM QSYS2.SYSPARMS
WHERE SPECIFIC_NAME = 'PX095S01A1691';
--</BUSQUEDA_PARAMETROS_SP>

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
 