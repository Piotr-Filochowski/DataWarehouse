alter procedure Wstaw_target_wymiary as

 print 'Adres'
-- Adres
update Target.dbo.ADRES
set TIMESTAMP = getDate()
where ID_ADRES in (select t.T_VALUE from Target.dbo.T_KEY_ADRES t join Temp.dbo.STG_ADRES a on (a.ID_ADRES = t.T_VALUE));

update Target.dbo.BANK
set TIMESTAMP = getDate()
where ID_BANK in (select t.T_VALUE from Target.dbo.T_KEY_BANK t join Temp.dbo.STG_BANK a on (a.ID_BANK = t.T_VALUE));

update Target.dbo.BANKOMAT
set TIMESTAMP = getDate()
where ID_BANKOMAT in (select t.T_VALUE from Target.dbo.T_KEY_BANKOMAT t join Temp.dbo.STG_BANKOMAT a on (a.ID_BANKOMAT = t.T_VALUE));

update Target.dbo.KARTA
set TIMESTAMP = getDate()
where ID_KARTY in (select t.T_VALUE from Target.dbo.T_KEY_KARTA t join Temp.dbo.STG_KARTA a on (a.ID_KARTY = t.T_VALUE));

update Target.dbo.KONTO
set TIMESTAMP = getDate()
where ID_KONTA in (select t.T_VALUE from Target.dbo.T_KEY_KONTO t join Temp.dbo.STG_KONTO a on (a.ID_KONTA = t.T_VALUE));

update Target.dbo.OPERATOR
set TIMESTAMP = getDate()
where ID_OPERATOR in (select t.T_VALUE from Target.dbo.T_KEY_OPERATOR t join Temp.dbo.STG_OPERATOR a on (a.ID_OPERATOR = t.T_VALUE));

update Target.dbo.POZYCZKA
set TIMESTAMP = getDate()
where ID_POZYCZKA in (select t.T_VALUE from Target.dbo.T_KEY_POZYCZKA t join Temp.dbo.STG_POZYCZKA a on (a.ID_POZYCZKA = t.T_VALUE));

update Target.dbo.TERMINAL
set TIMESTAMP = getDate()
where ID_TERMINALU in (select t.T_VALUE from Target.dbo.T_KEY_TERMINAL t join Temp.dbo.STG_TERMINAL a on (a.ID_TERMINALU = t.T_VALUE));

update Target.dbo.TYP_TRANSAKCJI
set TIMESTAMP = getDate()
where ID_TYPU in (select t.T_VALUE from Target.dbo.T_KEY_TYP_TRANSAKCJI t join Temp.dbo.STG_TYP_TRANSAKCJI a on (a.ID_TYPU = t.T_VALUE));


insert into Target.dbo.T_KEY_ADRES select ROW_NUMBER()OVER(ORDER BY a.ID_ADRES) + max(a.ID_ADRES), ID_ADRES from  Temp.dbo.STG_ADRES a where a.ID_ADRES not in (select t_value from target.dbo.T_KEY_ADRES) group by a.ID_ADRES
insert into Target.dbo.T_KEY_BANK select ROW_NUMBER()OVER(ORDER BY a.ID_BANK) + max(a.ID_BANK), ID_BANK from  Temp.dbo.STG_BANK a where a.ID_BANK not in (select t_value from target.dbo.T_KEY_BANK) group by a.ID_BANK
insert into Target.dbo.T_KEY_BANKOMAT select ROW_NUMBER()OVER(ORDER BY a.ID_BANKOMAT) + max(a.ID_BANKOMAT), ID_BANKOMAT from  Temp.dbo.STG_BANKOMAT a where a.ID_BANKOMAT not in (select t_value from target.dbo.T_KEY_BANKOMAT) group by a.ID_BANKOMAT
insert into Target.dbo.T_KEY_KARTA select ROW_NUMBER()OVER(ORDER BY a.ID_KARTY) + max(a.ID_KARTY), ID_KARTY from  Temp.dbo.STG_KARTA a where a.ID_KARTY not in (select t_value from target.dbo.T_KEY_KARTA) group by a.ID_KARTY
insert into Target.dbo.T_KEY_KONTO select ROW_NUMBER()OVER(ORDER BY a.ID_KONTA) + max(a.ID_KONTA), ID_KONTA from  Temp.dbo.STG_KONTO a where a.ID_KONTA not in (select t_value from target.dbo.T_KEY_KONTO) group by a.ID_KONTA
insert into Target.dbo.T_KEY_OPERATOR select ROW_NUMBER()OVER(ORDER BY a.ID_OPERATOR) + max(a.ID_OPERATOR), ID_OPERATOR from  Temp.dbo.STG_OPERATOR a where a.ID_OPERATOR not in (select t_value from target.dbo.T_KEY_OPERATOR) group by a.ID_OPERATOR
insert into Target.dbo.T_KEY_POZYCZKA select ROW_NUMBER()OVER(ORDER BY a.ID_POZYCZKA) + max(a.ID_POZYCZKA), ID_POZYCZKA from  Temp.dbo.STG_POZYCZKA a where a.ID_POZYCZKA not in (select t_value from target.dbo.T_KEY_POZYCZKA) group by a.ID_POZYCZKA
insert into Target.dbo.T_KEY_TERMINAL select ROW_NUMBER()OVER(ORDER BY a.ID_TERMINALU) + max(a.ID_TERMINALU), ID_TERMINALU from  Temp.dbo.STG_TERMINAL a where a.ID_TERMINALU not in (select t_value from target.dbo.T_KEY_TERMINAL) group by a.ID_TERMINALU
insert into Target.dbo.T_KEY_TYP_TRANSAKCJI select ROW_NUMBER()OVER(ORDER BY a.ID_TYPU) + max(a.ID_TYPU), ID_TYPU from  Temp.dbo.STG_TYP_TRANSAKCJI a where a.ID_TYPU not in (select t_value from target.dbo.T_KEY_TYP_TRANSAKCJI) group by a.ID_TYPU

