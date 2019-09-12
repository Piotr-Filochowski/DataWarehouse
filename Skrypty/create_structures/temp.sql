/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10.09.2019 08:15:13                          */
/*==============================================================*/



if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_ADRES')
            and   type = 'U')
   drop table TEMP_ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_BANK')
            and   type = 'U')
   drop table TEMP_BANK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_BANKOMAT')
            and   type = 'U')
   drop table TEMP_BANKOMAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table TEMP_DOLADOWANIE_TELEFONU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_KARTA')
            and   type = 'U')
   drop table TEMP_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_KONTO')
            and   type = 'U')
   drop table TEMP_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_OPERATOR')
            and   type = 'U')
   drop table TEMP_OPERATOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_PLATNOSC_KARTA')
            and   type = 'U')
   drop table TEMP_PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_POZYCZKA')
            and   type = 'U')
   drop table TEMP_POZYCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_TERMINAL')
            and   type = 'U')
   drop table TEMP_TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_TRANSAKCJA')
            and   type = 'U')
   drop table TEMP_TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_TYP_TRANSAKCJI')
            and   type = 'U')
   drop table TEMP_TYP_TRANSAKCJI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table TEMP_WPLATA_RATY_POZYCZKI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TEMP_WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table TEMP_WYPLATA_Z_BANKOMATU
go

/*==============================================================*/
/* Table: ADRES                                                 */
/*==============================================================*/
create table TEMP_ADRES (
   ID_ADRES             numeric              not null,
   ULICA                varchar(50)          null,
   MIASTO               varchar(50)          null,
   KOD_POCZTOWY         varchar(50)          null,
   MIESZKANIE           varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_ADRES primary key nonclustered (ID_ADRES)
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table TEMP_BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_BANK primary key nonclustered (ID_BANK)
)
go

/*==============================================================*/
/* Table: BANKOMAT                                              */
/*==============================================================*/
create table TEMP_BANKOMAT (
   ID_BANKOMAT          numeric              not null,
   ID_BANK              numeric              not null,
   ID_ADRES             numeric              not null,
   NAZWA_BANKOMATU      varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_BANKOMAT primary key nonclustered (ID_BANKOMAT)
)
go

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table TEMP_KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_KONTO primary key nonclustered (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table TEMP_OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_OPERATOR primary key nonclustered (ID_OPERATOR)
)
go

/*==============================================================*/
/* Table: DOLADOWANIE_TELEFONU                                  */
/*==============================================================*/
create table TEMP_OLADOWANIE_TELEFONU (
   ID_DOLADOWANIA       numeric              not null,
   ID_KONTA             numeric              null,
   ID_OPERATOR          numeric              null,
   NUMER_TELEFONU       varchar(11)          not null,
   KWOTA_DOLADOWANIA    money                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_DOLADOWANIE_TELEFONU primary key nonclustered (ID_DOLADOWANIA)
)
go

/*==============================================================*/
/* Table: KARTA                                                 */
/*==============================================================*/
create table TEMP_KARTA (
   ID_KARTY             numeric              not null,
   ID_KONTA             numeric              null,
   NUMER_KARTY          numeric              not null,
   CVC                  numeric              not null,
   DATA_WAZNOSCI_KARTY  datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_KARTA primary key nonclustered (ID_KARTY)

)
go

/*==============================================================*/
/* Table: TERMINAL                                              */
/*==============================================================*/
create table TEMP_TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_TERMINAL primary key nonclustered (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: PLATNOSC_KARTA                                        */
/*==============================================================*/
create table TEMP_PLATNOSC_KARTA (
   ID_PLATNOSCI         numeric              not null,
   ID_KARTY             numeric              null,
   ID_TERMINALU         numeric              null,
   WARTOSC              float                not null,
   DATA_PLATNOSCI       datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_PLATNOSC_KARTA primary key nonclustered (ID_PLATNOSCI)
  
)
go

/*==============================================================*/
/* Table: POZYCZKA                                              */
/*==============================================================*/
create table TEMP_POZYCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_POZYCZKA primary key nonclustered (ID_POZYCZKA)
)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table TEMP_TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_TYP_TRANSAKCJI primary key nonclustered (ID_TYPU)
)
go

