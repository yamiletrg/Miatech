# 🚀 Migración Praxis

## Preparación del entorno

### 1. Abrir herramientas

- Abrir **Docker Desktop**
    
- Abrir una terminal
    
- Ejecutar:
    

```bash
wsl --shutdown
wsl -d Debian

ls
cd repositorios/mi-praxis-am-web/

antigravity .
```

---

##  Credenciales

| Campo            | Valor         |
| ---------------- | ------------- |
| Usuario          | `yadira`      |
| Contraseña Vault | `JABBEA`      |
| Contraseña WSL   | `Miatech2026` |
|                  |               |

> [!warning]  
> Mantener estas credenciales únicamente para uso interno.

---

## Levantar el proyecto

### Opción 1

```bash
./vault-login.sh
./start-dev.sh
```

---

### Opción 2 (Policy específica)

```bash
./vault-login.sh yadira --policy approle-mi-praxis-am-only
```

Contraseña:

```text
n5n1FeNiOOmJ17ik
```

Luego ejecutar:

```bash
./start-dev.sh docker-compose.lr.yml
```

---

## Validación

Al iniciar correctamente debe mostrarse el siguiente mensaje:

```text
LOG [Gateway] API available at:
http://localhost:3700/api/v1
```

---

##  URLs

|Servicio|URL|
|---|---|
|Frontend|[http://localhost:8081/](http://localhost:8081/)|
|API|[http://localhost:3700/api/v1](http://localhost:3700/api/v1)|
|Graph|_(Pendiente)_|

---

#  Pruebas con Bruno

## Endpoint

```http
POST http://localhost:3700/api/v1/sales/sales-masterdata/rates-of-exchange-sales/search
```

### Body

```json
{
  "IN_TIPO_TABLA": "A018",
  "IN_TIPO": "1",
  "IN_CURR_FROM": "PEN",
  "IN_DATE": "202401",
  "IN_DATE_2": "202406",
  "start": 0,
  "limit": 20
}
```

---

# Objetos Modificados

## `/sales-masterdata/country-master-file-geography`

### Search

**Store Procedure**

```text
PRAXIS.PX022S01PXA006
```

Cambios realizados:

```sql
SET V_VCSQL = 'SELECT COUNT(*) FROM PRAXIS.A006
```

↓

```sql
SET V_VCSQL = '
SELECT ROW_NUMBER() OVER() AS RN,
       A006KEY,
       A006KEY1,
       A006MONEDA
FROM PRAXIS.A006
```

> [!warning]  
> Reemplazar todas las referencias de:

```text
PRAXIS
```

por

```text
LIBMIATEC
```

---

### Descarga Excel

- ⏳ Pendiente
    

---

### Edit

```text
PRAXIS.PX022S04PXA006
```

---

## `/sales-masterdata/rates-of-exchange-sales`

**Responsable:** Gerson

---

## Guía de paginación antigua

### `/sales-masterdata/city-&-airports-master-file-geography`

Search:

```text
PRAXIS.PX019S01A1007
```

---

## `/sales-masterdata/accounting-master-sales-accounting`

Search:

```text
PRAXIS.SQP04480
```

---

## `/sales-masterdata/accounting-master-tax-accounting`

### Search

```text
PRAXIS.SQP04484
```

### Filter Country

```text
PRAXIS.PX128S01A051
```

> [!note]  
> En **Testing** existen más campos, por ejemplo:
> 
> `A1741TIPO_00 = Type`

---

# Notas

- Verificar que todos los Store Procedures apunten a **LIBMIATEC**.
    
- Confirmar la descarga de Excel del módulo **Country Master File Geography**.
    
- Revisar diferencias entre **Testing** y **Producción** antes de migrar cambios.