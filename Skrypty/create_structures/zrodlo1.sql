/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     12.09.2019 08:36:33                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOLADOWANIE_TELEFONU') and o.name = 'FK_DOLADOWA_KONTO_DOL_KONTO')
alter table DOLADOWANIE_TELEFONU
   drop constraint FK_DOLADOWA_KONTO_DOL_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOLADOWANIE_TELEFONU') and o.name = 'FK_DOLADOWA_OPERATOR__OPERATOR')
alter table DOLADOWANIE_TELEFONU
   drop constraint FK_DOLADOWA_OPERATOR__OPERATOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KARTA') and o.name = 'FK_KARTA_KONTO_KAR_KONTO')
alter table KARTA
   drop constraint FK_KARTA_KONTO_KAR_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLATNOSC_KARTA') and o.name = 'FK_PLATNOSC_KARTA_PLA_KARTA')
alter table PLATNOSC_KARTA
   drop constraint FK_PLATNOSC_KARTA_PLA_KARTA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PLATNOSC_KARTA') and o.name = 'FK_PLATNOSC_TERMINAL__TERMINAL')
alter table PLATNOSC_KARTA
   drop constraint FK_PLATNOSC_TERMINAL__TERMINAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WPLATA_RATY_POZYCZKI') and o.name = 'FK_WPLATA_R_KONTO_WPL_KONTO')
alter table WPLATA_RATY_POZYCZKI
   drop constraint FK_WPLATA_R_KONTO_WPL_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WPLATA_RATY_POZYCZKI') and o.name = 'FK_WPLATA_R_PO¯YCZKA__PO¯YCZKA')
alter table WPLATA_RATY_POZYCZKI
   drop constraint FK_WPLATA_R_PO¯YCZKA__PO¯YCZKA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DOLADOWANIE_TELEFONU')
            and   name  = 'OPERATOR_DOLADOWNIE_TELEFONU_FK'
            and   indid > 0
            and   indid < 255)
   drop index DOLADOWANIE_TELEFONU.OPERATOR_DOLADOWNIE_TELEFONU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DOLADOWANIE_TELEFONU')
            and   name  = 'KONTO_DOLADOWANIE_TELEFONU_FK'
            and   indid > 0
            and   indid < 255)
   drop index DOLADOWANIE_TELEFONU.KONTO_DOLADOWANIE_TELEFONU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table DOLADOWANIE_TELEFONU
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('KARTA')
            and   name  = 'KONTO_KARTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index KARTA.KONTO_KARTA_FK
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
            from  sysindexes
           where  id    = object_id('PLATNOSC_KARTA')
            and   name  = 'TERMINAL_PLATNOSC_KARTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLATNOSC_KARTA.TERMINAL_PLATNOSC_KARTA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PLATNOSC_KARTA')
            and   name  = 'KARTA_PLATNOSC_KARTA_FK'
            and   indid > 0
            and   indid < 255)
   drop index PLATNOSC_KARTA.KARTA_PLATNOSC_KARTA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PLATNOSC_KARTA')
            and   type = 'U')
   drop table PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PO¯YCZKA')
            and   type = 'U')
   drop table PO¯YCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TERMINAL')
            and   type = 'U')
   drop table TERMINAL
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WPLATA_RATY_POZYCZKI')
            and   name  = 'KONTO_WPLATA_RATY_POZYCZKI_FK'
            and   indid > 0
            and   indid < 255)
   drop index WPLATA_RATY_POZYCZKI.KONTO_WPLATA_RATY_POZYCZKI_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WPLATA_RATY_POZYCZKI')
            and   name  = 'PO¯YCZKA_RATA_PO¯YCZKI_FK'
            and   indid > 0
            and   indid < 255)
   drop index WPLATA_RATY_POZYCZKI.PO¯YCZKA_RATA_PO¯YCZKI_FK
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
/* Index: KONTO_DOLADOWANIE_TELEFONU_FK                         */
/*==============================================================*/




create nonclustered index KONTO_DOLADOWANIE_TELEFONU_FK on DOLADOWANIE_TELEFONU (ID_KONTA ASC)
go

/*==============================================================*/
/* Index: OPERATOR_DOLADOWNIE_TELEFONU_FK                       */
/*==============================================================*/




create nonclustered index OPERATOR_DOLADOWNIE_TELEFONU_FK on DOLADOWANIE_TELEFONU (ID_OPERATOR ASC)
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
/* Index: KONTO_KARTA_FK                                        */
/*==============================================================*/




create nonclustered index KONTO_KARTA_FK on KARTA (ID_KONTA ASC)
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
/* Index: KARTA_PLATNOSC_KARTA_FK                               */
/*==============================================================*/




create nonclustered index KARTA_PLATNOSC_KARTA_FK on PLATNOSC_KARTA (ID_KARTY ASC)
go

/*==============================================================*/
/* Index: TERMINAL_PLATNOSC_KARTA_FK                            */
/*==============================================================*/




create nonclustered index TERMINAL_PLATNOSC_KARTA_FK on PLATNOSC_KARTA (ID_TERMINALU ASC)
go

/*==============================================================*/
/* Table: PO¯YCZKA                                              */
/*==============================================================*/
create table PO¯YCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   constraint PK_PO¯YCZKA primary key (ID_POZYCZKA)
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

/*==============================================================*/
/* Index: PO¯YCZKA_RATA_PO¯YCZKI_FK                             */
/*==============================================================*/




create nonclustered index PO¯YCZKA_RATA_PO¯YCZKI_FK on WPLATA_RATY_POZYCZKI (ID_POZYCZKA ASC)
go

/*==============================================================*/
/* Index: KONTO_WPLATA_RATY_POZYCZKI_FK                         */
/*==============================================================*/




create nonclustered index KONTO_WPLATA_RATY_POZYCZKI_FK on WPLATA_RATY_POZYCZKI (ID_KONTA ASC)
go

alter table DOLADOWANIE_TELEFONU
   add constraint FK_DOLADOWA_KONTO_DOL_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table DOLADOWANIE_TELEFONU
   add constraint FK_DOLADOWA_OPERATOR__OPERATOR foreign key (ID_OPERATOR)
      references OPERATOR (ID_OPERATOR)
go

alter table KARTA
   add constraint FK_KARTA_KONTO_KAR_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table PLATNOSC_KARTA
   add constraint FK_PLATNOSC_KARTA_PLA_KARTA foreign key (ID_KARTY)
      references KARTA (ID_KARTY)
go

alter table PLATNOSC_KARTA
   add constraint FK_PLATNOSC_TERMINAL__TERMINAL foreign key (ID_TERMINALU)
      references TERMINAL (ID_TERMINALU)
go

alter table WPLATA_RATY_POZYCZKI
   add constraint FK_WPLATA_R_KONTO_WPL_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table WPLATA_RATY_POZYCZKI
   add constraint FK_WPLATA_R_PO¯YCZKA__PO¯YCZKA foreign key (ID_POZYCZKA)
      references PO¯YCZKA (ID_POZYCZKA)
go