/*==============================================================*/
/* Table: TRANSAKCJA                                            */
/*==============================================================*/
create table TEMP_TRANSAKCJA (
   ID_TRANSAKCJI        numeric              not null,
   ID_KONTA             numeric              null,
   KON_ID_KONTA         numeric              null,
   ID_TYPU              numeric              null,
   KWOTA                float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_TRANSAKCJA primary key nonclustered (ID_TRANSAKCJI)
  
)
go
/*==============================================================*/
/* Table: WPLATA_RATY_POZYCZKI                                  */
/*==============================================================*/
create table TEMP_WPLATA_RATY_POZYCZKI (
   ID_RATY              numeric              not null,
   ID_POZYCZKA          numeric              null,
   ID_KONTA             numeric              not null,
   KWOATA               money                not null,
   DATA_WPLATY_RATY     datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_WPLATA_RATY_POZYCZKI primary key nonclustered (ID_RATY)
)
go

/*==============================================================*/
/* Table: WYPLATA_Z_BANKOMATU                                   */
/*==============================================================*/
create table TEMP_WYPLATA_Z_BANKOMATU (
   ID_WYPLATY           numeric              not null,
   ID_BANKOMAT          numeric              null,
   ID_KARTY             numeric              null,
   DATA_WYPLATY         datetime             null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TEMP_WYPLATA_Z_BANKOMATU primary key nonclustered (ID_WYPLATY)

)
go


/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10.09.2019 08:15:13                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_ADRES')
            and   type = 'U')
   drop table BAD_ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_BANK')
            and   type = 'U')
   drop table BAD_BANK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_BANKOMAT')
            and   type = 'U')
   drop table BAD_BANKOMAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table BAD_DOLADOWANIE_TELEFONU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_KARTA')
            and   type = 'U')
   drop table BAD_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_KONTO')
            and   type = 'U')
   drop table BAD_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_OPERATOR')
            and   type = 'U')
   drop table BAD_OPERATOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_PLATNOSC_KARTA')
            and   type = 'U')
   drop table BAD_PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_POZYCZKA')
            and   type = 'U')
   drop table BAD_POZYCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_TERMINAL')
            and   type = 'U')
   drop table BAD_TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_TRANSAKCJA')
            and   type = 'U')
   drop table BAD_TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_TYP_TRANSAKCJI')
            and   type = 'U')
   drop table BAD_TYP_TRANSAKCJI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table BAD_WPLATA_RATY_POZYCZKI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BAD_WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table BAD_WYPLATA_Z_BANKOMATU
go

/*==============================================================*/
/* Table: ADRES                                                 */
/*==============================================================*/
create table BAD_ADRES (
   ID_ADRES             numeric              not null,
   ULICA                varchar(50)          null,
   MIASTO               varchar(50)          null,
   KOD_POCZTOWY         varchar(50)          null,
   MIESZKANIE           varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_ADRES primary key nonclustered (ID_ADRES)
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table BAD_BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_BANK primary key nonclustered (ID_BANK)
)
go

/*==============================================================*/
/* Table: BANKOMAT                                              */
/*==============================================================*/
create table BAD_BANKOMAT (
   ID_BANKOMAT          numeric              not null,
   ID_BANK              numeric              not null,
   ID_ADRES             numeric              not null,
   NAZWA_BANKOMATU      varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_BANKOMAT primary key nonclustered (ID_BANKOMAT)
)
go

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table BAD_KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_KONTO primary key nonclustered (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table BAD_OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_OPERATOR primary key nonclustered (ID_OPERATOR)
)
go

/*==============================================================*/
/* Table: DOLADOWANIE_TELEFONU                                  */
/*==============================================================*/
create table BAD_OLADOWANIE_TELEFONU (
   ID_DOLADOWANIA       numeric              not null,
   ID_KONTA             numeric              null,
   ID_OPERATOR          numeric              null,
   NUMER_TELEFONU       varchar(11)          not null,
   KWOTA_DOLADOWANIA    money                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_DOLADOWANIE_TELEFONU primary key nonclustered (ID_DOLADOWANIA)
)
go

/*==============================================================*/
/* Table: KARTA                                                 */
/*==============================================================*/
create table BAD_KARTA (
   ID_KARTY             numeric              not null,
   ID_KONTA             numeric              null,
   NUMER_KARTY          numeric              not null,
   CVC                  numeric              not null,
   DATA_WAZNOSCI_KARTY  datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_KARTA primary key nonclustered (ID_KARTY)
)
go

