USE [Temp]
GO

/****** Object:  StoredProcedure [dbo].[Wstaw_temp]    Script Date: 15.09.2019 19:00:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[Wstaw_temp] as


-- Brak klucza obcego w tabeli ktora wstawiamy + nulle
-- 
truncate table [dbo].[STG_ADRES];
truncate table [dbo].[STG_BANK];
truncate table [dbo].[STG_BANKOMAT];
truncate table [dbo].[STG_KARTA];
truncate table [dbo].[STG_KONTO];
truncate table [dbo].[STG_OLADOWANIE_TELEFONU];
truncate table [dbo].[STG_OPERATOR];
truncate table [dbo].[STG_PLATNOSC_KARTA];
truncate table [dbo].[STG_POZYCZKA];
truncate table [dbo].[STG_TERMINAL];
truncate table [dbo].[STG_TRANSAKCJA];
truncate table [dbo].[STG_TYP_TRANSAKCJI];
truncate table [dbo].[STG_WPLATA_RATY_POZYCZKI];
truncate table [dbo].[STG_WYPLATA_Z_BANKOMATU];

truncate table [dbo].[BAD_ADRES];
truncate table [dbo].[BAD_BANK];
truncate table [dbo].[BAD_BANKOMAT];
truncate table [dbo].[BAD_KARTA];
truncate table [dbo].[BAD_KONTO];
truncate table [dbo].[BAD_OLADOWANIE_TELEFONU];
truncate table [dbo].[BAD_OPERATOR];
truncate table [dbo].[BAD_PLATNOSC_KARTA];
truncate table [dbo].[BAD_POZYCZKA];
truncate table [dbo].[BAD_TERMINAL];
truncate table [dbo].[BAD_TRANSAKCJA];
truncate table [dbo].[BAD_TYP_TRANSAKCJI];
truncate table [dbo].[BAD_WPLATA_RATY_POZYCZKI];
truncate table [dbo].[BAD_WYPLATA_Z_BANKOMATU];

truncate table [dbo].[TEMP_ADRES];
truncate table [dbo].[TEMP_BANK];
truncate table [dbo].[TEMP_BANKOMAT];
truncate table [dbo].[TEMP_KARTA];
truncate table [dbo].[TEMP_KONTO];
truncate table [dbo].[TEMP_DOLADOWANIE_TELEFONU];
truncate table [dbo].[TEMP_OPERATOR];
truncate table [dbo].[TEMP_PLATNOSC_KARTA];
truncate table [dbo].[TEMP_POZYCZKA];
truncate table [dbo].[TEMP_TERMINAL];
truncate table [dbo].[TEMP_TRANSAKCJA];
truncate table [dbo].[TEMP_TYP_TRANSAKCJI];
truncate table [dbo].[TEMP_WPLATA_RATY_POZYCZKI];
truncate table [dbo].[TEMP_WYPLATA_Z_BANKOMATU];

insert into Temp.dbo.TEMP_KARTA select ID_KARTY, ID_KONTA, NUMER_KARTY, CVC, DATA_WAZNOSCI_KARTY, TIMESTAMP, SOURCE from Stage.dbo.Z1_KARTA;
insert into Temp.dbo.TEMP_KONTO select ID_KONTA, NUMER_KONTA, OPROCENTOWANIE_KONTA, TIMESTAMP, SOURCE from Stage.dbo.Z1_KONTO;
insert into Temp.dbo.TEMP_KARTA select ID_KARTY, ID_KONTA, NUMER_KARTY, CVC, DATA_WAZNOSCI_KARTY, TIMESTAMP, SOURCE from Stage.dbo.Z2_KARTA;
insert into Temp.dbo.TEMP_KONTO select ID_KONTA, NUMER_KONTA, OPROCENTOWANIE_KONTA, TIMESTAMP, SOURCE from Stage.dbo.Z2_KONTO;
insert into Temp.dbo.TEMP_DOLADOWANIE_TELEFONU select ID_DOLADOWANIA, ID_KONTA, ID_OPERATOR, NUMER_TELEFONU, KWOTA_DOLADOWANIA, TIMESTAMP, SOURCE from Stage.dbo.Z1_DOLADOWANIE_TELEFONU;
insert into Temp.dbo.TEMP_OPERATOR select  ID_OPERATOR, NAZWA_OPERATORA, OPROCENTOWANIE_OPERATORA, TIMESTAMP, SOURCE from Stage.dbo.Z1_OPERATOR;
insert into Temp.dbo.TEMP_PLATNOSC_KARTA select ID_PLATNOSCI, ID_KARTY, ID_TERMINALU, WARTOSC, DATA_PLATNOSCI, TIMESTAMP, SOURCE from Stage.dbo.Z1_PLATNOSC_KARTA;
insert into Temp.dbo.TEMP_POZYCZKA select ID_POZYCZKA, SUMA, OPROCENTOWANIE, DATA_POZYCZKI, TIMESTAMP, SOURCE from Stage.dbo.Z1_POZYCZKA;
insert into Temp.dbo.TEMP_TERMINAL select ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE from Stage.dbo.Z1_TERMINAL;
insert into Temp.dbo.TEMP_WPLATA_RATY_POZYCZKI select ID_RATY, ID_POZYCZKA, ID_KONTA, KWOATA, DATA_WPLATY_RATY, TIMESTAMP, SOURCE from Stage.dbo.Z1_WPLATA_RATY_POZYCZKI;
insert into Temp.dbo.TEMP_ADRES select ID_ADRES, ULICA, MIASTO, KOD_POCZTOWY, MIESZKANIE, TIMESTAMP, SOURCE from Stage.dbo.Z2_ADRES;
insert into Temp.dbo.TEMP_BANK select ID_BANK, NAZWA_BANKU, TIMESTAMP, SOURCE from Stage.dbo.Z2_BANK;
insert into Temp.dbo.TEMP_BANKOMAT select ID_BANKOMAT, ID_BANK, ID_ADRES, NAZWA_BANKOMATU, TIMESTAMP, SOURCE from Stage.dbo.Z2_BANKOMAT;
insert into Temp.dbo.TEMP_TRANSAKCJA select ID_TRANSAKCJI, ID_KONTA, KON_ID_KONTA, ID_TYPU, KWOTA, TIMESTAMP, SOURCE from Stage.dbo.Z2_TRANSAKCJA;
insert into Temp.dbo.TEMP_TYP_TRANSAKCJI select ID_TYPU, OPIS, TIMESTAMP, SOURCE from Stage.dbo.Z2_TYP_TRANSAKCJI;
insert into Temp.dbo.TEMP_WYPLATA_Z_BANKOMATU select ID_WYPLATY, ID_BANKOMAT, ID_KARTY, DATA_WYPLATY, TIMESTAMP, SOURCE from Stage.dbo.Z2_WYPLATA_Z_BANKOMATU;






GO


