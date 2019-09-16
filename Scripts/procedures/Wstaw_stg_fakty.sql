create procedure Wstaw_stage_fakty as


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- 1. Wstawienie rekordow z Temp.dbo.TEMP_* ktorych nie ma w hurtowni i maja wymiary w hurtowni do Temp.STG
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_DOLADOWANIE_TELEFONU
select 
	ta.ID_DOLADOWANIA, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
from 
	Temp.dbo.TEMP_DOLADOWANIE_TELEFONU ta
where 
	ta.ID_DOLADOWANIA in 
	(
		select ID_DOLADOWANIA 
		from Temp.dbo.TEMP_DOLADOWANIE_TELEFONU ru 
		inner join Target.dbo.KONTO konto on (konto.ID_FROM_SOURCE = ru.ID_KONTA and konto.SOURCE = ru.source)
		inner join Target.dbo.OPERATOR operator on (operator.ID_FROM_SOURCE = ru.ID_OPERATOR and operator.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
select ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
from Target.dbo.DOLADOWANIE_TELEFONU ta

------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_PLATNOSC_KARTA
select 
	ta.ID_PLATNOSCI, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.TEMP_PLATNOSC_KARTA ta
where 
	ta.ID_PLATNOSCI in 
	(
		select ID_PLATNOSCI 
		from Temp.dbo.TEMP_PLATNOSC_KARTA ru 
		inner join Target.dbo.KARTA karta on (karta.ID_FROM_SOURCE = ru.ID_KARTY and karta.SOURCE = ru.source)
		inner join Target.dbo.TERMINAL terminal on (terminal.ID_FROM_SOURCE = ru.ID_TERMINALU and terminal.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
select 
	ta.ID_FROM_SOURCE, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.PLATNOSC_KARTA ta

------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_TRANSAKCJA
select 
	 ta.ID_TRANSAKCJI, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.TEMP_TRANSAKCJA ta
where 
	ta.ID_TRANSAKCJI in 
	(
		select ID_TRANSAKCJI 
		from Temp.dbo.TEMP_TRANSAKCJA ru 
		inner join Target.dbo.KONTO kontoZ on (kontoZ.ID_FROM_SOURCE = ru.ID_KONTA and kontoZ.SOURCE = ru.source)
		inner join Target.dbo.KONTO kontoDo on (kontoDo.ID_FROM_SOURCE = ru.ID_KONTA and kontoDo.SOURCE = ru.source)
		where ru.SOURCE = ta.SOURCE
	)
except
select 
	 ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.TRANSAKCJA ta

------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_WPLATA_RATY_POZYCZKI
select 
	 ta.ID_RATY, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.TEMP_WPLATA_RATY_POZYCZKI ta
where 
	ta.ID_RATY in 
	(
		select ID_RATY 
		from Temp.dbo.TEMP_WPLATA_RATY_POZYCZKI ru 
		inner join Target.dbo.KONTO konto on (konto.ID_FROM_SOURCE = ru.ID_KONTA and konto.SOURCE = ru.source)
		inner join Target.dbo.POZYCZKA pozyczka on (pozyczka.ID_FROM_SOURCE = ru.ID_POZYCZKA and pozyczka.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
select 
	 ta.ID_FROM_SOURCE, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.WPLATA_RATY_POZYCZKI ta

------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_WYPLATA_Z_BANKOMATU
select 
	 ta.ID_WYPLATY, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.TEMP_WYPLATA_Z_BANKOMATU ta
where 
	ta.ID_WYPLATY in 
	(
		select ID_WYPLATY 
		from Temp.dbo.TEMP_WYPLATA_Z_BANKOMATU ru 
		inner join Target.dbo.BANKOMAT bankomat on (bankomat.ID_FROM_SOURCE = ru.ID_BANKOMAT and bankomat.SOURCE = ru.source)
		inner join Target.dbo.KARTA karta on (karta.ID_FROM_SOURCE = ru.ID_KARTY and karta.SOURCE = ru.source)
		where ru.SOURCE = ta.SOURCE
	)
except
select 
	 ta.ID_FROM_SOURCE, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.WYPLATA_Z_BANKOMATU ta

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- 1. Wstawienie rekordow z BAD ktorych nie ma w hurtowni i maja wymiary w hurtowni do Temp.STG oprocz tych ktore juz sa w STG i tych ktore juz sa w hurtowni
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_DOLADOWANIE_TELEFONU
select 
	ta.ID_DOLADOWANIA, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
from 
	Temp.dbo.BAD_DOLADOWANIE_TELEFONU ta
where 
	ta.ID_DOLADOWANIA in 
	(
		select ID_DOLADOWANIA 
		from Temp.dbo.TEMP_DOLADOWANIE_TELEFONU ru 
		inner join Target.dbo.KONTO konto on (konto.ID_FROM_SOURCE = ru.ID_KONTA and konto.SOURCE = ru.source)
		inner join Target.dbo.OPERATOR operator on (operator.ID_FROM_SOURCE = ru.ID_OPERATOR and operator.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
	(
		select ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
		from Target.dbo.DOLADOWANIE_TELEFONU ta
	union
		select ta.ID_DOLADOWANIA, ta.ID_KONTA, ta.ID_OPERATOR, ta.NUMER_TELEFONU, ta.KWOTA_DOLADOWANIA, ta.TIMESTAMP, ta.SOURCE 
		from Temp.dbo.STG_DOLADOWANIE_TELEFONU ta
	)		
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_PLATNOSC_KARTA
select 
	ta.ID_PLATNOSCI, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.BAD_PLATNOSC_KARTA ta
where 
	ta.ID_PLATNOSCI in 
	(
		select ID_PLATNOSCI 
		from Temp.dbo.TEMP_PLATNOSC_KARTA ru 
		inner join Target.dbo.KARTA karta on (karta.ID_FROM_SOURCE = ru.ID_KARTY and karta.SOURCE = ru.source)
		inner join Target.dbo.TERMINAL terminal on (terminal.ID_FROM_SOURCE = ru.ID_TERMINALU and terminal.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
(
select 
	ta.ID_FROM_SOURCE, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.PLATNOSC_KARTA ta
union
select 
	ta.ID_PLATNOSCI, ta.ID_KARTY, ta.ID_TERMINALU, ta.WARTOSC, ta.DATA_PLATNOSCI, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.STG_PLATNOSC_KARTA ta
)
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_TRANSAKCJA
select 
	 ta.ID_TRANSAKCJI, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.BAD_TRANSAKCJA ta
where 
	ta.ID_TRANSAKCJI in 
	(
		select ID_TRANSAKCJI 
		from Temp.dbo.TEMP_TRANSAKCJA ru 
		inner join Target.dbo.KONTO kontoZ on (kontoZ.ID_FROM_SOURCE = ru.ID_KONTA and kontoZ.SOURCE = ru.source)
		inner join Target.dbo.KONTO kontoDo on (kontoDo.ID_FROM_SOURCE = ru.ID_KONTA and kontoDo.SOURCE = ru.source)
		where ru.SOURCE = ta.SOURCE
	)
except
(
select 
	 ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.TRANSAKCJA ta
union
select 
	 ta.ID_TRANSAKCJI, ta.ID_KONTA, ta.KON_ID_KONTA, ta.ID_TYPU, ta.KWOTA, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.STG_TRANSAKCJA ta
)
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_WPLATA_RATY_POZYCZKI
select 
	 ta.ID_RATY, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.BAD_WPLATA_RATY_POZYCZKI ta
where 
	ta.ID_RATY in 
	(
		select ID_RATY 
		from Temp.dbo.TEMP_WPLATA_RATY_POZYCZKI ru 
		inner join Target.dbo.KONTO konto on (konto.ID_FROM_SOURCE = ru.ID_KONTA and konto.SOURCE = ru.source)
		inner join Target.dbo.POZYCZKA pozyczka on (pozyczka.ID_FROM_SOURCE = ru.ID_POZYCZKA and pozyczka.SOURCE = ru.SOURCE)
		where ru.SOURCE = ta.SOURCE
	)
except
(
select 
	 ta.ID_FROM_SOURCE, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.WPLATA_RATY_POZYCZKI ta
union
select 
	 ta.ID_RATY, ta.ID_POZYCZKA, ta.ID_KONTA, ta.KWOATA, ta.DATA_WPLATY_RATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.STG_WPLATA_RATY_POZYCZKI ta
)
------------------------------------------------------------------------------------------
insert into Temp.dbo.STG_WYPLATA_Z_BANKOMATU
select 
	 ta.ID_WYPLATY, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.BAD_WYPLATA_Z_BANKOMATU ta
where 
	ta.ID_WYPLATY in 
	(
		select ID_WYPLATY 
		from Temp.dbo.TEMP_WYPLATA_Z_BANKOMATU ru 
		inner join Target.dbo.BANKOMAT bankomat on (bankomat.ID_FROM_SOURCE = ru.ID_BANKOMAT and bankomat.SOURCE = ru.source)
		inner join Target.dbo.KARTA karta on (karta.ID_FROM_SOURCE = ru.ID_KARTY and karta.SOURCE = ru.source)
		where ru.SOURCE = ta.SOURCE
	)
except
(
select 
	 ta.ID_FROM_SOURCE, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE
from 
	Target.dbo.WYPLATA_Z_BANKOMATU ta
UNION
select 
	 ta.ID_WYPLATY, ta.ID_BANKOMAT, ta.ID_KARTY, ta.DATA_WYPLATY, ta.TIMESTAMP, ta.SOURCE
from 
	Temp.dbo.STG_WYPLATA_Z_BANKOMATU ta
)

go