
/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table AUDITORIAINVENTARIO (
   AUDITORIAINVENTARIO_COD      SERIAL         NOT null,
   SUCURSAL_CODIGO      INT4                 NOT null,
   PRODUCTO_CODIGO     INT4                 NOT null,
   INVENTARIO_CANTIDAD_BODEGA INT4                 NOT null,
   INVENTARIO_CANTIDAD_BODEGA_ACTUALIZADO INT4     NOT null,
   USUARIO              VARCHAR(50)                NOT null,
   FECHA                DATE                       NOT null,
   TIEMPO				TIME					   NOT null,
   constraint PK_AUDITORIAINVENTARIO primary key (AUDITORIAINVENTARIO_COD)
);

