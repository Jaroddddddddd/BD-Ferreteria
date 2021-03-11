
--Cursor

CREATE OR REPLACE FUNCTION recorrer_cursor_for() RETURNS void AS $$
DECLARE
  r record;
  c CURSOR FOR select 
						cliente.cliente_genero as Genero,
						sum (factura.factura_total) as Total
						from cliente
						inner join factura on factura.cliente_cedula = cliente.cliente_cedula
						WHERE extract(month from factura.factura_fecha)=date_part('month',current_date)
						group by 
						cliente.cliente_genero;
BEGIN
  FOR r IN c LOOP
	RAISE NOTICE 'Genero: %, Total: %', r.Genero, r.Total;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

--Ejecuta la funcion del cursor
SELECT * FROM recorrer_cursor_for();
