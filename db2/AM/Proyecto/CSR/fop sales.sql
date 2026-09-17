CREATE OR REPLACE PROCEDURE PRAXIS.SQP05896 (
    IN P_TIPO               VARCHAR(4),      -- CONS o FOB
    IN P_ANIO               CHAR(4),         -- Año (YYYY)
    IN P_MES                CHAR(2),         -- Mes (MM)
    IN P_FECHA_EJECUCION    CHAR(8),         -- Fecha ejecución (YYYYMMDD)
    IN P_PERIODO_INICIO     CHAR(8),         -- Periodo inicio (YYYYMMDD)
    IN P_PERIODO_FIN        CHAR(8),         -- Periodo fin (YYYYMMDD)
    IN P_USUARIO            VARCHAR(10),     -- Usuario que ejecuta (ej: SAP19)
    IN P_FILA_EXCEL         INTEGER,         -- Número de fila del Excel
    OUT P_MENSAJE           VARCHAR(200)     -- Mensaje de resultado
)
LANGUAGE SQL
SPECIFIC PRAXIS.SQP05896
BEGIN
    -- Variables locales
    DECLARE V_FECHA_ACTUAL  VARCHAR(8);
    DECLARE V_HORA_ACTUAL   VARCHAR(6);
    DECLARE V_SQLCODE       INTEGER DEFAULT 0;
    DECLARE V_SQLSTATE      VARCHAR(5) DEFAULT '00000';
    DECLARE V_INSERT_ERROR  INTEGER DEFAULT 0;
    DECLARE V_PREFIJO       VARCHAR(50);
   
    -- Manejador de excepciones SQL (CONTINUE para no detener)
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            V_SQLCODE = DB2_RETURNED_SQLCODE,
            V_SQLSTATE = RETURNED_SQLSTATE;
        SET V_INSERT_ERROR = 1;
    END;
   
    -- Prefijo para todos los mensajes con número de fila
    SET V_PREFIJO = 'Fila Excel ' || CAST(P_FILA_EXCEL AS VARCHAR(10)) || ' - ';
   
    -- =====================================================
    -- VALIDACIONES
    -- =====================================================
   
    -- Validar P_TIPO (debe ser CONS o FOB)
    IF P_TIPO NOT IN ('CONS', 'FOB') THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo TIPO: debe ser CONS o FOB';
        RETURN;
    END IF;
   
    -- Validar P_ANIO (debe ser numérico de 4 dígitos entre 2000-2099)
    IF P_ANIO IS NULL OR LENGTH(TRIM(P_ANIO)) <> 4 OR
       TRANSLATE(P_ANIO, '##########', '0123456789') <> '####' OR
       INTEGER(P_ANIO) < 2000 OR INTEGER(P_ANIO) > 2099 THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo ANIO: debe ser formato YYYY entre 2000-2099';
        RETURN;
    END IF;
   
    -- Validar P_MES (debe ser numérico de 2 dígitos entre 01-12)
    IF P_MES IS NULL OR LENGTH(TRIM(P_MES)) <> 2 OR
       TRANSLATE(P_MES, '##########', '0123456789') <> '##' OR
       INTEGER(P_MES) < 1 OR INTEGER(P_MES) > 12 THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo MES: debe ser formato MM entre 01-12';
        RETURN;
    END IF;
   
    -- Validar P_FECHA_EJECUCION (debe ser numérico de 8 dígitos)
    IF P_FECHA_EJECUCION IS NULL OR LENGTH(TRIM(P_FECHA_EJECUCION)) <> 8 OR
       TRANSLATE(P_FECHA_EJECUCION, '##########', '0123456789') <> '########' THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo FECHA_EJECUCION: debe ser formato YYYYMMDD';
        RETURN;
    END IF;
   
    -- Validar P_PERIODO_INICIO (debe ser numérico de 8 dígitos)
    IF P_PERIODO_INICIO IS NULL OR LENGTH(TRIM(P_PERIODO_INICIO)) <> 8 OR
       TRANSLATE(P_PERIODO_INICIO, '##########', '0123456789') <> '########' THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo PERIODO_INICIO: debe ser formato YYYYMMDD';
        RETURN;
    END IF;
   
    -- Validar P_PERIODO_FIN (debe ser numérico de 8 dígitos)
    IF P_PERIODO_FIN IS NULL OR LENGTH(TRIM(P_PERIODO_FIN)) <> 8 OR
       TRANSLATE(P_PERIODO_FIN, '##########', '0123456789') <> '########' THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo PERIODO_FIN: debe ser formato YYYYMMDD';
        RETURN;
    END IF;
   
    -- Validar que periodo inicio sea menor o igual a periodo fin
    IF INTEGER(P_PERIODO_INICIO) > INTEGER(P_PERIODO_FIN) THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campos PERIODO_INICIO/FIN: inicio no puede ser mayor a fin';
        RETURN;
    END IF;
   
    -- Validar P_USUARIO (no vacío)
    IF P_USUARIO IS NULL OR TRIM(P_USUARIO) = '' THEN
        SET P_MENSAJE = V_PREFIJO || 'ERROR en campo USUARIO: no puede estar vacío';
        RETURN;
    END IF;
   
    -- =====================================================
    -- OBTENER FECHA Y HORA ACTUAL DEL SISTEMA
    -- =====================================================
    SET V_FECHA_ACTUAL = REPLACE(CHAR(CURRENT DATE, ISO), '-', '');
    SET V_HORA_ACTUAL = REPLACE(CHAR(CURRENT TIME, ISO), '.', '');
   
    -- =====================================================
    -- INSERTAR REGISTRO EN TABLA PRAXIS.A1837
    -- =====================================================
   
    -- Resetear indicador de error antes del INSERT
    SET V_INSERT_ERROR = 0;
   
    INSERT INTO PRAXIS.A1837 VALUES (
        '139',                  -- SIEMPRE VA 139
        P_TIPO,                 -- CONS o FOB
        'S',                    -- SIEMPRE ES S
        P_ANIO,                 -- Año del excel
        P_MES,                  -- Mes de ejecución
        P_FECHA_EJECUCION,      -- Fecha de ejecución
        P_PERIODO_INICIO,       -- Periodo inicio
        P_PERIODO_FIN,          -- Periodo fin
        '',                     -- Campo vacío (se llena al procesar)
        '',                     -- Campo vacío (se llena al procesar)
        '',                     -- Campo vacío (se llena al procesar)
        '',                     -- Campo vacío (se llena al procesar)
        '',                     -- Campo vacío (se llena al procesar)
        P_USUARIO,              -- Usuario (parámetro)
        V_FECHA_ACTUAL,         -- Fecha actual del sistema (YYYYMMDD)
        V_HORA_ACTUAL           -- Hora actual del sistema (HHMMSS)
    );
   
    -- Verificar si hubo error en el INSERT
    IF V_INSERT_ERROR = 1 THEN
        -- Construir mensaje de error con los datos de la fila que falló
        IF V_SQLCODE = -803 THEN
            -- Error de llave duplicada
            SET P_MENSAJE = V_PREFIJO || 'ERROR LLAVE DUPLICADA - Registro ya existe (SQLCODE=' ||
                            CAST(V_SQLCODE AS VARCHAR(10)) || ')';
        ELSE
            -- Otro tipo de error
            SET P_MENSAJE = V_PREFIJO || 'ERROR EN INSERT (SQLCODE=' ||
                            CAST(V_SQLCODE AS VARCHAR(10)) || ', SQLSTATE=' || V_SQLSTATE || ')';
        END IF;
        ROLLBACK;
    ELSE
        -- INSERT exitoso
        SET P_MENSAJE = V_PREFIJO || 'OK - Insertado correctamente';
        COMMIT;
    END IF;
   
END