# ✈️ PXFARES — Procedimientos Almacenados

> [!info] 📦 Información general  
> **Librería:** `PXFARES`  
> **Total:** `18 stores`  
> **Rango:** `SQP06107` → `SQP06124`

---

# 🗂️ Índice

|  #  | Store      | Tabla   |    Tipo    | Descripción         |
| :-: | :--------- | :------ | :--------: | :------------------ |
| 01  | `SQP06107` | `A2390` |   🔵 R1    | Fare Class ATPCO    |
| 02  | `SQP06108` | `A2393` |   🟣 R2    | Rules ATPCO         |
| 03  | `SQP06109` | `A2245` |   🟢 R3    | Categories ATPCO    |
| 04  | `SQP06110` | `A2372` | 🟡 R3 S900 | Tablas Auxiliares   |
| 05  | `SQP06111` | `A2468` |   🟣 R2    | Footnotes           |
| 06  | `SQP06112` | `A2419` |  🔴 FARE   | Tarifas             |
| 07  | `SQP06113` | `A2233` |  🟠 AP A   | Passenger Type Code |
| 08  | `SQP06114` | `A2234` |  🟠 AP B   | Services            |
| 09  | `SQP06115` | `A2235` |  🟠 AP C   | Zones               |
| 10  | `SQP06116` | `A2236` |  🟠 AP D   | Country Currency    |
| 11  | `SQP06117` | `A2237` |  🟠 AP E   | State Province      |
| 12  | `SQP06118` | `A2238` |  🟠 AP F   | Equipment Codes     |
| 13  | `SQP06119` | `A2239` |  🟠 AP G   | TSIs                |
| 14  | `SQP06120` | `A2240` |  🟠 AP H   | Tariff Matrix       |
| 15  | `SQP06121` | `A2241` |  🟠 AP I   | Surcharge Codes     |
| 16  | `SQP06122` | `A2242` |  🟠 AP J   | Global Area         |
| 17  | `SQP06123` | `A2243` |  🟠 AP K   | Group Type          |
| 18  | `SQP06124` | `A2244` |  🟠 AP L   | Tour Type           |

---

# 🔵 R1 — Fare Class ATPCO

## `SQP06107`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2390`  
> **Descripción:** Consulta el Registro 1, aplicación de clase de tarifa.

### 📋 Parámetros

| Parámetro        | Campo           | Longitud     | Obligatorio | Ejemplo               |
| :--------------- | :-------------- | :----------- | :---------: | :-------------------- |
| Operator 1 ED    | `IN_A2390OPEED` | `VARCHAR(2)` |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Effective Date   | `IN_A2390DEFEC` | `VARCHAR(8)` |    ✅ Sí     | `20260522`            |
| Operator 2 DD    | `IN_A2390OPEDD` | `VARCHAR(2)` |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Discontinue Date | `IN_A2390DDISC` | `VARCHAR(8)` |    ✅ Sí     | `20260522`            |
| Fare Basis       | `IN_A2390FCLAS` | `VARCHAR(8)` |    ❌ No     | `QOW7NR1M`            |
| Market           | `IN_A2390TARNO` | `VARCHAR(6)` |    ❌ No     | `BOGMIA`              |
| Rule             | `IN_A2390RULNO` | `VARCHAR(4)` |    ❌ No     | `1234`                |
| Passenger Type   | `IN_A2390TYPE`  | `VARCHAR(3)` |    ❌ No     | `ADT`                 |
| Class            | `IN_A2390RBD`   | `VARCHAR(1)` |    ❌ No     | `Y`                   |
| Pag. Número      | `IO_PAGNUM`     | `INTEGER`    |  🔄 INOUT   | `1`                   |
| Pag. Filas       | `IO_PAGROW`     | `INTEGER`    |  🔄 INOUT   | `20`                  |
| Pag. Total       | `IO_TOTPAG`     | `INTEGER`    |  🔄 INOUT   | `0`                   |
| Filas Total      | `IO_TOTROW`     | `INTEGER`    |  🔄 INOUT   | `-1`                  |

