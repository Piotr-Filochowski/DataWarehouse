USE [Temp]
GO

/****** Object:  StoredProcedure [dbo].[Wstaw_target_wymiary]    Script Date: 15.09.2019 14:33:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[Wstaw_target_wymiary] as

update Target.dbo.ADRES
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.ADRES tar
	join Temp.dbo.STG_ADRES tem on (tem.ID_ADRES = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.BANK
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.BANK tar
	join Temp.dbo.STG_BANK tem on (tem.ID_BANK = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.BANKOMAT
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.BANKOMAT tar
	join Temp.dbo.STG_BANKOMAT tem on (tem.ID_BANKOMAT = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.KARTA
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.KARTA tar
	join Temp.dbo.STG_KARTA tem on (tem.ID_KARTY = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.KONTO
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.KONTO tar
	join Temp.dbo.STG_KONTO tem on (tem.ID_KONTA = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.OPERATOR
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.OPERATOR tar
	join Temp.dbo.STG_OPERATOR tem on (tem.ID_OPERATOR = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.POZYCZKA
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.POZYCZKA tar
	join Temp.dbo.STG_POZYCZKA tem on (tem.ID_POZYCZKA = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.TERMINAL
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.TERMINAL tar
	join Temp.dbo.STG_TERMINAL tem on (tem.ID_TERMINALU = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.TYP_TRANSAKCJI
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.TYP_TRANSAKCJI tar
	join Temp.dbo.STG_TYP_TRANSAKCJI tem on (tem.ID_TYPU = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

insert into Target.dbo.ADRES
(ID_FROM_SOURCE, ULICA, MIASTO, KOD_POCZTOWY, MIESZKANIE, TIMESTAMP, SOURCE)
select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_ADRES ta

insert into Target.dbo.BANK
(ID_FROM_SOURCE, NAZWA_BANKU, TIMESTAMP, SOURCE)
select ta.ID_BANK, ta.NAZWA_BANKU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_BANK ta

insert into Target.dbo.BANKOMAT
(ID_FROM_SOURCE, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE)
select ta.ID_BANKOMAT, ta.ID_BANK, ta.ID_ADRES, ta.NAZWA_BANKOMATU, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_BANKOMAT ta

insert into Target.dbo.KARTA
(ID_FROM_SOURCE, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE)
select ta.ID_KARTY, ta.ID_KONTA, ta.NUMER_KARTY, ta.CVC, ta.DATA_WAZNOSCI_KARTY, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_KARTA ta

insert into Target.dbo.KONTO
(ID_FROM_SOURCE, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE)
select  ta.ID_KONTA, ta.NUMER_KONTA, ta.OPROCENTOWANIE_KONTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_KONTO ta

insert into Target.dbo.OPERATOR
(ID_FROM_SOURCE, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE)
select ta.ID_OPERATOR, ta.NAZWA_OPERATORA, ta.OPROCENTOWANIE_OPERATORA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_OPERATOR ta

insert into Target.dbo.POZYCZKA
(ID_FROM_SOURCE, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE)
select ta.ID_POZYCZKA, ta.SUMA, ta.OPROCENTOWANIE, ta.DATA_POZYCZKI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_POZYCZKA ta

insert into Target.dbo.TERMINAL
(ID_FROM_SOURCE, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE)
select ta.ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE
from Temp.dbo.STG_TERMINAL ta

insert into Target.dbo.TYP_TRANSAKCJI
(ID_FROM_SOURCE, OPIS, TIMESTAMP, SOURCE)
select ID_TYPU, OPIS, TIMESTAMP, SOURCE
from Temp.dbo.STG_TYP_TRANSAKCJI ta




GO


