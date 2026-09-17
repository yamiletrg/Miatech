#  Reglas de Visualización - ATPCO / TTBS

## ATPCO

### TTBS

#### Filtros

| Campo     | Regla                           |
| --------- | ------------------------------- |
| Tax       | `XD`                            |
| Country   | `MX`                            |
| Carrier   | `YY`                            |
| Sale Date | Hasta **mayo 2025**             |
| Formato   | Todo el texto en **MAYÚSCULAS** |
| Fecha     | Mostrar como **Año/Mes**        |

---

#  Vista (View)

## Ticket de prueba

```text
1393518398565
1392143572593
```

---

## Reglas de visualización

- Agregar **2 espacios** adicionales antes de `X`.
    
- Mostrar origen y destino.
    

Ejemplo:

```text
MX AR
```

---

## Agrupación de registros

### Códigos

- `100`
    
- `99`
    

Solo debe existir **una línea** por grupo.

La información debe desplegarse desde un **100** hasta encontrar el siguiente **100**, incluyendo todos los registros intermedios distintos de:

- `99`
    
- `300`
    

---

## Estados

- ✅ Passed
    
- ❌ Not Passed → Mostrar en **color rojo**
    

---

## Agrupación

Agrupar la información por:

- Registro `99`
    
- Registro `200`
    
- Estado (**Passed / Not Passed**)
    

---

# 📄 Header

## Equivalencias

|Código|Descripción|Mostrar como|
|---|---|---|
|000|Ticket|TKT|
|001|Method of Payment|Moneda|
|002|Point of Sale|País / Ciudad|
|100|Coupon of Sale|Origen / País Origen / Destino / País Destino|

---

## Ejemplo

```text
000;1392143572593
001;USD
002;Ticket Point of Sale: EC
101;01;UIO;MEX;FVLO;FBASIS
201;Validated passengers
```

---

# Estructura del archivo

## Cabecera

|Código|Descripción|
|---|---|
|000|Ticket|
|001|Moneda de pago / Equivalente|
|002|País y ciudad de venta|
|003|Issue Date|
|004|Itinerary|
|005|Connection|
|006|Tipo de pasajero|

---

## Detalle

|Código|Descripción|
|---|---|
|100|Información del cupón|
|99|Impuesto de venta|
|300|Información adicional|

---

#  Interpretación de los últimos campos

La lectura debe realizarse **desde el último campo hacia el primero**.

|Posición|Significado|Regla|
|---|---|---|
|Último|—|—|
|Penúltimo|Exceptuado|Si viene `X` → **Exceptuado**. Si viene vacío → **No exceptuado**.|
|Antepenúltimo|Valor|Si el tipo es **F**, corresponde a un **Monto**. Si el tipo es **P**, corresponde a un **Porcentaje** y debe dividirse entre **10000**.|
|Cuarto desde el final|Tipo de monto|Define si el valor corresponde a **F (Monto)** o **P (Porcentaje)**.|

---

#  Notas

> [!tip]  
> Todos los textos de TTBS deben visualizarse en **MAYÚSCULAS**.

> [!warning]  
> Los registros con estado **Not Passed** deben resaltarse en **rojo**.

> [!note]  
> La lectura de los últimos campos siempre debe hacerse **de derecha a izquierda (del último al primero)**.