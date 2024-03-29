/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2011-1-11 17:45:02                           */
/*==============================================================*/

create database `petclinic` default character set utf8;

use `petclinic`;

drop table if exists tbl_administrator;

drop table if exists tbl_appointment;

drop index unique_index_name on tbl_clinic;

drop table if exists tbl_clinic;

drop table if exists tbl_daily_outpatient;

drop table if exists tbl_diagnosis;

drop table if exists tbl_interrogation;

drop table if exists tbl_pet;

drop table if exists tbl_pet_category;

drop table if exists tbl_petowner;

drop index unique_index_username on tbl_user;

drop table if exists tbl_user;

drop table if exists tbl_veterinarian;

/*==============================================================*/
/* Table: tbl_administrator                                     */
/*==============================================================*/
create table tbl_administrator
(
   id                   int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_appointment                                       */
/*==============================================================*/
create table tbl_appointment
(
   id                   int not null auto_increment,
   daily_outpatient_id  int,
   petowner_id          int,
   serial_no            varchar(31),
   status               varchar(15),
   memo                 varchar(255),
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_clinic                                            */
/*==============================================================*/
create table tbl_clinic
(
   id                   int not null auto_increment,
   name                 varchar(63) not null,
   introduction         varchar(2047),
   grade                smallint,
   address              varchar(255),
   telephone            varchar(31),
   email                varchar(255),
   star                 smallint,
   management_password  varchar(255) not null,
   status               varchar(15),
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Index: unique_index_name                                     */
/*==============================================================*/
create unique index unique_index_name on tbl_clinic
(
   name
);

/*==============================================================*/
/* Table: tbl_daily_outpatient                                  */
/*==============================================================*/
create table tbl_daily_outpatient
(
   id                   int not null auto_increment,
   vet_id               int,
   day                  date,
   count_limit          smallint,
   count_actual         smallint,
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_diagnosis                                         */
/*==============================================================*/
create table tbl_diagnosis
(
   id                   int not null auto_increment,
   interrogation_id     int,
   vet_id               int,
   symptom              varchar(512),
   diagnosis            varchar(512),
   therapy              varchar(512),
   prescription         varchar(512),
   star                 smallint,
   status               varchar(15),
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_interrogation                                     */
/*==============================================================*/
create table tbl_interrogation
(
   id                   int not null auto_increment,
   pet_id               int,
   petowner_id          int,
   vet_id               int,
   name                 varchar(63),
   start_date           datetime,
   symptom              varchar(2000),
   memo                 varchar(255),
   status               varchar(15),
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_pet                                               */
/*==============================================================*/
create table tbl_pet
(
   id                   int not null auto_increment,
   petowner_id          int,
   category_id          int,
   name                 varchar(63) not null,
   gender               varchar(6),
   birthdate            date,
   introduction         varchar(255),
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_pet_category                                      */
/*==============================================================*/
create table tbl_pet_category
(
   id                   int not null auto_increment,
   name                 varchar(31) not null,
   description          varchar(255),
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_petowner                                          */
/*==============================================================*/
create table tbl_petowner
(
   id                   int not null,
   id_card              varchar(18),
   birthdate            date,
   address              varchar(255),
   zipcode              char(6),
   telephone            varchar(31),
   primary key (id)
);

/*==============================================================*/
/* Table: tbl_user                                              */
/*==============================================================*/
create table tbl_user
(
   id                   int not null auto_increment,
   username             varchar(63) not null,
   password             varchar(255),
   temp_password        varchar(255),
   email                varchar(255) not null,
   name                 varchar(31),
   gender               varchar(6),
   status               varchar(15),
   user_type            smallint not null,
   created_date         datetime,
   created_by           int,
   last_modified_date   datetime,
   last_modified_by     int,
   primary key (id)
);

/*==============================================================*/
/* Index: unique_index_username                                 */
/*==============================================================*/
create unique index unique_index_username on tbl_user
(
   username
);

/*==============================================================*/
/* Table: tbl_veterinarian                                      */
/*==============================================================*/
create table tbl_veterinarian
(
   id                   int not null,
   clinic_id            int not null,
   title                varchar(31),
   introduction         varchar(255),
   telephone            varchar(31),
   birthdate            date,
   workingdate          date not null,
   speciality_category_id int,
   primary key (id)
);