### 💻 CALL

```sql
CALL PXFARES.SQP06107(
    '=',           -- IN_A2390OPEED
    '20260522',    -- IN_A2390DEFEC
    '<=',          -- IN_A2390OPEDD
    '20261231',    -- IN_A2390DDISC
    'QOW7NR1M',    -- IN_A2390FCLAS
    'BOGMIA',      -- IN_A2390TARNO
    '',            -- IN_A2390RULNO
    '',            -- IN_A2390TYPE
    '',            -- IN_A2390RBD
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟣 R2 — Rules ATPCO

## `SQP06108`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2393`  
> **Descripción:** Consulta el Registro 2, control de categoría de reglas.

### 📋 Parámetros

| Parámetro        | Campo           | Longitud      | Obligatorio | Ejemplo               |
| :--------------- | :-------------- | :------------ | :---------: | :-------------------- |
| Operator 1 ED    | `IN_A2393OPEED` | `VARCHAR(2)`  |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Effective Date   | `IN_A2393EFFE`  | `VARCHAR(8)`  |    ✅ Sí     | `20260801`            |
| Operator 2 DD    | `IN_A2393OPEDD` | `VARCHAR(2)`  |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Discontinue Date | `IN_A2393DISC`  | `VARCHAR(8)`  |    ✅ Sí     | `20260801`            |
| Fare Basis       | `IN_A2393FCLAS` | `VARCHAR(8)`  |    ❌ No     | `QOW7NR1M`            |
| Market           | `IN_A2393TARNO` | `VARCHAR(6)`  |    ❌ No     | `BOGMIA`              |
| Rule             | `IN_A2393RULNO` | `VARCHAR(4)`  |    ❌ No     | `1234`                |
| Passenger Type   | `IN_A2393TYPE`  | `VARCHAR(3)`  |    ❌ No     | `ADT`                 |
| Category         | `IN_A2393CATNO` | `VARCHAR(20)` |    ❌ No     | `001` / `001,002,003` |
| Pag. Número      | `IO_PAGNUM`     | `INTEGER`     |  🔄 INOUT   | `1`                   |
| Pag. Filas       | `IO_PAGROW`     | `INTEGER`     |  🔄 INOUT   | `20`                  |
| Pag. Total       | `IO_TOTPAG`     | `INTEGER`     |  🔄 INOUT   | `0`                   |
| Filas Total      | `IO_TOTROW`     | `INTEGER`     |  🔄 INOUT   | `-1`                  |

> [!warning] 📅 Formato de fecha  
> `YYYYMMDD` → `0YYMMDD`
> 
> Ejemplo: `20260801` → `0260801`

### 💻 CALL

```sql
CALL PXFARES.SQP06108(
    '=',           -- IN_A2393OPEED
    '20260801',    -- IN_A2393EFFE → '0260801'
    '<=',          -- IN_A2393OPEDD
    '20261231',    -- IN_A2393DISC → '0261231'
    'QOW7NR1M',    -- IN_A2393FCLAS
    'BOGMIA',      -- IN_A2393TARNO
    '',            -- IN_A2393RULNO
    '',            -- IN_A2393TYPE
    '',            -- IN_A2393CATNO
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟢 R3 — Categories ATPCO

## `SQP06109`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2245`  
> **Descripción:** Consulta el Registro 3, datos de la categoría de regla (trama).

### 📋 Parámetros

| Parámetro   | Campo           | Longitud     | Obligatorio | Ejemplo    |
| :---------- | :-------------- | :----------- | :---------: | :--------- |
| Category    | `IN_A2245CATNO` | `VARCHAR(3)` |    ✅ Sí     | `001`      |
| Table       | `IN_A2245TBL`   | `VARCHAR(8)` |    ✅ Sí     | `00034331` |
| Pag. Número | `IO_PAGNUM`     | `INTEGER`    |  🔄 INOUT   | `1`        |
| Pag. Filas  | `IO_PAGROW`     | `INTEGER`    |  🔄 INOUT   | `20`       |
| Pag. Total  | `IO_TOTPAG`     | `INTEGER`    |  🔄 INOUT   | `0`        |
| Filas Total | `IO_TOTROW`     | `INTEGER`    |  🔄 INOUT   | `-1`       |

