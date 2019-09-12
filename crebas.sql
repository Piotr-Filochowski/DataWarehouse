/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10.09.2019 08:15:13                          */
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
            from  sysobjects
           where  id = object_id('BANKOMAT')
            and   type = 'U')
   drop table BANKOMAT
go

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
            from  sysobjects
           where  id = object_id('T_KEY_ADRES')
            and   type = 'U')
   drop table T_KEY_ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_BANK')
            and   type = 'U')
   drop table T_KEY_BANK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_BANKOMAT')
            and   type = 'U')
   drop table T_KEY_BANKOMAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table T_KEY_DOLADOWANIE_TELEFONU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_KARTA')
            and   type = 'U')
   drop table T_KEY_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_KONTO')
            and   type = 'U')
   drop table T_KEY_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_OPERATOR')
            and   type = 'U')
   drop table T_KEY_OPERATOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_PLATNOSC_KARTA')
            and   type = 'U')
   drop table T_KEY_PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_POZYCZKA')
            and   type = 'U')
   drop table T_KEY_POZYCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_TERMINAL')
            and   type = 'U')
   drop table T_KEY_TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_TRANSAKCJA')
            and   type = 'U')
   drop table T_KEY_TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_TYP_TRANSAKCJI')
            and   type = 'U')
   drop table T_KEY_TYP_TRANSAKCJI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table T_KEY_WPLATA_RATY_POZYCZKI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('T_KEY_WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table T_KEY_WYPLATA_Z_BANKOMATU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table WPLATA_RATY_POZYCZKI
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_ADRES primary key nonclustered (ID_ADRES)
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BANK primary key nonclustered (ID_BANK)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BANKOMAT primary key nonclustered (ID_BANKOMAT),
   constraint FK_BANKOMAT_BANK_BANK_BANK foreign key (ID_BANK)
      references BANK (ID_BANK),
   constraint FK_BANKOMAT_ADRES_BAN_ADRES foreign key (ID_ADRES)
      references ADRES (ID_ADRES)
)
go

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_KONTO primary key nonclustered (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_OPERATOR primary key nonclustered (ID_OPERATOR)
)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_DOLADOWANIE_TELEFONU primary key nonclustered (ID_DOLADOWANIA),
   constraint FK_DOLADOWA_KONTO_DOL_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA),
   constraint FK_DOLADOWA_OPERATOR__OPERATOR foreign key (ID_OPERATOR)
      references OPERATOR (ID_OPERATOR)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_KARTA primary key nonclustered (ID_KARTY),
   constraint FK_KARTA_KONTO_KAR_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
)
go

/*==============================================================*/
/* Table: TERMINAL                                              */
/*==============================================================*/
create table TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TERMINAL primary key nonclustered (ID_TERMINALU)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_PLATNOSC_KARTA primary key nonclustered (ID_PLATNOSCI),
   constraint FK_PLATNOSC_KARTA_PLA_KARTA foreign key (ID_KARTY)
      references KARTA (ID_KARTY),
   constraint FK_PLATNOSC_TERMINAL__TERMINAL foreign key (ID_TERMINALU)
      references TERMINAL (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: PO¯YCZKA                                              */
/*==============================================================*/
create table PO¯YCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_PO¯YCZKA primary key nonclustered (ID_POZYCZKA)
)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TYP_TRANSAKCJI primary key nonclustered (ID_TYPU)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TRANSAKCJA primary key nonclustered (ID_TRANSAKCJI),
   constraint FK_TRANSAKC_KONTO_Z_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA),
   constraint FK_TRANSAKC_KONTO_DO_KONTO foreign key (KON_ID_KONTA)
      references KONTO (ID_KONTA),
   constraint FK_TRANSAKC_TYP_TRANS_TYP_TRAN foreign key (ID_TYPU)
      references TYP_TRANSAKCJI (ID_TYPU)
)
go

/*==============================================================*/
/* Table: T_KEY_ADRES                                           */
/*==============================================================*/
create table T_KEY_ADRES (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_BANK                                            */
/*==============================================================*/
create table T_KEY_BANK (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_BANKOMAT                                        */
/*==============================================================*/
create table T_KEY_BANKOMAT (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_DOLADOWANIE_TELEFONU                            */
/*==============================================================*/
create table T_KEY_DOLADOWANIE_TELEFONU (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_KARTA                                           */
/*==============================================================*/
create table T_KEY_KARTA (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_KONTO                                           */
/*==============================================================*/
create table T_KEY_KONTO (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_OPERATOR                                        */
/*==============================================================*/
create table T_KEY_OPERATOR (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_PLATNOSC_KARTA                                  */
/*==============================================================*/
create table T_KEY_PLATNOSC_KARTA (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_POZYCZKA                                        */
/*==============================================================*/
create table T_KEY_POZYCZKA (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_TERMINAL                                        */
/*==============================================================*/
create table T_KEY_TERMINAL (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_TRANSAKCJA                                      */
/*==============================================================*/
create table T_KEY_TRANSAKCJA (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_TYP_TRANSAKCJI                                  */
/*==============================================================*/
create table T_KEY_TYP_TRANSAKCJI (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_WPLATA_RATY_POZYCZKI                            */
/*==============================================================*/
create table T_KEY_WPLATA_RATY_POZYCZKI (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
)
go

/*==============================================================*/
/* Table: T_KEY_WYPLATA_Z_BANKOMATU                             */
/*==============================================================*/
create table T_KEY_WYPLATA_Z_BANKOMATU (
   T_ID                 numeric              null,
   T_VALUE              numeric              null
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_WPLATA_RATY_POZYCZKI primary key nonclustered (ID_RATY),
   constraint FK_WPLATA_R_PO¯YCZKA__PO¯YCZKA foreign key (ID_POZYCZKA)
      references PO¯YCZKA (ID_POZYCZKA),
   constraint FK_WPLATA_R_KONTO_WPL_KONTO foreign key (ID_KONTA)
      references KONTO (ID_KONTA)
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_WYPLATA_Z_BANKOMATU primary key nonclustered (ID_WYPLATY),
   constraint FK_WYPLATA__BANKOMAT__BANKOMAT foreign key (ID_BANKOMAT)
      references BANKOMAT (ID_BANKOMAT),
   constraint FK_WYPLATA__KARTA_WYP_KARTA foreign key (ID_KARTY)
      references KARTA (ID_KARTY)
)
go

