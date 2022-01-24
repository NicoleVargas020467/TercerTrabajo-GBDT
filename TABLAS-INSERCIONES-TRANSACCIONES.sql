/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     24/1/2022 0:37:47                            */
/*==============================================================*/


drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_5_FK;

drop index ASCENSO_PK;

drop table Ascenso;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_7_FK;

drop index CONTRATO_PK;

drop table Contrato;

drop index EMPRESA_PK;

drop table Empresa;

drop index ENTRENAMIENTO_PK;

drop table Entrenamiento;

drop index EQUIPO_PK;

drop table Equipo;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop index EQUIPO_GUARDIA_PK;

drop table Equipo_guardia;

drop index RELATIONSHIP_14_FK;

drop index FACTURACION_PK;

drop table Facturacion;

drop index GRADO_ASCENSO_PK;

drop table Grado_Ascenso;

drop index RELATIONSHIP_13_FK;

drop index GUARDIA_PK;

drop table Guardia;

drop index RELATIONSHIP_4_FK;

drop index RELATIONSHIP_3_FK;

drop index GUARDIA_ENTRENAMIENTO_PK;

drop table Guardia_entrenamiento;

drop index HORARIO_PK;

drop table Horario;

drop index RELATIONSHIP_10_FK;

drop index MANTENIMIENTO_PK;

drop table Mantenimiento;

drop index RELATIONSHIP_9_FK;

drop index PARTE_PK;

drop table Parte;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_11_FK;

drop index PEDIDO_SERVICIO_PK;

drop table Pedido_Servicio;

drop index SERVICIOS_GUARDIANIA_PK;

drop table Servicios_Guardiania;

/*==============================================================*/
/* Table: Ascenso                                               */
/*==============================================================*/
create table Ascenso (
   Id_Guardia           INT4                 not null,
   Id_grado             INT4                 not null,
   fecha_ascenso        DATE                 null,
   constraint PK_ASCENSO primary key (Id_Guardia, Id_grado)
);

