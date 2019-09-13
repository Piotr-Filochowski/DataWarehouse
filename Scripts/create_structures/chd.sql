/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     13.09.2019 20:57:01                          */
/*==============================================================*/


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
   SOURCE               numeric              null
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null
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
   SOURCE               numeric              null
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
   SOURCE               numeric              null
)
go

