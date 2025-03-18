#Sección 1: Preguntas Teóricas (11 puntos)

# **SQL (4 puntos)**

## 1. ¿Cuál es la diferencia entre un JOIN y un UNION en SQL? Proporcione un ejemplo de cada uno. (1 punto)

- JOIN: Se usa para combinar filas de dos o más tablas basándose en una condición común. Los datos se combinan en columnas.
- UNION: Se usa para combinar resultados de dos o más consultas en una sola lista de resultados. Los datos se combinan en filas.

**Ejemplo de JOIN**

  - Supongamos que existen dos tablas clientes y ventas. Y Quiero obtener el nombre del cliente y el monto de sus ventas

  SELECT clientes.nombre, ventas.monto
  FROM clientes
  JOIN ventas ON clientes.id = ventas.cliente_id;

**Ejemplo de UNION**

  - Supongamos que exixten dos tablas ventas_2022 y ventas_2023. Y quiero obtener una lista única de todos los clientes que han comprado en ambos años.

  SELECT cliente_id FROM ventas_2022
  UNION
  SELECT cliente_id FROM ventas_2023;

### 2. Explique qué es una consulta CTE (Common Table Expression) y mencione un caso de uso. (1 punto)

- Una CTE es una consulta temporal que se define dentro de una sentencia SQL y puede ser referenciada dentro de la misma consulta. Se usa para mejorar la legibilidad y 
  organización de consultas complejas. Se define con la cláusula WITH y se puede referenciar múltiples veces dentro de la misma consulta.

**Ejemplo de uso** Supongamos que necesitamos obtener los clientes que han gastado más de $400 en total en compras.

  WITH ventas_totales AS (
      SELECT cliente_id, SUM(monto) AS total_ventas
      FROM ventas
      GROUP BY cliente_id
  )
  SELECT * FROM ventas_totales WHERE total_ventas > 400;


#### 3. ¿Qué es la cláusula HAVING en SQL y en qué se diferencia de WHERE? (1 punto)

- HAVING: Se utiliza para filtrar grupos de resultados después de que se haya aplicado una agrupación (GROUP BY) o funciones de agregacion (SUM, COUNT, AVG, etc.).
  A diferencia de WHERE, que filtra filas antes de la agrupación, HAVING filtra después de la agrupación.

**Ejemplo**

  SELECT cliente_id, SUM(monto) AS total_ventas
  FROM ventas
  GROUP BY cliente_id
  HAVING SUM(monto) > 250;

##### 4. Dado el siguiente conjunto de datos en una tabla llamada ventas,escriba una consulta SQL para obtener el total de ventas por cliente, incluyendo sólo aquellos con un monto total superior a 250. (1 punto):

id_venta   fecha   cliente_id   monto
1       2025-03-01   101         200
2       2025-03-02   102         150
3       2025-03-02   101         300

  SELECT cliente_id, SUM(monto) AS total_ventas
  FROM ventas
  GROUP BY cliente_id
  HAVING SUM(monto) > 250;

- Resultado:

  cliente_id	total_ventas
    101	         500

## ****Python (3 puntos)****


### 1. ¿Cuál es la diferencia entre una lista y un diccionario en Python? Dé un ejemplo de cada uno. (1 punto)

- Lista: Es una colección ordenada y mutable de elementos. Los elementos en una lista están indexados y pueden ser de cualquier tipo. Se definen usando corchetes [].

Ejemplo de lista:

  Lenguajes = ["Python", "Php", "Java"]
  print(Lenguajes[1])  # Salida: "Php"

- Diccionario: Es una colección no ordenada de pares clave-valor. Los diccionariosse utilizan para almacenar datos en forma de clave-valor. Se definen usando llaves {}.

  persona = {"nombre": "Andres", "edad": 26, "ciudad": "Bogota"}
  print(persona["ciudad"])  # Salida: Bogota

- Conclusion: Las listas son accesibles por su indice y los diccionarios son accesibles por su valor. 

#### 2. ¿Qué librerías en Python se utilizan comúnmente para análisis de datos? Mencioneal menos tres. (1 punto)

  1. Pandas: Es una librería que proporciona estructuras de datos flexibles y eficientes para manipular y analizar datos. Es especialmente útil para trabajar con datos
     tabulares, como archivos CSV o Excel.
  2. Seaborn: Para visualizacion estadistica.
  3. Matplotlib: Visualización de datos mediante gráficos y diagramas.


##### 3. ¿Qué salida generará el siguiente código en Python? (1 punto)
      data = [5, 3, 9, 1]
      print(sorted(data)[-2])

 - El codigo genera la salida: 5.
    
    - sorted(data): La función sorted() ordena la lista data en orden ascendente. La original es [5, 3, 9, 1], y después de ordenarla, se convierte en [1, 3, 5, 9].
    - [-2]: El índice -2 se refiere al segundo elemento desde el final de la listaya ordenada. El segundo elemento desde el final es 5.

### **Visualización de datos - Tableau (4 puntos)**

#### 1. ¿Cuál es la diferencia entre una medida y una dimensión en Tableau? (1 punto)

- Dimensión: Son variables categóricas que dividen los datos en grupos. Por ejemplo, "País", "Categoría de producto" o "Año".
- Medida: Son valores numéricos sobre los que se pueden aplicar cálculos y agregaciones. Por ejemplo, "Ventas", "Beneficio" o "Cantidad vendida".

Diferencia clave:

1. Las dimensiones se utilizan para categorizar y segmentar los datos.
2. Las medidas se utilizan para realizar cálculos y agregaciones sobre los datos.


##### 2. ¿Qué tipo de gráfico es más adecuado para comparar porcentajes de una variable categórica? (1 punto)

- El tipo de grafico más adecuado para comparar porcentajes de una variable categórica es el gráfico de barras o
  el grafico de torta (es más efectivo cuando hay pocas categorias).

##### 3. ¿Cómo se puede crear un filtro dinámico en Tableau para que el usuario pueda seleccionar un rango de fechas? (1 punto)

- Paso a paso:
  1. Arrastrar el campo de la fecha a la seccion de filtros.
  2. En el cuadro que aparece, seleccionamos Rango de fechas y aceptar.
  3. El usuario podrá interactuar con este filtro para seleccionar un rango de fechas específico.
  4. También se puede personalizar el filtro para que aparezca como un control deslizante o un selector de calendario, dependiendo las preferencias del usuario. 


##### 4. ¿Que es un archivo hyper en tableau, y en que caso de uso se puede aplicar? (1punto)

- Los archivos .hyper estan diseñados para manejar grandes volúmenes de datos de manera más eficiente, con un mejor soporte para consultas complejas
  y operaciones de agregación.

# Casos de uso:
  - Se utiliza cuando se necesitan tiempos de respuesta más rápidos en consultas grandes.
  - Permite trabajar con datos desconectados de la fuente original.
  - Es útil para mejorar el rendimiento en análisis de grandes volúmenes de datos.

Ejemplo: Si una empresa extrae datos de una base de datos SQL y quiere analizarlos en Tableau sin conectarse continuamente, 
         puede usar un archivo .hyper para mejorar la eficiencia.

