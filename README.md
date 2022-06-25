

## Mercado Libre Challenge 2022

#### By César Guasca Asencio

## De que se trató:
Era necesario construir una aplicación sencilla pero eficiente consumiendo el backend público expuesto para realizar una búsqueda de productos.

**La solución:**

- Crear todo el ecosistema de aplicaciones en el ambiente de Colombia expuesto para desarrolladores
- Con los parámetros que allí  arroja, appId, clientId, clientSecret y uri consumir la URL de pruebas para obtener el codeId y con este se obtiene el token y a su vez el refresh_token que es usado para realizar el consumo de search con el parámetro de query, uno de los tantos endpoints del api
- Con esta estructura bien definida e interiozada procedí a crear un app con bases de arquitecturas limpias y principios SOLID, que explicaré más a detalle a continuación 

## Patrón de arquitectura

Es un patrón basado en VIP + Worker, con algunas variaciones para poder atacar el problema, básicamente se adicionó la capa de dominio y datos para poder separar las funcionalidades de autenticación (obtener el token) y la búsqueda como tal 

![](https://camo.githubusercontent.com/e91f70cc026b434a2f50651c11b383320c1411985b02bcb618c8c13cfa60581d/68747470733a2f2f63646e2d696d616765732d312e6d656469756d2e636f6d2f6d61782f323030302f312a5156346e785750645f736247686f574f2d58375066512e706e67)


## Worker con Concurrencia y Manejo de errores

Tiene implementado el consumo de las apis de Mercado Libre manejadas por concurrencia, haciendo algo distinto a lo comúnmente usado con closures pero no haciéndolo tan complejo con observadores y utilizando toda la potencia de esta característica para optimizar el manejo del centro de despachos y controlando el orden de ejecución y dependencia de los mismos métodos 

## Patrones de diseño usados

- **Dependency Inyection**: Para la creación de los controladores inyectando su Interactor, presenter y modelos
- **Delegates**: Se uso para comunicar las distintas capas de la arquitectura entre sí para transportar los modelos y respuestas
- **Decorator**: Para poder inyectar los distintos tipos de Worker sin afectar la funcionalidad y agrupar su definición

entre otros…

## Usando principios SOLID

Cada uno de los módulos del app está cuidadosamente diseñado para respetar estos 5 principios tan importantes

## Pruebas unitarias

Es quizás la deuda técnica más grande en esta oportunidad, no fueron ejecutadas un número significativo de pruebas debido a la ausencia de tiempo para dedicarle a la prueba, de todas maneras a modo de reto me gustaría terminar más adelante el challenge con el número suficiente de recursos de testero de código 

### Gracias y éxitos en sus proyectos.