insert into Target.dbo.ADRES select ta.ID_ADRES, ta.ULICA, ta.MIASTO, ta.KOD_POCZTOWY, ta.MIESZKANIE, ta.TIMESTAMP, ta.SOURCE from Temp.dbo.STG_ADRES ta join Target.dbo.T_KEY_ADRES t on (t.T_VALUE = ta.ID_ADRES)
insert into Target.dbo.ADRES select ID_ADRES, ULICA, MIASTO, KOD_POCZTOWY, MIESZKANIE, TIMESTAMP, SOURCE from Temp.dbo.STG_ADRES ta join Target.dbo.T_KEY_ADRES t on (t.T_VALUE = ta.ID_ADRES);

insert into Target.dbo.KARTA select ID_KARTY, ID_KONTA, NUMER_KARTY, CVC, DATA_WAZNOSCI_KARTY, TIMESTAMP, SOURCE from Temp.dbo.STG_KARTA ta join Target.dbo.T_KEY_KARTA t on (t.T_VALUE = ta.ID_KARTY);
insert into Target.dbo.KONTO select ID_KONTA, NUMER_KONTA, OPROCENTOWANIE_KONTA, TIMESTAMP, SOURCE from Temp.dbo.STG_KONTO ta join Target.dbo.T_KEY_KONTO t on (t.T_VALUE = ta.ID_KONTA);
insert into Target.dbo.OPERATOR select  ID_OPERATOR, NAZWA_OPERATORA, OPROCENTOWANIE_OPERATORA, TIMESTAMP, SOURCE from Temp.dbo.STG_OPERATOR ta join Target.dbo.T_KEY_OPERATOR t on (t.T_VALUE = ta.ID_OPERATOR);
insert into Target.dbo.POZYCZKA select ID_POZYCZKA, SUMA, OPROCENTOWANIE, DATA_POZYCZKI, TIMESTAMP, SOURCE from Temp.dbo.STG_POZYCZKA ta join Target.dbo.T_KEY_POZYCZKA t on (t.T_VALUE = ta.ID_POZYCZKA);
insert into Target.dbo.TERMINAL select ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, TIMESTAMP, SOURCE from Temp.dbo.STG_TERMINAL ta join Target.dbo.T_KEY_TERMINAL t on (t.T_VALUE = ta.ID_TERMINALU);
insert into Target.dbo.ADRES select ID_ADRES, ULICA, MIASTO, KOD_POCZTOWY, MIESZKANIE, TIMESTAMP, SOURCE from Temp.dbo.STG_ADRES ta join Target.dbo.T_KEY_ADRES t on (t.T_VALUE = ta.ID_ADRES);
insert into Target.dbo.BANK select ID_BANK, NAZWA_BANKU, TIMESTAMP, SOURCE from Temp.dbo.STG_BANK ta join Target.dbo.T_KEY_BANK t on (t.T_VALUE = ta.ID_BANK);
insert into Target.dbo.BANKOMAT select ID_BANKOMAT, ID_BANK, ID_ADRES, NAZWA_BANKOMATU, TIMESTAMP, SOURCE from Temp.dbo.STG_BANKOMAT ta join Target.dbo.T_KEY_BANKOMAT t on (t.T_VALUE = ta.ID_BANKOMAT);
insert into Target.dbo.TYP_TRANSAKCJI select ID_TYPU, OPIS, TIMESTAMP, SOURCE from Temp.dbo.STG_TYP_TRANSAKCJI ta join Target.dbo.T_KEY_TYP_TRANSAKCJI t on (t.T_VALUE = ta.ID_TYPU);


go

