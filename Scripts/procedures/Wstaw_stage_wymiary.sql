USE [Temp]
GO

/****** Object:  StoredProcedure [dbo].[Wstaw_stage_wymiary]    Script Date: 15.09.2019 12:28:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER procedure [dbo].[Wstaw_stage_wymiary] as

 -----------------------------------------------------------------------------------------------------
--								Do STG nowe i zmienione rekordy:
 -----------------------------------------------------------------------------------------------------

 print 'Adres'
-- Adres
insert into Temp.dbo.STG_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
where ta.ID_ADRES is not null
except
select a.ID_FROM_SOURCE, a.ULICA, a.MIASTO, a.KOD_POCZTOWY, a.MIESZKANIE, a.TIMESTAMP, a.SOURCE
from Target.dbo.ADRES a

 print 'Bank'
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
where ta.ID_BANK is not null
except
select a.ID_FROM_SOURCE, a.NAZWA_BANKU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANK a

 print 'Bankomat' 
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
where ta.ID_BANKOMAT is not null
except
select a.ID_FROM_SOURCE, a.ID_BANK, a.ID_ADRES, a.NAZWA_BANKOMATU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANKOMAT a

 print 'Karta'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
where ta.ID_KARTY is not null
except
select a.ID_FROM_SOURCE, a.ID_KONTA, a.NUMER_KARTY, a.CVC, a.DATA_WAZNOSCI_KARTY, a.TIMESTAMP, a.SOURCE
from Target.dbo.KARTA a

print 'Konto'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
where ta.ID_KONTA is not null
except
select a.ID_FROM_SOURCE, a.NUMER_KONTA, a.OPROCENTOWANIE_KONTA, a.TIMESTAMP, a.SOURCE
from Target.dbo.KONTO a

 print 'Operator'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
where ta.ID_OPERATOR is not null
except
select a.ID_FROM_SOURCE, a.NAZWA_OPERATORA, a.OPROCENTOWANIE_OPERATORA, a.TIMESTAMP, a.SOURCE
from Target.dbo.OPERATOR a

 print 'Pozyczka'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
where ta.ID_POZYCZKA is not null
except
select a.ID_FROM_SOURCE, a.SUMA, a.OPROCENTOWANIE, a.DATA_POZYCZKI, a.TIMESTAMP, a.SOURCE
from Target.dbo.POZYCZKA a

print 'Terminal'
insert into Temp.dbo.STG_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
where ta.ID_TERMINALU is not null
except
select a.ID_FROM_SOURCE, a.WLASCICIEL, a.DATA_WAZNOSCI, a.TIMESTAMP, a.SOURCE
from Target.dbo.TERMINAL a

print 'TYP_TRANSAKCJI'
insert into Temp.dbo.STG_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
where ta.ID_TYPU is not null
except
select a.ID_FROM_SOURCE, a.OPIS, a.TIMESTAMP, a.SOURCE
from Target.dbo.TYP_TRANSAKCJI a

 
 -----------------------------------------------------------------------------------------------------
--								Do BAD rekordy ktore juz sa w Targecie oprocz tych ktore juz sa w Bad:
 -----------------------------------------------------------------------------------------------------

  print 'Do BAD rekordy ktore juz sa w targecie oprocz tych ktore juz sa w bad:'

 print 'Bad: Adres'
 insert into Temp.dbo.BAD_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
intersect
select a.ID_FROM_SOURCE, a.ULICA, a.MIASTO, a.KOD_POCZTOWY, a.MIESZKANIE, a.TIMESTAMP, a.SOURCE
from Target.dbo.ADRES a
except
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_ADRES ta

 print 'Bad: Bank' 
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
intersect
select a.ID_FROM_SOURCE, a.NAZWA_BANKU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANK a
except
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANK ta

 print 'Bad: Bankomat'
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
intersect
select a.ID_FROM_SOURCE, a.ID_BANK, a.ID_ADRES, a.NAZWA_BANKOMATU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANKOMAT a
except
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANKOMAT ta

 print 'Bad: Karta'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
intersect
select a.ID_FROM_SOURCE, a.ID_KONTA, a.NUMER_KARTY, a.CVC, a.DATA_WAZNOSCI_KARTY, a.TIMESTAMP, a.SOURCE
from Target.dbo.KARTA a
except
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KARTA ta

 print 'Bad: Konto'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
intersect
select a.ID_FROM_SOURCE, a.NUMER_KONTA, a.OPROCENTOWANIE_KONTA, a.TIMESTAMP, a.SOURCE
from Target.dbo.KONTO a
except
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KONTO ta

 print 'Bad: Operator'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
intersect
select a.ID_FROM_SOURCE, a.NAZWA_OPERATORA, a.OPROCENTOWANIE_OPERATORA, a.TIMESTAMP, a.SOURCE
from Target.dbo.OPERATOR a
except
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_OPERATOR ta

 print 'Bad: Pozyczka'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
intersect
select a.ID_FROM_SOURCE, a.SUMA, a.OPROCENTOWANIE, a.DATA_POZYCZKI, a.TIMESTAMP, a.SOURCE
from Target.dbo.POZYCZKA a
except
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_POZYCZKA ta

print 'Terminal'
insert into Temp.dbo.BAD_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
intersect
select a.ID_FROM_SOURCE, a.WLASCICIEL, a.DATA_WAZNOSCI, a.TIMESTAMP, a.SOURCE
from Target.dbo.TERMINAL a
except
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.BAD_TERMINAL ta

print 'TYP_TRANSAKCJI'
insert into Temp.dbo.BAD_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
intersect
select a.ID_FROM_SOURCE, a.OPIS, a.TIMESTAMP, a.SOURCE
from Target.dbo.TYP_TRANSAKCJI a
except
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.BAD_TYP_TRANSAKCJI ta

 -----------------------------------------------------------------------------------------------------
--								Do BAD rekordy ktore maja null zamiast klucza glownego:
 -----------------------------------------------------------------------------------------------------

 print 'Do BAD rekordy ktore maja null zamiast klucza glownego:'

 print 'Bad null: Adres'
insert into Temp.dbo.BAD_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
where ta.ID_ADRES = null
except
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_ADRES ta

 print 'Bad: Bank' 
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
where ta.ID_BANK is null
except
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANK ta

 print 'Bad: Bankomat'
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
where ta.ID_BANKOMAT is null
except
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANKOMAT ta

 print 'Bad: Karta'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
where ta.ID_KARTY is null
except
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KARTA ta

 print 'Bad: Konto'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
where ta.ID_KONTA is null
except
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KONTO ta

 print 'Bad: Operator'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
where ta.ID_OPERATOR is null
except
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_OPERATOR ta

 print 'Bad: Pozyczka'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
where ta.ID_POZYCZKA is null
except
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_POZYCZKA ta

print 'Bad: Terminal'
insert into Temp.dbo.BAD_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
where ta.ID_TERMINALU is null
except
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.BAD_TERMINAL ta

print 'Bad null: TYP_TRANSAKCJI'
insert into Temp.dbo.BAD_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
where ta.ID_TYPU is null
except
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.BAD_TYP_TRANSAKCJI ta

GO


