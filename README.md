# sql-select-fundamentals

PREGUNTA 1: ¿Por qué es mala práctica usar SELECT * en producción? Mencioná al menos dos razones concretas (rendimiento, mantenibilidad, seguridad).

Usar SELECT * en producción trae todas las columnas de una tabla sin distinción, lo cual genera varios problemas concretos:
1. Rendimiento: si una tabla tiene 50 columnas pero solo necesitás 3, SELECT * igual trae las 50, consumiendo memoria y tiempo innecesariamente. En tablas con millones de registros esto puede hacer que una consulta tarde segundos en lugar de milisegundos.
2. Mantenibilidad: si en el futuro alguien agrega o elimina una columna en la tabla, todas las consultas que usen SELECT * pueden devolver resultados distintos a los esperados sin dar ningún error. En cambio, si especificás las columnas (SELECT nombre, email, ciudad) la consulta siempre devuelve exactamente lo que necesitás.
3. Seguridad: SELECT * puede exponer columnas sensibles como contraseñas, salarios o datos personales a usuarios o sistemas que no deberían tener acceso a esa información. Especificar las columnas permite controlar exactamente qué datos se exponen.

PREGUNTA 2: ¿Por qué son importantes los alias para un stakeholder no técnico? Explicá con un ejemplo concreto cómo un alias transforma total_amount en algo que cualquier persona del área de finanzas puede interpretar directamente.

Los alias permiten renombrar columnas en el resultado de una consulta para que sean más legibles e interpretables por personas que no conocen la base de datos.
Por ejemplo, si un analista del área de finanzas ejecuta esta consulta sin alias:
                                                                                  SELECT nombre, precio_unitario * cantidad
                                                                                  FROM ventas;
El resultado mostraría una columna llamada (sin nombre) o SUM(precio_unitario * cantidad), es decir, un nombre técnico que no le dice nada a alguien de finanzas.
En cambio, con alias:
                      SELECT nombre AS "Producto",
                             precio_unitario * cantidad AS "Facturación"
                      FROM ventas;

El resultado muestra columnas con nombres claros y directos. Cualquier persona del área de finanzas puede interpretar inmediatamente que "Facturación" es el monto generado por cada venta, sin necesidad de entender cómo se calculó internamente. Esto es especialmente importante cuando los resultados se exportan a Excel o se presentan en un dashboard ejecutivo.
