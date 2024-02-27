# CODER SQL

## Introducción

Para el proyecto final se realizó una base de datos de una ecommerce simple, sobre el cual se buscaba llevar un registro de usuarios con sus ordenes y preferencias, y productos con sus categorias.

### Objetivo

El proyecto busca establecer un registro actualizado de los usuarios del ecommerce y como interactúan con los productos que ofrece. Esto abarca las acciones de agregar al carrito, crear ordenes, guardar productos como favoritos y escribir reseñas de estos. Por otro lado, se busca poder normalizar los datos de producto mediante una tabla de categoría (se buscará normalizar aun más en el futuro). Y por último, se busca tener todos los datos de la dirección de usuario a la hora de crear una orden, mediante la creación de una tabla "address" y otra puente llamada "user_address".

### Situación problemática

El uso de una base de datos en un ecommerce es fundamental porque permite almacenar y gestionar de manera eficiente una gran cantidad de información crítica, como inventario de productos (a agregar en un futuro), detalles de clientes, historial de pedidos y preferencias de compra. Esto facilita la personalización de la experiencia del usuario, agiliza los procesos de compra, permite análisis de datos para tomar decisiones estratégicas, garantiza la integridad y seguridad de los datos, y facilita la escalabilidad del negocio al adaptarse al crecimiento y la evolución de la empresa y sus necesidades.

### Modelo de negocio

La organización del modelo planteado para la base de datos del ecommerce busca recopilar, almacenar y administrar información sobre sus usuarios, almacenando sus datos personales, sus preferencias en cuanto a productos, sus reseñas de estos, etc.
La idea de la base de datos es poder utilizar la información recopilada para generar decisiones sobre que productos lanzar en el futuro, determinar estrategias de descuentos/publicidad, quitar productos si no tienen el suficiente desempeño, entre otras cosas.
También se busca que la dirección de los usuarios sea de facil acceso para agilizar el proceso de finalizar compra.

## Diagrama Entidad Relación

### EER

![eer-model](https://github.com/jp-quintana/coder-sql/assets/87621233/9535b089-7046-4aa0-b30c-a03d8bf043ed)

### ER

El diagrama se puede visualizar bajandose el archivo correspondiente y abriendolo en [draw.io](https://app.diagrams.net/).
![erd-diagram](https://github.com/jp-quintana/coder-sql/assets/87621233/86fd79b1-b55d-4593-8e0f-d8afb7319884)


## Lista de Tablas

La lista de tablas con sus descripciones se puede visualizar bajandose el archivo correspondiente y abriendolo en excel.