> [!tip] 💡 Respuesta  
> `A2245CATNO` · `A2245TBLNO` · `A2245TRAMA`

### 💻 CALL

```sql
CALL PXFARES.SQP06109(
    '001',         -- IN_A2245CATNO
    '00034331',    -- IN_A2245TBL
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟡 R3 S900 — Tablas Auxiliares

## `SQP06110`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2372`  
> **Descripción:** Consulta las tablas auxiliares del Registro 3 (S900).

### 📋 Parámetros

| Parámetro    | Campo           | Longitud     | Obligatorio | Ejemplo    |
| :----------- | :-------------- | :----------- | :---------: | :--------- |
| Table ID     | `IN_A2372TBLID` | `VARCHAR(3)` |    ✅ Sí     | `961`      |
| Table Number | `IN_A2372TBLNO` | `VARCHAR(8)` |    ✅ Sí     | `00034331` |
| Pag. Número  | `IO_PAGNUM`     | `INTEGER`    |  🔄 INOUT   | `1`        |
| Pag. Filas   | `IO_PAGROW`     | `INTEGER`    |  🔄 INOUT   | `20`       |
| Pag. Total   | `IO_TOTPAG`     | `INTEGER`    |  🔄 INOUT   | `0`        |
| Filas Total  | `IO_TOTROW`     | `INTEGER`    |  🔄 INOUT   | `-1`       |

> [!tip] 💡 Respuesta  
> `A2372TBLID` · `A2372TBLNO`

### 🗃️ Tablas S900 disponibles

|ID|Nombre|
|:-:|:--|
|`961`|Agency Table|
|`989`|Base Fare Information Table|
|`990`|Carrier Application Table|
|`986`|Carrier/Flight Table|
|`979`|Fare Creator Table|
|`974`|Fare Type Table|
|`995`|Geographic Specification Table|
|`997`|Joint Carrier Table|
|`994`|Override Date Table|
|`999`|RBD Table|
|`988`|Reissue Table|
|`993`|Same Point Table|
|`966`|Seasonality/Day Of Week Indicator Table|
|`983`|Security Table|
|`976`|Surface Transfers Table|
|`978`|User Created Zones Table|
|`987`|Waiver Table|

### 💻 CALL

```sql
CALL PXFARES.SQP06110(
    '961',         -- IN_A2372TBLID
    '00034331',    -- IN_A2372TBLNO
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟣 R2 — Footnotes

## `SQP06111`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2468`  
> **Descripción:** Consulta el Registro 2, control de categoría de notas al pie (footnotes).

### 📋 Parámetros

| Parámetro        | Campo           | Longitud      | Obligatorio | Ejemplo               |
| :--------------- | :-------------- | :------------ | :---------: | :-------------------- |
| Operator 1 ED    | `IN_A2468OPEED` | `VARCHAR(2)`  |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Effective Date   | `IN_A2468EFFE`  | `VARCHAR(8)`  |    ✅ Sí     | `20260801`            |
| Operator 2 DD    | `IN_A2468OPEDD` | `VARCHAR(2)`  |    ❌ No     | `=`, `<=`, `>=`, `<>` |
| Discontinue Date | `IN_A2468DISC`  | `VARCHAR(8)`  |    ✅ Sí     | `20260801`            |
| Fare Basic       | `IN_A2468FCLAS` | `VARCHAR(8)`  |    ❌ No     | `QOW7NR1M`            |
| Market           | `IN_A2468TARNO` | `VARCHAR(6)`  |    ❌ No     | `BOGMIA`              |
| Footnote         | `IN_A2468FTNT`  | `VARCHAR(4)`  |    ❌ No     | `1234`                |
| Passenger Type   | `IN_A2468TYPE`  | `VARCHAR(3)`  |    ❌ No     | `ADT`                 |
| Class            | `IN_A2468RBD`   | `VARCHAR(1)`  |    ❌ No     | `Y`                   |
| Category         | `IN_A2468CATNO` | `VARCHAR(20)` |    ❌ No     | `001` / `001,002,003` |
| Pag. Número      | `IO_PAGNUM`     | `INTEGER`     |  🔄 INOUT   | `1`                   |
| Pag. Filas       | `IO_PAGROW`     | `INTEGER`     |  🔄 INOUT   | `20`                  |
| Pag. Total       | `IO_TOTPAG`     | `INTEGER`     |  🔄 INOUT   | `0`                   |
| Filas Total      | `IO_TOTROW`     | `INTEGER`     |  🔄 INOUT   | `-1`                  |