/*==============================================================*/
/* Table: TERMINAL                                              */
/*==============================================================*/
create table BAD_TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_TERMINAL primary key nonclustered (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: PLATNOSC_KARTA                                        */
/*==============================================================*/
create table BAD_PLATNOSC_KARTA (
   ID_PLATNOSCI         numeric              not null,
   ID_KARTY             numeric              null,
   ID_TERMINALU         numeric              null,
   WARTOSC              float                not null,
   DATA_PLATNOSCI       datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_PLATNOSC_KARTA primary key nonclustered (ID_PLATNOSCI)
)
go

/*==============================================================*/
/* Table: POZYCZKA                                              */
/*==============================================================*/
create table BAD_POZYCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_POZYCZKA primary key nonclustered (ID_POZYCZKA)
)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table BAD_TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_TYP_TRANSAKCJI primary key nonclustered (ID_TYPU)
)
go

/*==============================================================*/
/* Table: TRANSAKCJA                                            */
/*==============================================================*/
create table BAD_TRANSAKCJA (
   ID_TRANSAKCJI        numeric              not null,
   ID_KONTA             numeric              null,
   KON_ID_KONTA         numeric              null,
   ID_TYPU              numeric              null,
   KWOTA                float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_TRANSAKCJA primary key nonclustered (ID_TRANSAKCJI)
)
go
/*==============================================================*/
/* Table: WPLATA_RATY_POZYCZKI                                  */
/*==============================================================*/
create table BAD_WPLATA_RATY_POZYCZKI (
   ID_RATY              numeric              not null,
   ID_POZYCZKA          numeric              null,
   ID_KONTA             numeric              not null,
   KWOATA               money                not null,
   DATA_WPLATY_RATY     datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_WPLATA_RATY_POZYCZKI primary key nonclustered (ID_RATY)
)
go

/*==============================================================*/
/* Table: WYPLATA_Z_BANKOMATU                                   */
/*==============================================================*/
create table BAD_WYPLATA_Z_BANKOMATU (
   ID_WYPLATY           numeric              not null,
   ID_BANKOMAT          numeric              null,
   ID_KARTY             numeric              null,
   DATA_WYPLATY         datetime             null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BAD_WYPLATA_Z_BANKOMATU primary key nonclustered (ID_WYPLATY)
)
go

/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     10.09.2019 08:15:13                          */
/*==============================================================*/



if exists (select 1
            from  sysobjects
           where  id = object_id('STG_ADRES')
            and   type = 'U')
   drop table STG_ADRES
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_BANK')
            and   type = 'U')
   drop table STG_BANK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_BANKOMAT')
            and   type = 'U')
   drop table STG_BANKOMAT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_DOLADOWANIE_TELEFONU')
            and   type = 'U')
   drop table STG_DOLADOWANIE_TELEFONU
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_KARTA')
            and   type = 'U')
   drop table STG_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_KONTO')
            and   type = 'U')
   drop table STG_KONTO
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_OPERATOR')
            and   type = 'U')
   drop table STG_OPERATOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_PLATNOSC_KARTA')
            and   type = 'U')
   drop table STG_PLATNOSC_KARTA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_POZYCZKA')
            and   type = 'U')
   drop table STG_POZYCZKA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_TERMINAL')
            and   type = 'U')
   drop table STG_TERMINAL
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_TRANSAKCJA')
            and   type = 'U')
   drop table STG_TRANSAKCJA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_TYP_TRANSAKCJI')
            and   type = 'U')
   drop table STG_TYP_TRANSAKCJI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_WPLATA_RATY_POZYCZKI')
            and   type = 'U')
   drop table STG_WPLATA_RATY_POZYCZKI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('STG_WYPLATA_Z_BANKOMATU')
            and   type = 'U')
   drop table STG_WYPLATA_Z_BANKOMATU
go

/*==============================================================*/
/* Table: ADRES                                                 */
/*==============================================================*/
create table STG_ADRES (
   ID_ADRES             numeric              not null,
   ULICA                varchar(50)          null,
   MIASTO               varchar(50)          null,
   KOD_POCZTOWY         varchar(50)          null,
   MIESZKANIE           varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_ADRES primary key nonclustered (ID_ADRES)
)
go

/*==============================================================*/
/* Table: BANK                                                  */
/*==============================================================*/
create table STG_BANK (
   ID_BANK              numeric              not null,
   NAZWA_BANKU          varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_BANK primary key nonclustered (ID_BANK)
)
go

/*==============================================================*/
/* Table: BANKOMAT                                              */
/*==============================================================*/
create table STG_BANKOMAT (
   ID_BANKOMAT          numeric              not null,
   ID_BANK              numeric              not null,
   ID_ADRES             numeric              not null,
   NAZWA_BANKOMATU      varchar(50)          null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_BANKOMAT primary key nonclustered (ID_BANKOMAT)
)
go

