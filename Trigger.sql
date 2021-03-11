--Trigger
CREATE OR REPLACE FUNCTION TR_AUDITORIAINVENTARIO() 
RETURNS TRIGGER AS
$$
DECLARE
BEGIN
	insert into AUDITORIAINVENTARIO(SUCURSAL_CODIGO,PRODUCTO_CODIGO,
									INVENTARIO_CANTIDAD_BODEGA,
									INVENTARIO_CANTIDAD_BODEGA_ACTUALIZADO,
								    USUARIO,FECHA,TIEMPO) 
									VALUES(OLD.SUCURSAL_CODIGO, OLD.PRODUCTOS_CODIGO,
										  OLD.INVENTARIO_CANTIDAD_BODEGA,
										  new.INVENTARIO_CANTIDAD_BODEGA,
										  current_user,
										  current_date,
										  current_time);
  return new;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_AUDITORIAINVENTARIO before update
on inventario for each row
EXECUTE PROCEDURE TR_AUDITORIAINVENTARIO();

select * from INVENTARIO;

update INVENTARIO set 
INVENTARIO_CANTIDAD_BODEGA = 80
WHERE INVENTARIO_CODIGO = 1

select * from AUDITORIAINVENTARIO;
