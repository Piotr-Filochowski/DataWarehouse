/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     12.09.2019 08:36:33                          */
/*==============================================================*/

USE Zrodlo1;

if exists (select 1
            from  sysobjects
           where  id = object_id('DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table DOLADOWANIE_TELEFONU
go



if exists (select 1
            from  sysobjects
           where  id = object_id('KARTA')
            and   type = 'U')
   drop table KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('KONTO')
            and   type = 'U')
   drop table KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OPERATOR')
            and   type = 'U')
   drop table OPERATOR
go


if exists (select 1
            from  sysobjects
           where  id = object_id('PLATNOSC_KARTA')
            and   type = 'U')
   drop table PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('POZYCZKA')
            and   type = 'U')
   drop table POZYCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TERMINAL')
            and   type = 'U')
   drop table TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table WPLATA_RATY_POZYCZKI
go

/*==============================================================*/
/* Table: DOLADOWANIE_TELEFONU                                  */
/*==============================================================*/
create table DOLADOWANIE_TELEFONU (
   ID_DOLADOWANIA       numeric              not null,
   ID_KONTA             numeric              null,
   ID_OPERATOR          numeric              null,
   NUMER_TELEFONU       varchar(11)          not null,
   KWOTA_DOLADOWANIA    money                not null,
   constraint PK_DOLADOWANIE_TELEFONU primary key (ID_DOLADOWANIA)
)
go

/*==============================================================*/
/* Table: KARTA                                                 */
/*==============================================================*/
create table KARTA (
   ID_KARTY             numeric              not null,
   ID_KONTA             numeric              null,
   NUMER_KARTY          numeric              not null,
   CVC                  numeric              not null,
   DATA_WAZNOSCI_KARTY  datetime             not null,
   constraint PK_KARTA primary key (ID_KARTY)
)
go

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   constraint PK_KONTO primary key (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   constraint PK_OPERATOR primary key (ID_OPERATOR)
)
go

/*==============================================================*/
/* Table: PLATNOSC_KARTA                                        */
/*==============================================================*/
create table PLATNOSC_KARTA (
   ID_PLATNOSCI         numeric              not null,
   ID_KARTY             numeric              null,
   ID_TERMINALU         numeric              null,
   WARTOSC              float                not null,
   DATA_PLATNOSCI       datetime             not null,
   constraint PK_PLATNOSC_KARTA primary key (ID_PLATNOSCI)
)
go

/*==============================================================*/
/* Table: POZYCZKA                                              */
/*==============================================================*/
create table POZYCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   constraint PK_POZYCZKA primary key (ID_POZYCZKA)
)
go

/*==============================================================*/
/* Table: TERMINAL                                              */
/*==============================================================*/
create table TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   constraint PK_TERMINAL primary key (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: WPLATA_RATY_POZYCZKI                                  */
/*==============================================================*/
create table WPLATA_RATY_POZYCZKI (
   ID_RATY              numeric              not null,
   ID_POZYCZKA          numeric              null,
   ID_KONTA             numeric              not null,
   KWOATA               money                not null,
   DATA_WPLATY_RATY     datetime             not null,
   constraint PK_WPLATA_RATY_POZYCZKI primary key (ID_RATY)
)
go
