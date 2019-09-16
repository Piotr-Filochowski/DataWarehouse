create procedure Wstaw_target_fakty as

-- Historyzacja

update Target.dbo.DOLADOWANIE_TELEFONU
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.DOLADOWANIE_TELEFONU tar
	join Temp.dbo.STG_DOLADOWANIE_TELEFONU tem on (tem.ID_DOLADOWANIA = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.PLATNOSC_KARTA
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.PLATNOSC_KARTA tar
	join Temp.dbo.STG_PLATNOSC_KARTA tem on (tem.ID_PLATNOSCI = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.TRANSAKCJA
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.TRANSAKCJA tar
	join Temp.dbo.STG_TRANSAKCJA tem on (tem.ID_TRANSAKCJI = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.WPLATA_RATY_POZYCZKI
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.WPLATA_RATY_POZYCZKI tar
	join Temp.dbo.STG_WPLATA_RATY_POZYCZKI tem on (tem.ID_RATY = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)

update Target.dbo.WYPLATA_Z_BANKOMATU
set TIMESTAMP = getDate()
where ID_CHD in
(
	select tar.ID_CHD
	from Target.dbo.WYPLATA_Z_BANKOMATU tar
	join Temp.dbo.STG_WYPLATA_Z_BANKOMATU tem on (tem.ID_WYPLATY = tar.ID_FROM_SOURCE and tem.SOURCE = tar.SOURCE)
)


insert into Target.dbo.DOLADOWANIE_TELEFONU
(ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE)
select 
ta.ID_DOLADOWANIA, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
from Temp.dbo.STG_DOLADOWANIE_TELEFONU ta

insert into Target.dbo.PLATNOSC_KARTA
(ta.ID_FROM_SOURCE, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE)
select 
ta.ID_PLATNOSCI, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_PLATNOSC_KARTA ta

insert into Target.dbo.TRANSAKCJA
(ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE)
select 
ta.ID_TRANSAKCJI, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from Temp.dbo.STG_TRANSAKCJA ta

insert into Target.dbo.WPLATA_RATY_POZYCZKI
(ta.ID_FROM_SOURCE, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE)
select 
ta.ID_RATY, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE 
from Temp.dbo.STG_WPLATA_RATY_POZYCZKI ta

insert into Target.dbo.WYPLATA_Z_BANKOMATU
(ta.ID_FROM_SOURCE, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE)
select 
ta.ID_WYPLATY, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE 
from Temp.dbo.STG_WYPLATA_Z_BANKOMATU ta

go