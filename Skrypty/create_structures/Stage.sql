/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     12.09.2019 08:36:33                          */
/*==============================================================*/
USE Stage;

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table Z1_DOLADOWANIE_TELEFONU
go


if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_KARTA')
            and   type = 'U')
   drop table Z1_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_KONTO')
            and   type = 'U')
   drop table Z1_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_OPERATOR')
            and   type = 'U')
   drop table Z1_OPERATOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_PLATNOSC_KARTA')
            and   type = 'U')
   drop table Z1_PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_PO¯YCZKA')
            and   type = 'U')
   drop table Z1_PO¯YCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_TERMINAL')
            and   type = 'U')
   drop table Z1_TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z1_WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table Z1_WPLATA_RATY_POZYCZKI
go

/*==============================================================*/
/* Table: DOLADOWANIE_TELEFONU                                  */
/*==============================================================*/
create table Z1_DOLADOWANIE_TELEFONU (
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
create table Z1_KARTA (
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
create table Z1_KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   constraint PK_KONTO primary key (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table Z1_OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   constraint PK_OPERATOR primary key (ID_OPERATOR)
)
go

/*==============================================================*/
/* Table: PLATNOSC_KARTA                                        */
/*==============================================================*/
create table Z1_PLATNOSC_KARTA (
   ID_PLATNOSCI         numeric              not null,
   ID_KARTY             numeric              null,
   ID_TERMINALU         numeric              null,
   WARTOSC              float                not null,
   DATA_PLATNOSCI       datetime             not null,
   constraint PK_PLATNOSC_KARTA primary key (ID_PLATNOSCI)
)
go

/*==============================================================*/
/* Table: PO¯YCZKA                                              */
/*==============================================================*/
create table Z1_PO¯YCZKA (
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
create table Z1_TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   constraint PK_TERMINAL primary key (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: WPLATA_RATY_POZYCZKI                                  */
/*==============================================================*/
create table Z1_WPLATA_RATY_POZYCZKI (
   ID_RATY              numeric              not null,
   ID_POZYCZKA          numeric              null,
   ID_KONTA             numeric              not null,
   KWOATA               money                not null,
   DATA_WPLATY_RATY     datetime             not null,
   constraint PK_WPLATA_RATY_POZYCZKI primary key (ID_RATY)
)
go

/*==============================================================*/
/*==============================================================*/
/* 						Zrodlo2                                 */
/*==============================================================*/
/*==============================================================*/



if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_ADRES')
            and   type = 'U')
   drop table Z2_ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_BANK')
            and   type = 'U')
   drop table Z2_BANK
go




if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_BANKOMAT')
            and   type = 'U')
   drop table Z2_BANKOMAT
go



if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_KARTA')
            and   type = 'U')
   drop table Z2_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_KONTO')
            and   type = 'U')
   drop table Z2_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_TRANSAKCJA')
            and   type = 'U')
   drop table Z2_TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_TYP_TRANSAKCJI')
            and   type = 'U')
   drop table Z2_TYP_TRANSAKCJI
go


if exists (select 1
            from  sysobjects
           where  id = object_id('Z2_WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table Z2_WYPLATA_Z_BANKOMATU
go

/*==============================================================*/
/* Table: ADRES                                                 */
/*==============================================================*/
create table Z2_ADRES (
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
create table Z2_BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   constraint PK_BANK primary key (ID_BANK)
)
go

/*==============================================================*/
/* Table: BANKOMAT                                              */
/*==============================================================*/
create table Z2_BANKOMAT (
   ID_BANKOMAT          numeric              not null,
   ID_BANK              numeric              not null,
   ID_ADRES             numeric              not null,
   NAZWA_BANKOMATU      varchar(50)          null,
   constraint PK_BANKOMAT primary key (ID_BANKOMAT)
)
go

/*==============================================================*/
/* Table: KARTA                                                 */
/*==============================================================*/
create table Z2_KARTA (
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
create table Z2_KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   constraint PK_KONTO primary key (ID_KONTA)
)
go

/*==============================================================*/
/* Table: TRANSAKCJA                                            */
/*==============================================================*/
create table Z2_TRANSAKCJA (
   ID_TRANSAKCJI        numeric              not null,
   ID_KONTA             numeric              null,
   KON_ID_KONTA         numeric              null,
   ID_TYPU              numeric              null,
   KWOTA                float                not null,
   constraint PK_TRANSAKCJA primary key (ID_TRANSAKCJI)
)
go



/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table Z2_TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   constraint PK_TYP_TRANSAKCJI primary key (ID_TYPU)
)
go

/*==============================================================*/
/* Table: WYPLATA_Z_BANKOMATU                                   */
/*==============================================================*/
create table Z2_WYPLATA_Z_BANKOMATU (
   ID_WYPLATY           numeric              not null,
   ID_BANKOMAT          numeric              null,
   ID_KARTY             numeric              null,
   DATA_WYPLATY         datetime             null,
   constraint PK_WYPLATA_Z_BANKOMATU primary key (ID_WYPLATY)
)
go
