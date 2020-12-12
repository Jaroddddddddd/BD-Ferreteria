/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     6/12/2020 22:03:21                           */
/*==============================================================*/


drop table CARGO;

drop table CATEGORIA;

drop table CLIENTE;

drop table DETALLE_FACTURA;

drop table DETALLE_LOTE;

drop table EMPLEADOS;

drop table FACTURA;

drop table INVENTARIO;

drop table LOTE;

drop table MARCA;

drop table PERMISOS;

drop table PRODUCTOS;

drop table PROVEDOR;

drop table SUCURSAL;

drop table TIPO_CLIENTE;

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   CARGO_CODIGO         VARCHAR(5)           not null,
   CARGO_NOMBRE         VARCHAR(30)          not null,
   constraint PK_CARGO primary key (CARGO_CODIGO)
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   CATEGORIA_CODIGO     INT4                 not null,
   CATEGORIA_NOMBRE     VARCHAR(50)          not null,
   constraint PK_CATEGORIA primary key (CATEGORIA_CODIGO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CLIENTE_CEDULA       INT4                 not null,
   TIPO_CLIENTE_CODIGO  INT4                 null,
   CLIENTE_RUC          INT4                 null,
   CLIENTES_APELLIDOS   VARCHAR(50)          not null,
   CLIENTE_NOMBRES      VARCHAR(50)          not null,
   CLIENTE_TELEFONO     INT4                 not null,
   CLIENTE_DIRECCION    VARCHAR(100)         not null,
   CLIENTE_CORREO       VARCHAR(50)          not null,
   constraint PK_CLIENTE primary key (CLIENTE_CEDULA)
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   PRODUCTOS_CODIGO     INT4                 not null,
   FACTURA_CODIGO       INT4                 not null,
   DETALLE_FACTURA_CANTIDAD INT4                 not null,
   DETALLE_FACTURA_SUBTOTAL NUMERIC              not null,
   constraint PK_DETALLE_FACTURA primary key (PRODUCTOS_CODIGO, FACTURA_CODIGO)
);

/*==============================================================*/
/* Table: DETALLE_LOTE                                          */
/*==============================================================*/
create table DETALLE_LOTE (
   LOTE_CODIGO          INT4                 not null,
   PRODUCTOS_CODIGO     INT4                 not null,
   DETALLE_LOTE_CANTIDAD CHAR(10)             not null,
   DETALLE_LOTE_PRECIO_UNITARIO CHAR(10)             not null,
   constraint PK_DETALLE_LOTE primary key (LOTE_CODIGO, PRODUCTOS_CODIGO)
);

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   EMPLEADOS_CODIGO     VARCHAR(10)          not null,
   CARGO_CODIGO         VARCHAR(5)           null,
   SUCURSAL_CODIGO      INT4                 null,
   EMPLEADOS_CEDULA     INT4                 not null,
   EMPLEADOS_APELLIDOS  VARCHAR(30)          not null,
   EMPLEADOS_NOMBRE     VARCHAR(30)          not null,
   EMPLEADOS_DIRECCION  VARCHAR(100)         not null,
   EMPLEADOS_TELEFONO_FIJO INT4                 null,
   EMPLEADOS_TELEFONO_MOVIL INT4                 not null,
   EMPLEADOS_CORREO     VARCHAR(30)          not null,
   EMPLEADOS_SUELDO_NETO NUMERIC              not null,
   EMPLEADOS_SEGURO_SOCIAL NUMERIC              not null,
   EMPLEADOS_SUELDO_TOTAL NUMERIC              not null,
   constraint PK_EMPLEADOS primary key (EMPLEADOS_CODIGO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   FACTURA_CODIGO       INT4                 not null,
   CLIENTE_CEDULA       INT4                 null,
   SUCURSAL_CODIGO      INT4                 null,
   FACTURA_FECHA        DATE                 not null,
   FACTURA_DESCUENTO    NUMERIC              not null,
   FACTURA_SUBTOTAL     NUMERIC              not null,
   FACTURA_IMPUESTO     NUMERIC              not null,
   FACTURA_TOTAL        NUMERIC              not null,
   constraint PK_FACTURA primary key (FACTURA_CODIGO)
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO (
   INVENTARIO_CODIGO    INT4                 not null,
   SUCURSAL_CODIGO      INT4                 null,
   PRODUCTOS_CODIGO     INT4                 null,
   INVENTARIO_CANTIDAD_BODEGA INT4                 not null,
   constraint PK_INVENTARIO primary key (INVENTARIO_CODIGO)
);

/*==============================================================*/
/* Table: LOTE                                                  */
/*==============================================================*/
create table LOTE (
   LOTE_CODIGO          INT4                 not null,
   SUCURSAL_CODIGO      INT4                 null,
   PROVEEDOR_CODIGO     INT4                 null,
   LOTE_FECHA_INGRESO   DATE                 not null,
   LOTE_IMPUESTOS       NUMERIC              not null,
   LOTE_DESCUENTO       NUMERIC              not null,
   LOTE_TOTAL           NUMERIC              null,
   constraint PK_LOTE primary key (LOTE_CODIGO)
);

/*==============================================================*/
/* Table: MARCA                                                 */
/*==============================================================*/
create table MARCA (
   MARCA_CODIGO         INT4                 not null,
   MARCA_NOMBRE         VARCHAR(50)          not null,
   constraint PK_MARCA primary key (MARCA_CODIGO)
);

/*==============================================================*/
/* Table: PERMISOS                                              */
/*==============================================================*/
create table PERMISOS (
   PERMISOS_CODIGO      INT4                 not null,
   CARGO_CODIGO         VARCHAR(5)           null,
   PERMISOS_INVENTARIO  boolean              not null,
   PERMISOS_FACTURACION boolean              not null,
   PERMISOS_REPORTES    boolean              not null,
   PERMISOS_ROLES       boolean              not null,
   constraint PK_PERMISOS primary key (PERMISOS_CODIGO)
);


/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   PRODUCTOS_CODIGO     INT4                 not null,
   MARCA_CODIGO         INT4                 null,
   CATEGORIA_CODIGO     INT4                 null,
   PROVEEDOR_CODIGO     INT4                 null,
   PRODUCTOS_DESCRIPCION VARCHAR(100)         not null,
   PRODUCTOS_PRECIO_UNITARIO NUMERIC              not null,
   constraint PK_PRODUCTOS primary key (PRODUCTOS_CODIGO)
);

