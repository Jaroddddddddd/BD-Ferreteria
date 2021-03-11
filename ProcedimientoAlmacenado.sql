
CREATE OR REPLACE FUNCTION PA_EMPLEADO(VARCHAR) RETURNS void AS $$
DECLARE
  r record;
  c CURSOR FOR select 
				empleado.empleado_codigo as Codigo,
				cargo.cargo_nombre as Cargo,
				sucursal.sucursal_nombre as Sucural,
				(empleado.empleado_apellidos || ' ' || empleado.empleado_nombre) as Nombre,
				count(factura.factura_codigo) as Cantidad_Ventas_Totales,
				sum(factura.factura_total) as Total_ventas
				from empleado
				inner join cargo on cargo.cargo_codigo = empleado.cargo_codigo
				inner join sucursal on sucursal.sucursal_codigo =empleado.sucursal_codigo
				inner join factura on factura.factura_vendedor = empleado.empleado_codigo
				where empleado.empleado_codigo=$1
				group by
				Codigo,
				Cargo,
				Sucural,
				Nombre;
BEGIN
  FOR r IN c LOOP
	RAISE NOTICE 'Codigo: %, Cargo: %, Sucural: %, Nombre: %, 
	Cantidad_Ventas_Totales: %, Total_ventas: %', r.Codigo, r.Cargo, 
	r.Sucural, r.Nombre, r.Cantidad_Ventas_Totales, r.Total_ventas;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

--Ejecuta el procedimiento almacenado
SELECT * FROM PA_EMPLEADO('E31');