> [!warning] 📅 Formato de fecha  
> `YYYYMMDD` → `0YYMMDD`
> 
> Ejemplo: `20260801` → `0260801`

### 💻 CALL

```sql
CALL PXFARES.SQP06111(
    '=',           -- IN_A2468OPEED
    '20260801',    -- IN_A2468EFFE → '0260801'
    '<=',          -- IN_A2468OPEDD
    '20261231',    -- IN_A2468DISC → '0261231'
    'QOW7NR1M',    -- IN_A2468FCLAS
    'BOGMIA',      -- IN_A2468TARNO
    '',            -- IN_A2468FTNT
    '',            -- IN_A2468TYPE
    '',            -- IN_A2468RBD
    '',            -- IN_A2468CATNO
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🔴 FARE — Tarifas

## `SQP06112`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2419`  
> **Descripción:** Consulta de tarifas (Fare).

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|Operator 1 ED|`IN_A2419OPEED`|`VARCHAR(2)`|❌ No|`=`, `<=`, `>=`, `<>`|
|Effective Date|`IN_A2419EFFE`|`VARCHAR(8)`|✅ Sí|`20260801`|
|Operator 2 DD|`IN_A2419OPEDD`|`VARCHAR(2)`|❌ No|`=`, `<=`, `>=`, `<>`|
|Discontinue Date|`IN_A2419DISC`|`VARCHAR(8)`|✅ Sí|`20260801`|
|Fare Basis|`IN_A2419FCLAS`|`VARCHAR(8)`|❌ No|`QOW7NR1M`|
|Market|`IN_A2419TARNO`|`VARCHAR(6)`|❌ No|`BOGMIA`|
|Rule|`IN_A2419RULNO`|`VARCHAR(4)`|❌ No|`1234`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

> [!warning] 📅 Formato de fecha  
> `YYYYMMDD` → `YYMMDD`
> 
> Ejemplo: `20260801` → `260801` _(sin `0` adelante)_

### 💻 CALL

