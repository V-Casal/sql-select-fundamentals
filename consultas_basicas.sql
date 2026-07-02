-- ══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: Valentín Casal
-- Fecha: 02/07/2026
-- ══════════════════════════════════════════

-- Consulta 1: Exploración general de la tabla sales

SELECT * FROM sales;

-- EXPLICACIÓN: Se muestra la tabla sales completa.
-- Tiene sentido usar SELET* FROM cuando necesitamos verificar que los datos se hayan cargado correctamente o estamos explorando una tabla nueva de la cual queremos ver toda su estructura y su contenido.
-- No conviene usarlo cuando trabajamos con tablas grandes (de muchas columnas) ya que nos trae todas las columnas y si no son necesarias nos consume memoria y hace mas lenta la consigna sin sentido alguno.
-- Tampoco conviene usarlo cuando hacemos consultas de analisis, donde es mejor especificar solo las columnas que necesitemos.

-- Consulta 2: Selección de columnas específicas para finanzas

SELECT customer_id, product_id, total_amount 
FROM sales;

-- EXPLICACIÓN: Con este codigo se muestra de la tabla sales solamente las columnas seleccionadas

-- Consulta 3: Selección con alias en español para stakeholders

SELECT order_date AS fecha_pedido, product_name AS nombre_producto, quantity AS cantidad_unidades
FROM sales;

-- EXPLICACIÓN: Se muestran las columnas seleccionadas renombrando su titulo