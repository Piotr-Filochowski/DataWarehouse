/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     12.09.2019 08:27:36                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BANKOMAT') and o.name = 'FK_BANKOMAT_ADRES_BAN_ADRES')
alter table BANKOMAT
   drop constraint FK_BANKOMAT_ADRES_BAN_ADRES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('BANKOMAT') and o.name = 'FK_BANKOMAT_BANK_BANK_BANK')
alter table BANKOMAT
   drop constraint FK_BANKOMAT_BANK_BANK_BANK
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('KARTA') and o.name = 'FK_KARTA_KONTO_KAR_KONTO')
alter table KARTA
   drop constraint FK_KARTA_KONTO_KAR_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSAKCJA') and o.name = 'FK_TRANSAKC_KONTO_DO_KONTO')
alter table TRANSAKCJA
   drop constraint FK_TRANSAKC_KONTO_DO_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSAKCJA') and o.name = 'FK_TRANSAKC_KONTO_Z_KONTO')
alter table TRANSAKCJA
   drop constraint FK_TRANSAKC_KONTO_Z_KONTO
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TRANSAKCJA') and o.name = 'FK_TRANSAKC_TYP_TRANS_TYP_TRAN')
alter table TRANSAKCJA
   drop constraint FK_TRANSAKC_TYP_TRANS_TYP_TRAN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WYPLATA_Z_BANKOMATU') and o.name = 'FK_WYPLATA__BANKOMAT__BANKOMAT')
alter table WYPLATA_Z_BANKOMATU
   drop constraint FK_WYPLATA__BANKOMAT__BANKOMAT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('WYPLATA_Z_BANKOMATU') and o.name = 'FK_WYPLATA__KARTA_WYP_KARTA')
alter table WYPLATA_Z_BANKOMATU
   drop constraint FK_WYPLATA__KARTA_WYP_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ADRES')
            and   type = 'U')
   drop table ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BANK')
            and   type = 'U')
   drop table BANK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BANKOMAT')
            and   name  = 'ADRES_BANKOMAT2_FK'
            and   indid > 0
            and   indid < 255)
   drop index BANKOMAT.ADRES_BANKOMAT2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('BANKOMAT')
            and   name  = 'BANK_BANKOMAT_FK'
            and   indid > 0
            and   indid < 255)
   drop index BANKOMAT.BANK_BANKOMAT_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BANKOMAT')
            and   type = 'U')
   drop table BANKOMAT
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
            from  sysindexes
           where  id    = object_id('TRANSAKCJA')
            and   name  = 'TYP_TRANSAKCJI_TRANSAKCJA_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSAKCJA.TYP_TRANSAKCJI_TRANSAKCJA_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSAKCJA')
            and   name  = 'KONTO_DO_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSAKCJA.KONTO_DO_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TRANSAKCJA')
            and   name  = 'KONTO_Z_FK'
            and   indid > 0
            and   indid < 255)
   drop index TRANSAKCJA.KONTO_Z_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TRANSAKCJA')
            and   type = 'U')
   drop table TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TYP_TRANSAKCJI')
            and   type = 'U')
   drop table TYP_TRANSAKCJI
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WYPLATA_Z_BANKOMATU')
            and   name  = 'KARTA_WYPLATA_Z_BANKOMATU_FK'
            and   indid > 0
            and   indid < 255)
   drop index WYPLATA_Z_BANKOMATU.KARTA_WYPLATA_Z_BANKOMATU_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('WYPLATA_Z_BANKOMATU')
            and   name  = 'BANKOMAT_WYPLATA_Z_BANKOMATU_FK'
            and   indid > 0
            and   indid < 255)
   drop index WYPLATA_Z_BANKOMATU.BANKOMAT_WYPLATA_Z_BANKOMATU_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table WYPLATA_Z_BANKOMATU
go

/*==============================================================*/
/* Table: ADRES                                                 */
/*==============================================================*/
create table ADRES (
   ID_ADRES             numeric              not null,
   ULICA                varchar(50)          null,
   MIASTO               varchar(50)          null,
   KOD_POCZTOWY         varchar(50)          null,
   MIESZKANIE           varchar(50)          null,
   constraint PK_ADRES primary key (ID_ADRES)
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   constraint PK_BANK primary key (ID_BANK)
)
go

