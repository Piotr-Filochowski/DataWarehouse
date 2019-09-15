create procedure Wstaw_stage_fakty as

-- 1. Wstawienie rekordow ktorych nie ma w hurtowni

insert into Temp.dbo.STG_DOLADOWANIE_TELEFONU 
select 
	ta.ID_DOLADOWANIA, ta.ID_KONTA, ta.ID_OPERATOR, ta.KWOTA_DOLADOWANIA, ta.NUMER_TELEFONU, ta.SOURCE, ta.TIMESTAMP 
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
select ta.ID_FROM_SOURCE, ta.ID_KONTA, ta.ID_OPERATOR, ta.KWOTA_DOLADOWANIA, ta.NUMER_TELEFONU, ta.SOURCE, ta.TIMESTAMP 
from Target.dbo.DOLADOWANIE_TELEFONU ta


go