/*==============================================================*/
/* Table: KONTO                                                 */
/*==============================================================*/
create table STG_KONTO (
   ID_KONTA             numeric              not null,
   NUMER_KONTA          numeric              not null,
   OPROCENTOWANIE_KONTA float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_KONTO primary key nonclustered (ID_KONTA)
)
go

/*==============================================================*/
/* Table: OPERATOR                                              */
/*==============================================================*/
create table STG_OPERATOR (
   ID_OPERATOR          numeric              not null,
   NAZWA_OPERATORA      varchar(50)          null,
   OPROCENTOWANIE_OPERATORA float                null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_OPERATOR primary key nonclustered (ID_OPERATOR)
)
go

/*==============================================================*/
/* Table: DOLADOWANIE_TELEFONU                                  */
/*==============================================================*/
create table STG_OLADOWANIE_TELEFONU (
   ID_DOLADOWANIA       numeric              not null,
   ID_KONTA             numeric              null,
   ID_OPERATOR          numeric              null,
   NUMER_TELEFONU       varchar(11)          not null,
   KWOTA_DOLADOWANIA    money                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_DOLADOWANIE_TELEFONU primary key nonclustered (ID_DOLADOWANIA)
)
go

/*==============================================================*/
/* Table: KARTA                                                 */
/*==============================================================*/
create table STG_KARTA (
   ID_KARTY             numeric              not null,
   ID_KONTA             numeric              null,
   NUMER_KARTY          numeric              not null,
   CVC                  numeric              not null,
   DATA_WAZNOSCI_KARTY  datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_KARTA primary key nonclustered (ID_KARTY)
)
go

/*==============================================================*/
/* Table: TERMINAL                                              */
/*==============================================================*/
create table STG_TERMINAL (
   ID_TERMINALU         numeric              not null,
   WLASCICIEL           varchar(150)         not null,
   DATA_WAZNOSCI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_TERMINAL primary key nonclustered (ID_TERMINALU)
)
go

/*==============================================================*/
/* Table: PLATNOSC_KARTA                                        */
/*==============================================================*/
create table STG_PLATNOSC_KARTA (
   ID_PLATNOSCI         numeric              not null,
   ID_KARTY             numeric              null,
   ID_TERMINALU         numeric              null,
   WARTOSC              float                not null,
   DATA_PLATNOSCI       datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_PLATNOSC_KARTA primary key nonclustered (ID_PLATNOSCI)
)
go

/*==============================================================*/
/* Table: POZYCZKA                                              */
/*==============================================================*/
create table STG_POZYCZKA (
   ID_POZYCZKA          numeric              not null,
   SUMA                 numeric              not null,
   OPROCENTOWANIE       float(4)             not null,
   DATA_POZYCZKI        datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_POZYCZKA primary key nonclustered (ID_POZYCZKA)
)
go

/*==============================================================*/
/* Table: TYP_TRANSAKCJI                                        */
/*==============================================================*/
create table STG_TYP_TRANSAKCJI (
   ID_TYPU              numeric              not null,
   OPIS                 varchar(100)         null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_TYP_TRANSAKCJI primary key nonclustered (ID_TYPU)
)
go

/*==============================================================*/
/* Table: TRANSAKCJA                                            */
/*==============================================================*/
create table STG_TRANSAKCJA (
   ID_TRANSAKCJI        numeric              not null,
   ID_KONTA             numeric              null,
   KON_ID_KONTA         numeric              null,
   ID_TYPU              numeric              null,
   KWOTA                float                not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_TRANSAKCJA primary key nonclustered (ID_TRANSAKCJI)
)
go
/*==============================================================*/
/* Table: WPLATA_RATY_POZYCZKI                                  */
/*==============================================================*/
create table STG_WPLATA_RATY_POZYCZKI (
   ID_RATY              numeric              not null,
   ID_POZYCZKA          numeric              null,
   ID_KONTA             numeric              not null,
   KWOATA               money                not null,
   DATA_WPLATY_RATY     datetime             not null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_WPLATA_RATY_POZYCZKI primary key nonclustered (ID_RATY)
)
go

/*==============================================================*/
/* Table: WYPLATA_Z_BANKOMATU                                   */
/*==============================================================*/
create table STG_WYPLATA_Z_BANKOMATU (
   ID_WYPLATY           numeric              not null,
   ID_BANKOMAT          numeric              null,
   ID_KARTY             numeric              null,
   DATA_WYPLATY         datetime             null,
   TIMESTAMP            datetime             null,
   SOURCE               numeric              null,
   constraint PK_STG_WYPLATA_Z_BANKOMATU primary key nonclustered (ID_WYPLATY)
)
go

