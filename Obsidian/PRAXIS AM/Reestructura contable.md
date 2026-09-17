
```

reestructura contable  mapeo


------------------------------------------------------------------------
Accounting Master Sales 

PRAXIS.SQP04480 - SEARCH

PRAXIS.SQP04481 - MANTENIMIENTO
PRAXIS.A1740 -> A1740CECOS, A1740CTA

ALTER TABLE PRAXIS.A1740
ALTER COLUMN A1740CECOS SET DATA TYPE VARCHAR(7);


ALTER TABLE PRAXIS.A1740
ALTER COLUMN A1740CTA SET DATA TYPE VARCHAR(6);

------------------------------------------------------------------------
Accounting Master Tax 
PRAXIS.SQP04484  - SEARCH
PRAXIS.SQP04485 - MANTENIMIENTO
PRAXIS.A1741 -> A1741CECOS,A1741CTA

------------------------------------------------------------------------
Accounting Master Client 
PRAXIS.PX128S02A1736
PRAXIS.A1736 -> A1736CECO,A1736CTAC

------------------------------------------------------------------------
Accounting Master Supplier   --data entry mejorar
PRAXIS.PX155S07A1806
PRAXIS. A1806 -> A1806CENCO,A1806CUENT

------------------------------------------------------------------------
Accounting Master CCAM  -- data entry mejorar

PRAXIS. PX160S01A1819 - SEARCH
PRAXIS.PX160S02A1819 -  MANTENIMIENTO
PRAXIS.A1819 -> A1819CECO, A1819CTA

------------------------------------------------------------------------
Accounting Master UATP  -- data entry mejorar 

PRAXIS.SQP04221 -SEARCH
PRAXIS.PX161S02A1820 - MANTENIMIENTO
PRAXIS.A1820 -> A1820CECO,A1820CTA

------------------------------------------------------------------------
Accounting Master PAGA TODO    ---- DESHABILITADA  NO VA

PRAXIS.PX170S01A1835 - SEARCH
PRAXIS.PX170S02A1835 - MANTENIMIENTO
PRAXIS.A1835 -> A1835CENCO, A1835CUENT   (no cambiaron longitud -cambiar)

------------------------------------------------------------------------
Accounting Master Travel Voucher 

PRAXIS.PX172S01A1838 - SEARCH
PRAXIS.PX172S02A1838
PRAXIS.A1838 -> A1838CENCO, A1838CUENT


_____________________________________________________________________________________________________________

REESTRUCTURA CONTABLE 

------------------------------------------------------------------------
Accounting Master Sales 

PRAXIS.SQP04480 - SEARCH

PRAXIS.SQP04481 - MANTENIMIENTO
PRAXIS.A1740 -> A1740CECOS, A1740CTA

___________________________________
CAMPOS PARA HACER UPDATE ALMENOS UNO DE ESTOS
A1740TITRA
A1740TIPO
A1740SUBTI
A1740CATEG
___________________________________


ALTER TABLE PRAXIS.A1740
ALTER COLUMN A1740CECOS SET DATA TYPE VARCHAR(7);


ALTER TABLE PRAXIS.A1740
ALTER COLUMN A1740CTA SET DATA TYPE VARCHAR(6);

------------------------------------------------------------------------
Accounting Master Tax 
PRAXIS.SQP04484  - SEARCH
PRAXIS.SQP04485 - MANTENIMIENTO
PRAXIS.A1741 -> A1741CECOS,A1741CTA

___________________________________
CAMPOS PARA HACER UPDATE ALMENOS UNO DE ESTOS
A1741CODE
A1741TIPO
A1741FINI
A1741FFIN
___________________________________

------------------------------------------------------------------------
Accounting Master Client 
PRAXIS.PX128S02A1736
PRAXIS.A1736 -> A1736CECO,A1736CTAC


___________________________________
CAMPOS PARA HACER UPDATE ALMENOS UNO DE ESTOS
A1736PAIS
A1736FUENT
A1736CURR
A1736TIPO
A1736SUBFU
A1736FP
A1736IATA
A1736CIA
___________________________________

------------------------------------------------------------------------
Accounting Master Supplier   --data entry mejorar
PRAXIS.PX155S07A1806
PRAXIS. A1806 -> A1806CENCO,A1806CUENT


___________________________________
CAMPOS PARA HACER UPDATE ALMENOS UNO DE ESTOS
A1806TIPOC
A1806NUM
A1806MONED
___________________________________

------------------------------------------------------------------------
Accounting Master CCAM  -- data entry mejorar

PRAXIS. PX160S01A1819 - SEARCH
PRAXIS.PX160S02A1819 -  MANTENIMIENTO
PRAXIS.A1819 -> A1819CECO, A1819CTA


___________________________________
CAMPOS PARA HACER UPDATE OBLIGATORIO
TACC
___________________________________

------------------------------------------------------------------------
Accounting Master UATP  -- data entry mejorar 

PRAXIS.SQP04221 -SEARCH
PRAXIS.PX161S02A1820 - MANTENIMIENTO
PRAXIS.A1820 -> A1820CECO,A1820CTA


___________________________________
CAMPOS PARA HACER UPDATE OBLIGATORIO
TCUAT
___________________________________

------------------------------------------------------------------------
Accounting Master PAGA TODO    ---- DESHABILITADA  NO VA

PRAXIS.PX170S01A1835 - SEARCH
PRAXIS.PX170S02A1835 - MANTENIMIENTO
PRAXIS.A1835 -> A1835CENCO, A1835CUENT   (no cambiaron longitud -cambiar)

___________________________________
CAMPOS PARA HACER UPDATE SI SE CAMBIA ALGUNO

IN_A1835FOPID
IN_A1835TARPT
___________________________________
------------------------------------------------------------------------
Accounting Master Travel Voucher 

PRAXIS.PX172S01A1838 - SEARCH
PRAXIS.PX172S02A1838
PRAXIS.A1838 -> A1838CENCO, A1838CUENT

___________________________________
CAMPOS PARA HACER UPDATE SI SE CAMBIA ALGUNO
IN_A1838TIPO
IN_A1838AGENT
___________________________________




_____________________________________________________________________________________________________________





OBTENER NOMBRE DE OBJETO DE SP ---------------------------
SELECT
    ROUTINE_NAME,      -- Nombre del Store Procedure (SQL)
    SPECIFIC_NAME,     -- Nombre específico (SQL)
    EXTERNAL_NAME     -- Nombre del programa en el sistema (Bibliot/Objeto)
FROM QSYS2.SYSPROCS
WHERE ROUTINE_SCHEMA = 'PRAXIS'
  AND SPECIFIC_NAME = 'PX128S02A1736';
  
  
  

```