```sql
CALL PXFARES.SQP06112(
    '=',           -- IN_A2419OPEED
    '20260801',    -- IN_A2419EFFE → '260801'
    '<=',          -- IN_A2419OPEDD
    '20261231',    -- IN_A2419DISC → '261231'
    'QOW7NR1M',    -- IN_A2419FCLAS
    'BOGMIA',      -- IN_A2419TARNO
    '',            -- IN_A2419RULNO
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE A — Passenger Type Code

## `SQP06113`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2233`  
> **Descripción:** Catálogo de códigos de tipo de pasajero.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2233PTC`|`VARCHAR(3)`|❌ No|`ADT`|
|Description|`IN_A2233DESC`|`VARCHAR(150)`|❌ No|`Adult`|
|Type|`IN_A2233TIPP`|`VARCHAR(1)`|❌ No|`A`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06113(
    'ADT',         -- IN_A2233PTC
    '',            -- IN_A2233DESC
    '',            -- IN_A2233TIPP
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE B — Services

## `SQP06114`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2234`  
> **Descripción:** Matriz de tipos de tarifa/servicios.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2234FTC`|`VARCHAR(3)`|❌ No|`001`|
|Description 1|`IN_A2234FTDES`|`VARCHAR(50)`|❌ No|`EXCURSION`|
|Description 2|`IN_A2234DEFIN`|`VARCHAR(100)`|❌ No|`Tarifa excursion`|
|Type|`IN_A2234TYPE`|`VARCHAR(1)`|❌ No|`N`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06114(
    '001',         -- IN_A2234FTC
    '',            -- IN_A2234FTDES
    '',            -- IN_A2234DEFIN
    '',            -- IN_A2234TYPE
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE C — Zones

## `SQP06115`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2235`  
> **Descripción:** Catálogo de zonas geográficas.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2235ZONE`|`VARCHAR(3)`|❌ No|`001`|
|Sequence|`IN_A2235SEQZ`|`VARCHAR(4)`|❌ No|`0001`|
|Country|`IN_A2235TDES`|`VARCHAR(50)`|❌ No|`COLOMBIA`|
|Description|`IN_A2235DESC`|`VARCHAR(150)`|❌ No|`Zona Andina`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06115(
    '001',         -- IN_A2235ZONE
    '',            -- IN_A2235SEQZ
    '',            -- IN_A2235TDES
    '',            -- IN_A2235DESC
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE D — Country Currency

## `SQP06116`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2236`  
> **Descripción:** Catálogo de monedas por país.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2236COCD`|`VARCHAR(2)`|❌ No|`CO`|
|Country|`IN_A2236CONM`|`VARCHAR(100)`|❌ No|`COLOMBIA`|
|Currency 1|`IN_A2236PCUR`|`VARCHAR(3)`|❌ No|`COP`|
|Currency 2|`IN_A2236LCUR`|`VARCHAR(3)`|❌ No|`USD`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06116(
    'CO',          -- IN_A2236COCD
    '',            -- IN_A2236CONM
    '',            -- IN_A2236PCUR
    '',            -- IN_A2236LCUR
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE E — State Province

## `SQP06117`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2237`  
> **Descripción:** Catálogo de estados/provincias.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2237STCD`|`VARCHAR(2)`|❌ No|`FL`|
|Description|`IN_A2237STNM`|`VARCHAR(30)`|❌ No|`FLORIDA`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06117(
    'FL',          -- IN_A2237STCD
    '',            -- IN_A2237STNM
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE F — Equipment Codes

## `SQP06118`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2238`  
> **Descripción:** Catálogo de tipos de aeronave y sus características.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2238EQPC`|`VARCHAR(3)`|❌ No|`320`|
|Description|`IN_A2238DESCR`|`VARCHAR(100)`|❌ No|`AIRBUS A320`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06118(
    '320',         -- IN_A2238EQPC
    '',            -- IN_A2238DESCR
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE G — TSIs

## `SQP06119`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2239`  
> **Descripción:** Identificador del tipo de segmento de viaje (Travel Segment Indicator).

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2239TSI`|`VARCHAR(3)`|❌ No|`001`|
|Description|`IN_A2239DEF`|`VARCHAR(100)`|❌ No|`ORIGIN`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06119(
    '001',         -- IN_A2239TSI
    '',            -- IN_A2239DEF
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE H — Tariff Matrix

## `SQP06120`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2240`  
> **Descripción:** Matriz de tarifarios.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|Rules|`IN_A2240GRULC`|`VARCHAR(3)`|❌ No|`001`|
|Description|`IN_A2240GRULE`|`VARCHAR(3)`|❌ No|`IPG`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06120(
    '001',         -- IN_A2240GRULC
    '',            -- IN_A2240GRULE
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE I — Surcharge Codes

## `SQP06121`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2241`  
> **Descripción:** Catálogo de códigos de recargo.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2241CODE`|`VARCHAR(1)`|❌ No|`Q`|
|Description|`IN_A2241SCHT`|`VARCHAR(50)`|❌ No|`FUEL SURCHARGE`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06121(
    'Q',           -- IN_A2241CODE
    '',            -- IN_A2241SCHT
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE J — Global Area

## `SQP06122`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2242`  
> **Descripción:** Catálogo de áreas globales.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2242AREAC`|`VARCHAR(2)`|❌ No|`AT`|
|Description|`IN_A2242DEFIN`|`VARCHAR(100)`|❌ No|`Atlantic`|
|Associated Code|`IN_A2242GLOBC`|`VARCHAR(2)`|❌ No|`1`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06122(
    'AT',          -- IN_A2242AREAC
    '',            -- IN_A2242DEFIN
    '',            -- IN_A2242GLOBC
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE K — Group Type

## `SQP06123`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2243`  
> **Descripción:** Catálogo de tipos de grupo.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2243CODE`|`VARCHAR(3)`|❌ No|`001`|
|Description|`IN_A2243DESC`|`VARCHAR(50)`|❌ No|`AFFINITY`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06123(
    '001',         -- IN_A2243CODE
    '',            -- IN_A2243DESC
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 🟠 APÉNDICE L — Tour Type

## `SQP06124`

> [!abstract] 📌 Información  
> **Tabla:** `PXFARES.A2244`  
> **Descripción:** Catálogo de tipos de tour.

### 📋 Parámetros

|Parámetro|Campo|Longitud|Obligatorio|Ejemplo|
|:--|:--|:--|:-:|:--|
|ID|`IN_A2244CODE`|`VARCHAR(3)`|❌ No|`001`|
|Description|`IN_A2244DESC`|`VARCHAR(50)`|❌ No|`INCLUSIVE`|
|Pag. Número|`IO_PAGNUM`|`INTEGER`|🔄 INOUT|`1`|
|Pag. Filas|`IO_PAGROW`|`INTEGER`|🔄 INOUT|`20`|
|Pag. Total|`IO_TOTPAG`|`INTEGER`|🔄 INOUT|`0`|
|Filas Total|`IO_TOTROW`|`INTEGER`|🔄 INOUT|`-1`|

### 💻 CALL

```sql
CALL PXFARES.SQP06124(
    '001',         -- IN_A2244CODE
    '',            -- IN_A2244DESC
    1,             -- IO_PAGNUM
    20,            -- IO_PAGROW
    0,             -- IO_TOTPAG
    -1             -- IO_TOTROW
);
```

---

# 📊 Resumen General

|Store|Tabla|Tipo|Descripción|
|:--|:--|:-:|:--|
|`SQP06107`|`A2390`|🔵 R1|Fare Class ATPCO|
|`SQP06108`|`A2393`|🟣 R2|Rules ATPCO|
|`SQP06109`|`A2245`|🟢 R3|Categories ATPCO|
|`SQP06110`|`A2372`|🟡 R3 S900|Tablas Auxiliares|
|`SQP06111`|`A2468`|🟣 R2|Footnotes|
|`SQP06112`|`A2419`|🔴 FARE|Tarifas|
|`SQP06113`|`A2233`|🟠 AP A|Passenger Type Code|
|`SQP06114`|`A2234`|🟠 AP B|Services (Fare Type Matrix)|
|`SQP06115`|`A2235`|🟠 AP C|Zones|
|`SQP06116`|`A2236`|🟠 AP D|Country Currency|
|`SQP06117`|`A2237`|🟠 AP E|State Province|
|`SQP06118`|`A2238`|🟠 AP F|Equipment Codes|
|`SQP06119`|`A2239`|🟠 AP G|TSIs|
|`SQP06120`|`A2240`|🟠 AP H|Tariff Matrix|
|`SQP06121`|`A2241`|🟠 AP I|Surcharge Codes|
|`SQP06122`|`A2242`|🟠 AP J|Global Area|
|`SQP06123`|`A2243`|🟠 AP K|Group Type|
|`SQP06124`|`A2244`|🟠 AP L|Tour Type|