/*==============================================================*/
/* Table: BANKOMAT                                              */
/*==============================================================*/
create table BANKOMAT (
   ID_BANKOMAT          numeric              not null,
   ID_BANK              numeric              not null,
   ID_ADRES             numeric              not null,
   NAZWA_BANKOMATU      varchar(50)          null,
   constraint PK_BANKOMAT primary key (ID_BANKOMAT)
)
go

/*==============================================================*/
/* Index: BANK_BANKOMAT_FK                                      */
/*==============================================================*/




create nonclustered index BANK_BANKOMAT_FK on BANKOMAT (ID_BANK ASC)
go

/*==============================================================*/
/* Index: ADRES_BANKOMAT2_FK                                    */
/*==============================================================*/




create nonclustered index ADRES_BANKOMAT2_FK on BANKOMAT (ID_ADRES ASC)
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
/* Table: TRANSAKCJA                                            */
/*==============================================================*/
create table TRANSAKCJA (
   ID_TRANSAKCJI        numeric              not null,
   ID_KONTA             numeric              null,
   KON_ID_KONTA         numeric              null,
   ID_TYPU              numeric              null,
   KWOTA                float                not null,
   constraint PK_TRANSAKCJA primary key (ID_TRANSAKCJI)
)
go

/*==============================================================*/
/* Index: KONTO_Z_FK                                            */
/*==============================================================*/




create nonclustered index KONTO_Z_FK on TRANSAKCJA (ID_KONTA ASC)
go

/*==============================================================*/
/* Index: KONTO_DO_FK                                           */
/*==============================================================*/




create nonclustered index KONTO_DO_FK on TRANSAKCJA (KON_ID_KONTA ASC)
go

/*==============================================================*/
/* Index: TYP_TRANSAKCJI_TRANSAKCJA_FK                          */
/*==============================================================*/




create nonclustered index TYP_TRANSAKCJI_TRANSAKCJA_FK on TRANSAKCJA (ID_TYPU ASC)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   constraint PK_TYP_TRANSAKCJI primary key (ID_TYPU)
)
go

/*==============================================================*/
/* Table: WYPLATA_Z_BANKOMATU                                   */
/*==============================================================*/
create table WYPLATA_Z_BANKOMATU (
   ID_WYPLATY           numeric              not null,
   ID_BANKOMAT          numeric              null,
   ID_KARTY             numeric              null,
   DATA_WYPLATY         datetime             null,
   constraint PK_WYPLATA_Z_BANKOMATU primary key (ID_WYPLATY)
)
go

/*==============================================================*/
/* Index: BANKOMAT_WYPLATA_Z_BANKOMATU_FK                       */
/*==============================================================*/




create nonclustered index BANKOMAT_WYPLATA_Z_BANKOMATU_FK on WYPLATA_Z_BANKOMATU (ID_BANKOMAT ASC)
go

/*==============================================================*/
/* Index: KARTA_WYPLATA_Z_BANKOMATU_FK                          */
/*==============================================================*/




create nonclustered index KARTA_WYPLATA_Z_BANKOMATU_FK on WYPLATA_Z_BANKOMATU (ID_KARTY ASC)
go

alter table BANKOMAT
   add constraint FK_BANKOMAT_ADRES_BAN_ADRES foreign key (ID_ADRES)
      references ADRES (ID_ADRES)
go

alter table BANKOMAT
   add constraint FK_BANKOMAT_BANK_BANK_BANK foreign key (ID_BANK)
      references BANK (ID_BANK)
go

alter table KARTA
   add constraint FK_KARTA_KONTO_KAR_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table TRANSAKCJA
   add constraint FK_TRANSAKC_KONTO_DO_KONTO foreign key (KON_ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table TRANSAKCJA
   add constraint FK_TRANSAKC_KONTO_Z_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
go

alter table TRANSAKCJA
   add constraint FK_TRANSAKC_TYP_TRANS_TYP_TRAN foreign key (ID_TYPU)
      references TYP_TRANSAKCJI (ID_TYPU)
go

alter table WYPLATA_Z_BANKOMATU
   add constraint FK_WYPLATA__BANKOMAT__BANKOMAT foreign key (ID_BANKOMAT)
      references BANKOMAT (ID_BANKOMAT)
go

alter table WYPLATA_Z_BANKOMATU
   add constraint FK_WYPLATA__KARTA_WYP_KARTA foreign key (ID_KARTY)
      references KARTA (ID_KARTY)
go