/*==============================================================*/
/* Index: ASCENSO_PK                                            */
/*==============================================================*/
create unique index ASCENSO_PK on Ascenso (
Id_Guardia,
Id_grado
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on Ascenso (
Id_Guardia
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on Ascenso (
Id_grado
);

/*==============================================================*/
/* Table: Contrato                                              */
/*==============================================================*/
create table Contrato (
   Id_contrato          INT4                 not null,
   Id_Horario           INT4                 null,
   Id_empresa           INT4                 null,
   Nombre_Contrato      VARCHAR(20)          null,
   Costo_contrato       NUMERIC              null,
   constraint PK_CONTRATO primary key (Id_contrato)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on Contrato (
Id_contrato
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on Contrato (
Id_empresa
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on Contrato (
Id_Horario
);

/*==============================================================*/
/* Table: Empresa                                               */
/*==============================================================*/
create table Empresa (
   Id_empresa           INT4                 not null,
   Nombre_empresa       VARCHAR(20)          null,
   Ruc                  NUMERIC              null,
   Pagina_web           VARCHAR(50)          null,
   Contacto             NUMERIC              null,
   constraint PK_EMPRESA primary key (Id_empresa)
);

/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on Empresa (
Id_empresa
);

/*==============================================================*/
/* Table: Entrenamiento                                         */
/*==============================================================*/
create table Entrenamiento (
   Id_entrenamiento     INT4                 not null,
   Fecha_inicio         DATE                 null,
   Fecha_final          DATE                 null,
   Duracion             VARCHAR(20)          null,
   Costo                NUMERIC              null,
   constraint PK_ENTRENAMIENTO primary key (Id_entrenamiento)
);

/*==============================================================*/
/* Index: ENTRENAMIENTO_PK                                      */
/*==============================================================*/
create unique index ENTRENAMIENTO_PK on Entrenamiento (
Id_entrenamiento
);

/*==============================================================*/
/* Table: Equipo                                                */
/*==============================================================*/
create table Equipo (
   Id_equipo            INT4                 not null,
   Nombre_equipo        VARCHAR(20)          null,
   Descripcion_equipo   VARCHAR(60)          null,
   constraint PK_EQUIPO primary key (Id_equipo)
);

/*==============================================================*/
/* Index: EQUIPO_PK                                             */
/*==============================================================*/
create unique index EQUIPO_PK on Equipo (
Id_equipo
);

/*==============================================================*/
/* Table: Equipo_guardia                                        */
/*==============================================================*/
create table Equipo_guardia (
   Id_Guardia           INT4                 not null,
   Id_equipo            INT4                 not null,
   fecha_equipo         DATE                 null,
   talla_guardia        CHAR(10)             null,
   constraint PK_EQUIPO_GUARDIA primary key (Id_Guardia, Id_equipo)
);

/*==============================================================*/
/* Index: EQUIPO_GUARDIA_PK                                     */
/*==============================================================*/
create unique index EQUIPO_GUARDIA_PK on Equipo_guardia (
Id_Guardia,
Id_equipo
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on Equipo_guardia (
Id_Guardia
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on Equipo_guardia (
Id_equipo
);

/*==============================================================*/
/* Table: Facturacion                                           */
/*==============================================================*/
create table Facturacion (
   Id_Factura           INT4                 not null,
   Id_contrato          INT4                 null,
   fecha_fact           DATE                 null,
   Total_fact           NUMERIC              null,
   constraint PK_FACTURACION primary key (Id_Factura)
);

/*==============================================================*/
/* Index: FACTURACION_PK                                        */
/*==============================================================*/
create unique index FACTURACION_PK on Facturacion (
Id_Factura
);

/*==============================================================*/
/* Index: RELATIONSHIP_14_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_14_FK on Facturacion (
Id_contrato
);

/*==============================================================*/
/* Table: Grado_Ascenso                                         */
/*==============================================================*/
create table Grado_Ascenso (
   Id_grado             INT4                 not null,
   Nombre_grado         VARCHAR(15)          null,
   Descripcion          VARCHAR(40)          null,
   constraint PK_GRADO_ASCENSO primary key (Id_grado)
);

/*==============================================================*/
/* Index: GRADO_ASCENSO_PK                                      */
/*==============================================================*/
create unique index GRADO_ASCENSO_PK on Grado_Ascenso (
Id_grado
);

/*==============================================================*/
/* Table: Guardia                                               */
/*==============================================================*/
create table Guardia (
   Id_Guardia           INT4                 not null,
   Id_contrato          INT4                 null,
   Nombre_guardia       VARCHAR(15)          null,
   Apellido_guardia     VARCHAR(15)          null,
   Fecha_nacimiento     DATE                 null,
   Tipo_sangre          VARCHAR(6)           null,
   constraint PK_GUARDIA primary key (Id_Guardia)
);

/*==============================================================*/
/* Index: GUARDIA_PK                                            */
/*==============================================================*/
create unique index GUARDIA_PK on Guardia (
Id_Guardia
);

/*==============================================================*/
/* Index: RELATIONSHIP_13_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_13_FK on Guardia (
Id_contrato
);

/*==============================================================*/
/* Table: Guardia_entrenamiento                                 */
/*==============================================================*/
create table Guardia_entrenamiento (
   Id_Guardia           INT4                 not null,
   Id_entrenamiento     INT4                 not null,
   fecha_entrenamiento  DATE                 null,
   constraint PK_GUARDIA_ENTRENAMIENTO primary key (Id_Guardia, Id_entrenamiento)
);

/*==============================================================*/
/* Index: GUARDIA_ENTRENAMIENTO_PK                              */
/*==============================================================*/
create unique index GUARDIA_ENTRENAMIENTO_PK on Guardia_entrenamiento (
Id_Guardia,
Id_entrenamiento
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on Guardia_entrenamiento (
Id_Guardia
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on Guardia_entrenamiento (
Id_entrenamiento
);

/*==============================================================*/
/* Table: Horario                                               */
/*==============================================================*/
create table Horario (
   Id_Horario           INT4                 not null,
   Inicio_jornada       TIME                 null,
   Fin_jornada          TIME                 null,
   constraint PK_HORARIO primary key (Id_Horario)
);

/*==============================================================*/
/* Index: HORARIO_PK                                            */
/*==============================================================*/
create unique index HORARIO_PK on Horario (
Id_Horario
);

/*==============================================================*/
/* Table: Mantenimiento                                         */
/*==============================================================*/
create table Mantenimiento (
   Id_mantenimiento     INT4                 not null,
   Id_parte             INT4                 null,
   nombre_mantenimiento VARCHAR(20)          null,
   descripcion_mantenimiento VARCHAR(60)          null,
   constraint PK_MANTENIMIENTO primary key (Id_mantenimiento)
);

/*==============================================================*/
/* Index: MANTENIMIENTO_PK                                      */
/*==============================================================*/
create unique index MANTENIMIENTO_PK on Mantenimiento (
Id_mantenimiento
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on Mantenimiento (
Id_parte
);

/*==============================================================*/
/* Table: Parte                                                 */
/*==============================================================*/
create table Parte (
   Id_parte             INT4                 not null,
   Id_Horario           INT4                 null,
   Descripcion_parte    VARCHAR(60)          null,
   Fecha_part           DATE                 null,
   constraint PK_PARTE primary key (Id_parte)
);

/*==============================================================*/
/* Index: PARTE_PK                                              */
/*==============================================================*/
create unique index PARTE_PK on Parte (
Id_parte
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on Parte (
Id_Horario
);

/*==============================================================*/
/* Table: Pedido_Servicio                                       */
/*==============================================================*/
create table Pedido_Servicio (
   Id_Guardia           INT4                 not null,
   Id_servicio          INT4                 not null,
   fecha_pedido         DATE                 null,
   constraint PK_PEDIDO_SERVICIO primary key (Id_Guardia, Id_servicio)
);

/*==============================================================*/
/* Index: PEDIDO_SERVICIO_PK                                    */
/*==============================================================*/
create unique index PEDIDO_SERVICIO_PK on Pedido_Servicio (
Id_Guardia,
Id_servicio
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on Pedido_Servicio (
Id_Guardia
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on Pedido_Servicio (
Id_servicio
);

/*==============================================================*/
/* Table: Servicios_Guardiania                                  */
/*==============================================================*/
create table Servicios_Guardiania (
   Id_servicio          INT4                 not null,
   Nombre_servicio      VARCHAR(40)          null,
   constraint PK_SERVICIOS_GUARDIANIA primary key (Id_servicio)
);

/*==============================================================*/
/* Index: SERVICIOS_GUARDIANIA_PK                               */
/*==============================================================*/
create unique index SERVICIOS_GUARDIANIA_PK on Servicios_Guardiania (
Id_servicio
);

alter table Ascenso
   add constraint FK_ASCENSO_RELATIONS_GUARDIA foreign key (Id_Guardia)
      references Guardia (Id_Guardia)
      on delete restrict on update restrict;

alter table Ascenso
   add constraint FK_ASCENSO_RELATIONS_GRADO_AS foreign key (Id_grado)
      references Grado_Ascenso (Id_grado)
      on delete restrict on update restrict;

alter table Contrato
   add constraint FK_CONTRATO_RELATIONS_EMPRESA foreign key (Id_empresa)
      references Empresa (Id_empresa)
      on delete restrict on update restrict;

alter table Contrato
   add constraint FK_CONTRATO_RELATIONS_HORARIO foreign key (Id_Horario)
      references Horario (Id_Horario)
      on delete restrict on update restrict;

alter table Equipo_guardia
   add constraint FK_EQUIPO_G_RELATIONS_GUARDIA foreign key (Id_Guardia)
      references Guardia (Id_Guardia)
      on delete restrict on update restrict;

alter table Equipo_guardia
   add constraint FK_EQUIPO_G_RELATIONS_EQUIPO foreign key (Id_equipo)
      references Equipo (Id_equipo)
      on delete restrict on update restrict;

alter table Facturacion
   add constraint FK_FACTURAC_RELATIONS_CONTRATO foreign key (Id_contrato)
      references Contrato (Id_contrato)
      on delete restrict on update restrict;

alter table Guardia
   add constraint FK_GUARDIA_RELATIONS_CONTRATO foreign key (Id_contrato)
      references Contrato (Id_contrato)
      on delete restrict on update restrict;

alter table Guardia_entrenamiento
   add constraint FK_GUARDIA__RELATIONS_GUARDIA foreign key (Id_Guardia)
      references Guardia (Id_Guardia)
      on delete restrict on update restrict;

alter table Guardia_entrenamiento
   add constraint FK_GUARDIA__RELATIONS_ENTRENAM foreign key (Id_entrenamiento)
      references Entrenamiento (Id_entrenamiento)
      on delete restrict on update restrict;

alter table Mantenimiento
   add constraint FK_MANTENIM_RELATIONS_PARTE foreign key (Id_parte)
      references Parte (Id_parte)
      on delete restrict on update restrict;

alter table Parte
   add constraint FK_PARTE_RELATIONS_HORARIO foreign key (Id_Horario)
      references Horario (Id_Horario)
      on delete restrict on update restrict;

alter table Pedido_Servicio
   add constraint FK_PEDIDO_S_RELATIONS_GUARDIA foreign key (Id_Guardia)
      references Guardia (Id_Guardia)
      on delete restrict on update restrict;

alter table Pedido_Servicio
   add constraint FK_PEDIDO_S_RELATIONS_SERVICIO foreign key (Id_servicio)
      references Servicios_Guardiania (Id_servicio)
      on delete restrict on update restrict;

/*INSERCIONES*/


insert into empresa values (1,'LAFABRIL',2100215545852,'lafabril@gmail.com',09563246354);
insert into empresa values (2,'INDUSTRIA ALES',1353535586865,'ales@gmail.com',096532471);
insert into empresa values (3,'BODEGAS TIA',13235626862,'tiabodegas@live.ec',0972432153);
select * from empresa;


insert into equipo values (1,'GAMMA','Guardias con regular estado fisico');
insert into equipo values (2,'BETA','Guardias con buen estado fisico');
insert into equipo values (3,'ALFA','Guardias con excelente estado fisico');
select * from equipo;

insert into horario values (1,'06:00:00','12:00:00');
insert into horario values (2,'12:00:00','18:00:00');
insert into horario values (3,'18:00:00','00:00:00');
insert into horario values (4,'00:00:00','06:00:00');
select * from horario;

insert into entrenamiento values(1,'2021/05/25','2021/06/25','1 mes',30);
insert into entrenamiento values(2,'2021/07/01','2021/09/01','2 mes',60);
insert into entrenamiento values(3,'2021/09/01','2021/10/01','1 mes',25);
select * from entrenamiento;

insert into Grado_Ascenso values (1,'Auxiliar','Guardia o persona de apoyo');
insert into Grado_Ascenso values (2,'Vigilante','Vigilancia y proteccion');
insert into Grado_Ascenso values (3,'Guarda rural','Proteccion de bienes en fincas,agricolas');
insert into Grado_Ascenso values (4,'Jefe seguridad','Analisis de situaciones de riesgo');
select * from grado_ascenso;


insert into parte values (1,1,'Parte de la manana','2021/05/01');
insert into parte values (2,2,'Parte de la tarde','2021/05/01');
insert into parte values (3,3,'Parte de la noche','2021/05/01');
insert into parte values (4,4,'Parte de la madrugada','2021/05/01');
select * from parte;

insert into servicios_guardiania values (1,'Vacaciones');
insert into servicios_guardiania values (2,'Capacitaciones');
insert into servicios_guardiania values (3,'Cambio de armamento');
select * from servicios_guardiania;

insert into mantenimiento values(1,1,'Armas','Mantenimiento de armas');
insert into mantenimiento values(2,1,'Uniformes','Mantenimiento de uniformes');
insert into mantenimiento values(3,2,'Establecimiento','Mantenimiento de establecimiento');
insert into mantenimiento values(4,3,'Control personas','Controlar cantidad de personas');
insert into mantenimiento values(5,4,'Tecnologia ','Mantenimiento de celulares y pc');
select * from mantenimiento;

insert into contrato values (1,2,1,'Vigilancia','150000');
insert into contrato values (2,3,1,'Custodia de Dinero','200000');
insert into contrato values (3,2,2,'Vigilancia','150000');
insert into contrato values (4,1,3,'Vigilancia','150000');
select * from contrato;

insert into guardia values(1,2,'Sergio','Loor','1995/05/08','O+');
insert into guardia values(2,3,'Luis','Pivaque','1996/10/10','O+');
insert into guardia values(3,1,'Carla','Fernandez','1998/11/04','O-');
insert into guardia values(4,2,'Andres','Suarez','1995/02/12','A+');
insert into guardia values(5,3,'Javier','Pico','1997/12/21','O+');
select * from guardia;

insert into facturacion values(1,1,'2021/10/12',150000);
insert into facturacion values(2,2,'2021/10/12',200000);
insert into facturacion values(3,3,'2021/10/12',150000);
insert into facturacion values(4,4,'2021/10/12',150000);
insert into facturacion values(5,1,'2020/10/12',150000);
insert into facturacion values(6,2,'2019/10/12',200000);
insert into facturacion values(7,2,'2018/10/12',300000);
insert into facturacion values(8,3,'2020/10/12',50000);
insert into facturacion values(9,4,'2019/10/12',100000);
select * from facturacion;

insert into equipo_guardia values(1,1,'2021/05/24','XL');
insert into equipo_guardia values(2,3,'2021/05/24','M');
insert into equipo_guardia values(3,2,'2021/05/24','L');
insert into equipo_guardia values(4,1,'2021/05/24','XL');
insert into equipo_guardia values(5,3,'2021/05/24','M');
SELECT * FROM EQUIPO_GUARDIA;

insert into ascenso values (1,2,'2021/08/24');
insert into ascenso values (1,3,'2021/12/10');
insert into ascenso values (2,3,'2021/12/10');
insert into ascenso values (4,4,'2021/09/11');
insert into ascenso values (3,3,'2021/12/10');
insert into ascenso values (5,2,'2021/08/24');
select * from ascenso;

insert into guardia_entrenamiento values(1,1,'2021/05/28');
insert into guardia_entrenamiento values(1,2,'2021/07/10');
insert into guardia_entrenamiento values(2,1,'2021/06/03');
insert into guardia_entrenamiento values(3,2,'2021/07/11');
insert into guardia_entrenamiento values(4,3,'2021/09/20');
insert into guardia_entrenamiento values(5,3,'2021/09/02');
select * from guardia_entrenamiento;


insert into pedido_servicio values (1,1,'2021/10/14');
insert into pedido_servicio values (2,1,'2021/11/13');
insert into pedido_servicio values (2,2,'2021/09/20');
insert into pedido_servicio values (3,1,'2021/07/03');
insert into pedido_servicio values (4,2,'2021/07/12');
insert into pedido_servicio values (4,3,'2021/10/21');
insert into pedido_servicio values (5,3,'2021/12/05');
select * from pedido_servicio;



--TRANSACCIONES
CREATE OR REPLACE PROCEDURE public.contrato(
    IN INT,
	IN INT,
	IN INT,
	IN VARCHAR,
	IN INT
)
LANGUAGE 'plpgsql'
AS $BODY$
    begin
    INSERT INTO public.contrato(
    id_contrato, id_horario, id_empresa, nombre_contrato, costo_contrato)
    VALUES ($1, $2, $3, $4, $5);
    update contrato set costo_contrato = contrato.costo_contrato + 1000 where id_contrato=$1;
    exception
        when sqlstate '23514' then
        raise exception 'No se realizo la transaccion';
        rollback;
    commit;
end;
$BODY$;




CREATE OR REPLACE PROCEDURE public.facturacion(
    IN INT,
	IN INT,
	IN DATE,
	IN INT
)
LANGUAGE 'plpgsql'
AS $BODY$
    begin
    INSERT INTO public.facturacion(
    id_factura, id_contrato, fecha_fact, total_fact)
    VALUES ($1, $2, $3, $4);
    update facturacion set total_fact = (facturacion.total_fact * 0.12)+facturacion.total_fact where id_factura=$1;
    exception
        when sqlstate '23514' then
        raise exception 'No se realizo la transaccion';
        rollback;
    commit;
end;
$BODY$;