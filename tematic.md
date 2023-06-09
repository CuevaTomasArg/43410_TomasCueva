# Base de datos para aplicacion de seguimiento de ventas para restaurantes
---
Para este proyecto se desarrollara una base de datos relacional para una hipotetica aplicacion capaz de almacenar los datos de las ventas de diferentes restaurantes para posteriormente realizar análisis del comportamiento de los clientes.
## Tablas
---
* La tabla "restaurants" almacena información sobre los restaurantes. Tiene columnas como "id" (clave primaria), "name_restaurant", "direction" y "CEO".

* La tabla "sales" almacena información sobre las ventas realizadas. Tiene columnas como "id" (clave primaria), "date_time", "type_consumption", "total_price" y "id_restaurant" (clave externa que hace referencia a la tabla "restaurants").

* La tabla "administratives" almacena información sobre los administrativos. Tiene columnas como "id" (clave primaria), "DNI", "name_administrative", "last_name", "email", "password_administratives" y "id_restaurant" (clave externa que hace referencia a la tabla "restaurants").

* La tabla "dishes" almacena información sobre los platos. Tiene columnas como "id" (clave primaria), "name_dish", "description_dish", "id_restaurant" (clave externa que hace referencia a la tabla "restaurants"), "category" y "price".

* La tabla "dishes_per_sale" establece la relación entre los platos y las ventas. Tiene columnas como "id" (clave primaria), "id_dish" (clave externa que hace referencia a la tabla "dishes") e "id_sale" (clave externa que hace referencia a la tabla "sales").

* La tabla "ingredients" almacena información sobre los ingredientes. Tiene columnas como "id" (clave primaria), "name_ingredient", "price" y "quantity".

* La tabla "ingredient_per_dish" establece la relación entre los ingredientes y los platos. Tiene columnas como "id" (clave primaria), "id_dish" (clave externa que hace referencia a la tabla "dishes") e "id_ingredient" (clave externa que hace referencia a la tabla "ingredients").

* La tabla "inventory" almacena información sobre el inventario de ingredientes. Tiene columnas como "id" (clave primaria), "stock", "date_last_update", y "id_ingredient" (clave externa que hace referencia a la tabla "ingredients").

En resumen, esta estructura de base de datos permite almacenar información relacionada con restaurantes, ventas, administrativos, platos, ingredientes e inventario, estableciendo relaciones entre las diferentes tablas para mantener la integridad y consistencia de los datos.

