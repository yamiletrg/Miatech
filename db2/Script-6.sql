CREATE OR REPLACE PROCEDURE PXFARES.SQP06112
(
    IN IN_A2419CXRCD VARCHAR(2),
    IN IN_A2419OCITY VARCHAR(3),
    IN IN_A2419DCITY VARCHAR(3),
    IN IN_A2419OPEEF VARCHAR(2),
    IN IN_A2419TARDT VARCHAR(8),
    IN IN_A2419OPEDD VARCHAR(2),
    IN IN_A2419DISC VARCHAR(8),
    IN IN_A2419FCLAS VARCHAR(8),
    IN IN_A2419TARNO VARCHAR(6),
    IN IN_A2419RULNO VARCHAR(4),

    INOUT IO_PAGNUM INTEGER,
    INOUT IO_PAGROW INTEGER,
    INOUT IO_TOTPAG INTEGER,
    INOUT IO_TOTROW INTEGER
)

RESULT SETS 1
LANGUAGE SQL
SPECIFIC PXFARES.SQP06112

BEGIN

    /************************************************************/
    /*              CONTROL DE CAMBIOS                          */
    /************************************************************/
    /* 202601 DAVT 09/07/2026 INICIO DEL PROGRAMA               */
    /************************************************************/
    /* CAMBIO DE LLAVE A2419  YRG 2026/09/17                    */
    /* A2419H      -> LOGICO                                    */
    /* A2419CXRCD  -> CARRIER                                   */
    /* A2419OCITY  -> ORIGEN                                    */
    /* A2419DCITY  -> DESTINO                                   */
    /* A2419FCLAS  -> Z FARE BASIS                              */
    /* A2419DISC   -> DISCONTINUIDAD                            */
    /* A2419TARDT  -> EFECTIVIDAD                               */
    /************************************************************/

    DECLARE V_QUERY CLOB(10M);

    DECLARE CURRES CURSOR FOR STMTRES;

    SET V_QUERY = '
        SELECT * FROM PXFARES.A2419 A
        WHERE A2419CXRCD = ''{IN_A2419CXRCD}''
          AND A2419OCITY = ''{IN_A2419OCITY}''
          AND A2419DCITY = ''{IN_A2419DCITY}''
          AND A2419TARDT {IN_A2419OPEEF} ''{IN_A2419TARDT}''
          AND A2419DISC {IN_A2419OPEDD} ''{IN_A2419DISC}''
          AND A2419FCLAS = ''{IN_A2419FCLAS}''
    ';

    IF IN_A2419OPEEF NOT IN ( '=', '<=', '>=', '<>' ) THEN
        SET IN_A2419OPEEF = '=';
    END IF;

    IF IN_A2419OPEDD NOT IN ( '=', '<=', '>=', '<>' ) THEN
        SET IN_A2419OPEDD = '=';
    END IF;

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419CXRCD}',
        IN_A2419CXRCD
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419OCITY}',
        IN_A2419OCITY
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419DCITY}',
        IN_A2419DCITY
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419OPEEF}',
        IN_A2419OPEEF
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419TARDT}',
        SUBSTR(IN_A2419TARDT, 3, 6)
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419OPEDD}',
        IN_A2419OPEDD
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419DISC}',
        SUBSTR(IN_A2419DISC, 3, 6)
    );

    SET V_QUERY = REPLACE(
        V_QUERY,
        '{IN_A2419FCLAS}',
        IN_A2419FCLAS
    );

    IF IN_A2419TARNO <> '' THEN

        SET V_QUERY = V_QUERY ||
            ' AND A2419TARNO = ''' ||
            IN_A2419TARNO ||
            '''';

    END IF;

    IF IN_A2419RULNO <> '' THEN

        SET V_QUERY = V_QUERY ||
            ' AND A2419RULNO = ''' ||
            IN_A2419RULNO ||
            '''';

    END IF;

    INSERT INTO PXFARES.X3232
    VALUES (
        'SQP06112',
        V_QUERY,
        USER,
        '',
        ''
    );

    CALL PXFARES.PAGINATE(
        V_QUERY,
        IO_PAGNUM,
        IO_PAGROW,
        IO_TOTPAG,
        IO_TOTROW
    );

    PREPARE STMTRES FROM V_QUERY;

    OPEN CURRES;

END