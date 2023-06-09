# 43410_TomasCueva
---
El presente repositorio es parte de mi proyecto final del curso de SQL de Coderhouse.

## Contenido
Dentro del repositorio, se encontraran las siguiente carpetas y directorios:
* docker/: Dentro de esta carpeta se encuentra un archivo docker-compose.yml para que puedan generar el entorno necesaeio para la ejecución de los scripts
* RestAnalytics/: Directorio principal del proyecto:
    * csv/: Se encuentran los archivos que contienen los datos para ser insertados en la base de datos mediante los comandos de bash que se encuentran en el directorio ./RestAnalytics/scripts/insercion_datos/comandos_bash.
    * scripts/: Se encuentras los scripts DML y DDL para la creación de objetos dentro de la DB y la inserción de datos.

Cada scripts tiene breves comentarios de como se debe ejecutar para no tener problemas en su primera ejecución.

## Creación del entorno
Recordar que se debe tener Docker instalado.

1. Nos posicionamos dentro del directorio docker:
```bash
cd ruta/al/proyecto/docker
```
2. Creamos el la carpeta "data":
```bash
mkdir data
```
3. Creamos el contenedor:
```bash
#La primera vez
docker-compose up --build -d

#Posteriormente
docker-compose up -d

```
Listo, ya tenemos creado nuestro contenedor con MySQL y podremos conectarnos al motor de base de datos. Si usas DBeaver puedes conectarte a través de los siguientes datos:
* user: root
* password: <password_dentro_del_environment_del_docker-compose.yml>

En el campo de bases de datos queda en blanco, no es necesario especificar una base de datos.

## Scripts
---
Dentro del directorio scripts de la carpeta RestAnalytics encontraremos las querys necesarias para la creacion de objetos e inserción de datos.

### creacion_tablas
Al ejecutar este script se creará el esquema "RestAnalytics" junto con sus tablas correspondientes

### insercion_datos
En este directorio se encontrarán los scripts de inserción de datos dentro de las tablas. 
Se recomienda ejecutar el scripts "insert_database.sql" ya que en el se encuentran todos los inserts en el orden adecuado para la inserción, sin embargo, si no quieres abrir un script con 27 mil lineas de codigo, puedes seguir el siguiente orden con los scripts:
1. restaurants.sql
2. administratives.sql
3. customers.sql
4. dishes.sql
5. sales.sql
6. dishes_per_sale.sql

### functions
En esta sección explicaremos el funcionamiento de cada función creada dentro del script, dentro del mismo hay comentarios de recomendaciones de como ejecutar la creación del objeto y como invocar las funciones:

* FN_TOP_DISH_SELLING: Esta función devuelve el plato más vendido de un restaurante. recibe como parametro un numero entero, el debe ser un id de un restaurante.
* FN_TOTAL_REVENUE: Esta función devuelve el total recaudado en unidades monetarias de un día en especifico de un restaurante especifico. Recibe 4 parametros los cuales permiten numeros enteros.
    * restaurant: id de un restaurante.
    * day_selected: día del mes (1 hasta 31)
    * month_selected: mes del año (1 hasta 12)
    * year_selected: año en numeros enteros de 4 digitos 

### views
Este directorio contiene el script de creación de VIEWS:
* VW_TOTAL_SALES_MOUNT: Monto total por cada venta registrada.
* VW_ORDERS_PER_CUSTOMER: Cantidad de ordenes por cliente.
* VW_TOTAL_COLLECTED_RESTAURANTS: Total facturado por restaurante a lo largo del tiempo.
* VW_ORDERS_BY_RESTAURANTS: Diferencia entre consusmo local y delivery por restaurante.
* VW_TOTAL_SPENT_PER_CUSTOMER: total gastado por cliente.

### stored_procedures
Este directorio contiene los siguientes procedimientos almacenados:

* SP_ORDER_TABLE: Ejecuta la consulta de una tabla ordenada a preferencia de acuerdo a un campo:
    * entity: tabla a aleccion.
    * field: campo a de la tabla.
    * order_value: solo acepta dos valores de tipo texto: "ASC" o "DESC"

* SP_ADD_RESTAURANT: Inserta un nuevo restaurante a la base de datos:
    * restaurant_name VARCHAR(75)
    * localization VARCHAR(75)
    * ceo VARCHAR(75)

* SP_GET_RESTAURANT_DISHES: Ejecuta una consulta para pedir los platos de un restaurante, solo recibe un parametro:
    * restaurant_id: id de un restaurante

### triggers
Este directorio contiene la creación de una tabla de auditorio para controlar los cambios en los siguientes Triggers:

* TGR_AUDITORIE_DISHES: Al hacer un UPDATE de las columnas "price", "category" o "name_dish" de la tabla `dishes` se llenará la tabla de auditoria con los datos correspondientes a la tabla junto con el valor anterior de cada campo.

* TRG_AUDITORIE_CUSTOMERS: Antes de que se ejecute la acción delete dentro de la tabla customer, se llenaran los campos de la tabla auditoria con los datos correspondientes a la tabla junto con el id, DNI y apellido del customer eliminado de la tabla.