/*==============================================================*/
/* Table: PROVEDOR                                              */
/*==============================================================*/
create table PROVEDOR (
   PROVEEDOR_CODIGO     INT4                 not null,
   PROVEEDOR_NOMBRE     VARCHAR(50)          not null,
   PROVEEDOR_DIRECCION  VARCHAR(100)         not null,
   PROVEEDOR_TELEFONO   INT4                 not null,
   PROVEEDOR_CORREO     VARCHAR(50)          not null,
   PROVEEDOR_PAIS       VARCHAR(30)          not null,
   PROVEEDOR_CIUDAD     VARCHAR(30)          not null,
   constraint PK_PROVEDOR primary key (PROVEEDOR_CODIGO)
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   SUCURSAL_CODIGO      INT4                 not null,
   SUCURSAL_NOMBRE      VARCHAR(100)         not null,
   SUCURSAL_TELEFONO    INT4                 not null,
   SUCURSAL_CORREO      VARCHAR(30)          not null,
   SUCURSAL_DIRECCION   VARCHAR(100)		 not null,
   SUCURSAL_CIUDAD      VARCHAR(30)	     	 not null,
   SUCURSAL_PAIS        VARCHAR(30)	     	 not null,
   constraint PK_SUCURSAL primary key (SUCURSAL_CODIGO)
);


/*==============================================================*/
/* Table: TIPO_CLIENTE                                          */
/*==============================================================*/
create table TIPO_CLIENTE (
   TIPO_CLIENTE_CODIGO  INT4                 not null,
   TIPO_CLIENTE_NOMBRE  CHAR(30)             not null,
   TIPO_CLIENTE_DESCUENTO INT4                 not null,
   constraint PK_TIPO_CLIENTE primary key (TIPO_CLIENTE_CODIGO)
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_TIPO_CLI foreign key (TIPO_CLIENTE_CODIGO)
      references TIPO_CLIENTE (TIPO_CLIENTE_CODIGO)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__DETALLE_F_PRODUCTO foreign key (PRODUCTOS_CODIGO)
      references PRODUCTOS (PRODUCTOS_CODIGO)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__DETALLE_F_FACTURA foreign key (FACTURA_CODIGO)
      references FACTURA (FACTURA_CODIGO)
      on delete restrict on update restrict;

alter table DETALLE_LOTE
   add constraint FK_DETALLE__DETALLE_L_LOTE foreign key (LOTE_CODIGO)
      references LOTE (LOTE_CODIGO)
      on delete restrict on update restrict;

alter table DETALLE_LOTE
   add constraint FK_DETALLE__DETALLE_L_PRODUCTO foreign key (PRODUCTOS_CODIGO)
      references PRODUCTOS (PRODUCTOS_CODIGO)
      on delete restrict on update restrict;

alter table EMPLEADOS
   add constraint FK_EMPLEADO_RELATIONS_CARGO foreign key (CARGO_CODIGO)
      references CARGO (CARGO_CODIGO)
      on delete restrict on update restrict;

alter table EMPLEADOS
   add constraint FK_EMPLEADO_RELATIONS_SUCURSAL foreign key (SUCURSAL_CODIGO)
      references SUCURSAL (SUCURSAL_CODIGO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_SUCURSAL foreign key (SUCURSAL_CODIGO)
      references SUCURSAL (SUCURSAL_CODIGO)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (CLIENTE_CEDULA)
      references CLIENTE (CLIENTE_CEDULA)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_RELATIONS_SUCURSAL foreign key (SUCURSAL_CODIGO)
      references SUCURSAL (SUCURSAL_CODIGO)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_RELATIONS_PRODUCTO foreign key (PRODUCTOS_CODIGO)
      references PRODUCTOS (PRODUCTOS_CODIGO)
      on delete restrict on update restrict;

alter table LOTE
   add constraint FK_LOTE_RELATIONS_SUCURSAL foreign key (SUCURSAL_CODIGO)
      references SUCURSAL (SUCURSAL_CODIGO)
      on delete restrict on update restrict;

alter table LOTE
   add constraint FK_LOTE_RELATIONS_PROVEDOR foreign key (PROVEEDOR_CODIGO)
      references PROVEDOR (PROVEEDOR_CODIGO)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_RELATIONS_CARGO foreign key (CARGO_CODIGO)
      references CARGO (CARGO_CODIGO)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_RELATIONS_PROVEDOR foreign key (PROVEEDOR_CODIGO)
      references PROVEDOR (PROVEEDOR_CODIGO)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_RELATIONS_MARCA foreign key (MARCA_CODIGO)
      references MARCA (MARCA_CODIGO)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_RELATIONS_CATEGORI foreign key (CATEGORIA_CODIGO)
      references CATEGORIA (CATEGORIA_CODIGO)
      on delete restrict on update restrict;

