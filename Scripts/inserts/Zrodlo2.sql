Use [Zrodlo2]

select * from Zrodlo2.dbo.BANK;
select * from Zrodlo2.dbo.TYP_TRANSAKCJI;

insert into Zrodlo2.dbo.BANK values
(1, 'Pekao SA'),
(2, 'PKO BP'),
(3, 'BNP BGZ Paribas'),
(4, 'Santander'),
(5, 'Millenium');


insert into Zrodlo2.dbo.TYP_TRANSAKCJI values
(1, 'Przelew zwykly'),
(2, 'Przelew miedzynarodowy'),
(3, 'Przelew natychmiastowy'),
(4, 'Przelew BLIK'),
(5, 'Przelew wewnatrzbankowy');

insert into Zrodlo2.dbo.ADRES values
(1, 'Poludniowa', 'Warszawa', '05-123', '37A'),
(2, 'Poludniowa', 'Warszawa', '05-123', '38A'),
(3, 'Poludniowa', 'Warszawa', '05-123', '39A'),
(4, 'Poludniowa', 'Warszawa', '05-123', '40A'),
(5, 'Poludniowa', 'Warszawa', '05-123', '41A');

insert into Zrodlo2.dbo.TRANSAKCJA values
(1, 1, 1, 1, 100),
(2, 2, 2, 2, 100),
(3, 1, 1, 3, 100),
(4, 4, 4, 4, 1000),
(5, 5, 3, 2, 1543),
(6, 1, 1, 1, 100),
(7, 2, 2, 2, 100),
(8, 1, 1, 3, 100),
(9, 4, 4, 4, 1000),
(10, 5, 3, 2, 1543);

insert into Zrodlo2.dbo.WYPLATA_Z_BANKOMATU values
(1, 1, 1, '2019-02-11 00:00:00'), 
(2, 1, 1, '2019-02-10 00:00:00'), 
(3, 2, 1, '2019-02-12 00:00:00'), 
(4, 2, 1, '2019-02-07 00:00:00'), 
(5, 3, 1, '2019-02-06 00:00:00');




-- Konto
insert into Zrodlo2.dbo.KONTO values 
(1, 555555555, 2.5),
(2, 444444444, 2.6),
(3, 5555555555, 2.7),
(4, 666666666, 2.8),
(5, 555555555, 2.9);

-- Karta
insert into Zrodlo2.dbo.KARTA values 
(1, 1, 11123411111, 123, '3019-02-11 00:00:00'), 
(2, 1, 11123411111, 456, '3019-02-10 00:00:00'), 
(3, 2, 1115551134111, 789, '3019-02-12 00:00:00'), 
(4, 2, 111111123111, 143, '3019-02-07 00:00:00'), 
(5, 3, 1111116311, 153, '3019-02-06 00:00:00');


-- Bankomat
insert into Zrodlo2.dbo.BANKOMAT values
(1, 2, 5, 'Bankomat 1'),
(2, 3, 5, 'Bankomat 2'),
(3, 4, 5, 'Bankomat kolejny'),
(4, 5, 5, 'Nazwa bankomatu'),
(5, 5, 5, 'U Krysi');