USE [Temp]
GO

/****** Object:  StoredProcedure [dbo].[Wstaw_stage_wymiary]    Script Date: 13.09.2019 20:58:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Wstaw_stage_wymiary] as

 -----------------------------------------------------------------------------------------------------
--								Do STG nowe rekordy:
 -----------------------------------------------------------------------------------------------------

 print 'Adres'
-- Adres
insert into Temp.dbo.STG_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
where ta.ID_ADRES is not null
except
select t.T_VALUE, a.ULICA, a.MIASTO, a.KOD_POCZTOWY, a.MIESZKANIE, a.TIMESTAMP, a.SOURCE
from Target.dbo.ADRES a
join Target.dbo.T_KEY_ADRES t on (t.T_ID = a.ID_ADRES)

 print 'Bank'
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
where ta.ID_BANK is not null
except
select t.T_VALUE, a.NAZWA_BANKU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANK a
join Target.dbo.T_KEY_BANK t on (t.T_ID = a.ID_BANK)

 print 'Bankomat' 
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
where ta.ID_BANKOMAT is not null
except
select t.T_VALUE, a.ID_BANK, a.ID_ADRES, a.NAZWA_BANKOMATU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANKOMAT a
join Target.dbo.T_KEY_BANKOMAT t on (t.T_ID = a.ID_BANKOMAT)

 print 'Karta'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
where ta.ID_KARTY is not null
except
select t.T_VALUE, a.ID_KONTA, a.NUMER_KARTY, a.CVC, a.DATA_WAZNOSCI_KARTY, a.TIMESTAMP, a.SOURCE
from Target.dbo.KARTA a
join Target.dbo.T_KEY_KARTA t on (t.T_ID = a.ID_KARTY)

print 'Konto'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
where ta.ID_KONTA is not null
except
select t.T_VALUE, a.NUMER_KONTA, a.OPROCENTOWANIE_KONTA, a.TIMESTAMP, a.SOURCE
from Target.dbo.KONTO a
join Target.dbo.T_KEY_KONTO t on (t.T_ID = a.ID_KONTA)

 print 'Operator'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
where ta.ID_OPERATOR is not null
except
select t.T_VALUE, a.NAZWA_OPERATORA, a.OPROCENTOWANIE_OPERATORA, a.TIMESTAMP, a.SOURCE
from Target.dbo.OPERATOR a
join Target.dbo.T_KEY_OPERATOR t on (t.T_ID = a.ID_OPERATOR)

 print 'Pozyczka'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
where ta.ID_POZYCZKA is not null
except
select t.T_VALUE, a.SUMA, a.OPROCENTOWANIE, a.DATA_POZYCZKI, a.TIMESTAMP, a.SOURCE
from Target.dbo.POZYCZKA a
join Target.dbo.T_KEY_POZYCZKA t on (t.T_ID = a.ID_POZYCZKA)

print 'Terminal'
insert into Temp.dbo.STG_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
where ta.ID_TERMINALU is not null
except
select t.T_VALUE, a.WLASCICIEL, a.DATA_WAZNOSCI, a.TIMESTAMP, a.SOURCE
from Target.dbo.TERMINAL a
join Target.dbo.T_KEY_TERMINAL t on (t.T_ID = a.ID_TERMINALU)

print 'TYP_TRANSAKCJI'
insert into Temp.dbo.STG_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
where ta.ID_TYPU is not null
except
select t.T_VALUE, a.OPIS, a.TIMESTAMP, a.SOURCE
from Target.dbo.TYP_TRANSAKCJI a
join Target.dbo.T_KEY_TYP_TRANSAKCJI t on (t.T_ID = a.ID_TYPU)

 -----------------------------------------------------------------------------------------------------
--								Do STG rekordy ktore sa zmienione wzgledem hurtowni
 -----------------------------------------------------------------------------------------------------

  print 'Adres zmienione rekordy'
-- Adres
insert into Temp.dbo.STG_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
join Target.dbo.T_KEY_ADRES t on (t.T_ID = ta.ID_ADRES)
except
select a.ID_ADRES, a.ULICA, a.MIASTO, a.KOD_POCZTOWY, a.MIESZKANIE, a.TIMESTAMP, a.SOURCE
from Target.dbo.ADRES a

print 'Bank zmienione rekordy'
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
join Target.dbo.T_KEY_BANK t on (t.T_ID = ta.ID_BANK)
except
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.BANK ta

 print 'Bankomat zmienione rekordy' 
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
join Target.dbo.T_KEY_BANKOMAT t on (t.T_ID = ta.ID_BANKOMAT)
except
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.BANKOMAT ta

 print 'Karta zmienione rekordy'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
join Target.dbo.T_KEY_KARTA t on (t.T_ID = ta.ID_KARTY)
except
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.KARTA ta

print 'Konto zmienione rekordy'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
join Target.dbo.T_KEY_KONTO t on (t.T_ID = ta.ID_KONTA)
except
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.KONTO ta

 print 'Operator zmienione rekordy'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
join Target.dbo.T_KEY_OPERATOR t on (t.T_ID = ta.ID_OPERATOR)
except
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.OPERATOR ta

 print 'Pozyczka zmienione rekordy'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
join Target.dbo.T_KEY_POZYCZKA t on (t.T_ID = ta.ID_POZYCZKA)
except
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Target.dbo.POZYCZKA ta

print 'Terminal zmienione rekordy'
insert into Temp.dbo.STG_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
join Target.dbo.T_KEY_TERMINAL t on (t.T_ID = ta.ID_TERMINALU)
except
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Target.dbo.TERMINAL ta

print 'TYP_TRANSAKCJI'
insert into Temp.dbo.STG_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
join Target.dbo.T_KEY_TYP_TRANSAKCJI t on (t.T_ID = ta.ID_TYPU)
except
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Target.dbo.TYP_TRANSAKCJI ta
 -----------------------------------------------------------------------------------------------------
--								Do BAD rekordy ktore juz sa w Targecie oprocz tych ktore juz sa w Bad:
 -----------------------------------------------------------------------------------------------------

  print 'Do BAD rekordy ktore juz sa w targecie oprocz tych ktore juz sa w bad:'

 print 'Bad: Adres'
 insert into Temp.dbo.BAD_ADRES
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_ADRES ta
intersect
select t.T_VALUE, a.ULICA, a.MIASTO, a.KOD_POCZTOWY, a.MIESZKANIE, a.TIMESTAMP, a.SOURCE
from Target.dbo.ADRES a
join Target.dbo.T_KEY_ADRES t on (t.T_ID = a.ID_ADRES)
except
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_ADRES ta

 print 'Bad: Bank' 
insert into Temp.dbo.STG_BANK
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANK ta
intersect
select t.T_VALUE, a.NAZWA_BANKU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANK a
join Target.dbo.T_KEY_BANK t on (t.T_ID = a.ID_BANK)
except
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANK ta

 print 'Bad: Bankomat'
insert into Temp.dbo.STG_BANKOMAT
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_BANKOMAT ta
intersect
select t.T_VALUE, a.ID_BANK, a.ID_ADRES, a.NAZWA_BANKOMATU, a.TIMESTAMP, a.SOURCE
from Target.dbo.BANKOMAT a
join Target.dbo.T_KEY_BANKOMAT t on (t.T_ID = a.ID_BANKOMAT)
except
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_BANKOMAT ta

 print 'Bad: Karta'
insert into Temp.dbo.STG_KARTA
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KARTA ta
intersect
select t.T_VALUE, a.ID_KONTA, a.NUMER_KARTY, a.CVC, a.DATA_WAZNOSCI_KARTY, a.TIMESTAMP, a.SOURCE
from Target.dbo.KARTA a
join Target.dbo.T_KEY_KARTA t on (t.T_ID = a.ID_KARTY)
except
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KARTA ta

 print 'Bad: Konto'
insert into Temp.dbo.STG_KONTO
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_KONTO ta
intersect
select t.T_VALUE, a.NUMER_KONTA, a.OPROCENTOWANIE_KONTA, a.TIMESTAMP, a.SOURCE
from Target.dbo.KONTO a
join Target.dbo.T_KEY_KONTO t on (t.T_ID = a.ID_KONTA)
except
select ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_KONTO ta

 print 'Bad: Operator'
insert into Temp.dbo.STG_OPERATOR
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_OPERATOR ta
intersect
select t.T_VALUE, a.NAZWA_OPERATORA, a.OPROCENTOWANIE_OPERATORA, a.TIMESTAMP, a.SOURCE
from Target.dbo.OPERATOR a
join Target.dbo.T_KEY_OPERATOR t on (t.T_ID = a.ID_OPERATOR)
except
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_OPERATOR ta

 print 'Bad: Pozyczka'
insert into Temp.dbo.STG_POZYCZKA
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.TEMP_POZYCZKA ta
intersect
select t.T_VALUE, a.SUMA, a.OPROCENTOWANIE, a.DATA_POZYCZKI, a.TIMESTAMP, a.SOURCE
from Target.dbo.POZYCZKA a
join Target.dbo.T_KEY_POZYCZKA t on (t.T_ID = a.ID_POZYCZKA)
except
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.BAD_POZYCZKA ta

print 'Terminal'
insert into Temp.dbo.BAD_TERMINAL
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TERMINAL ta
intersect
select t.T_VALUE, a.WLASCICIEL, a.DATA_WAZNOSCI, a.TIMESTAMP, a.SOURCE
from Target.dbo.TERMINAL a
join Target.dbo.T_KEY_TERMINAL t on (t.T_ID = a.ID_TERMINALU)
except
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.BAD_TERMINAL ta

print 'TYP_TRANSAKCJI'
insert into Temp.dbo.BAD_TYP_TRANSAKCJI
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.TEMP_TYP_TRANSAKCJI ta
intersect
select t.T_VALUE, a.OPIS, a.TIMESTAMP, a.SOURCE
from Target.dbo.TYP_TRANSAKCJI a
join Target.dbo.T_KEY_TYP_TRANSAKCJI t on (t.T_ID = a.ID_TYPU)
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


