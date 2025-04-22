
#  Sistema de Gestión de Vehículos

## Nombre
Sara Castrillón Sánchez


### 1. **Catálogo de vehículos**
Primero declare varios vehículos con el predicado:


vehicle(Marca, Referencia, Tipo, Precio, Año).


Por ejemplo:

vehicle(toyota, rav4, suv, 28000, 2022).


Agregué 10 vehículos de marcas como toyota, ford, honda y BMW.

---

### 2. **Filtros básicos**

Hice un predicado que sirve para saber si un vehículo está dentro del presupuesto de un cliente


meet_budget(Referencia, PresupuestoMax).


Y también uno para listar todas las referencias de una marca, con `findall`:


list_by_brand(Marca, Lista).


---

### 3. **Reporte personalizado**

Después hice un reporte con este predicado


generate_report(Marca, Tipo, Presupuesto, Resultado).


Este filtra los vehículos por marca y tipo, y que no se pasen del presupuesto. y usé una función `sum_prices` para sumar el precio de todos los vehículos seleccionados, y así verificar que sí está dentro del presupuesto.

---

### 4. **Casos de prueba**

Estos casos son para comprobar que funciona

- `case1(Result).`  
  → Devuelve todos los SUV Toyota con precio menor a $30,000

- `case2(Result).`  
  → Agrupa los vehículos Ford por tipo y año usando `bagof`.

- `case3(Total, Result).`  
  → Suma el valor total de los sedanes y verifica que no pasen de $500,000.

---

##  IDE

Como no pude descargar Prolog, lo hice en línea usando SWISH


1. Abrir SWISH
2. Pegas el código completo
3. Escribir consultas con
```prolog
case1(Result).
```


