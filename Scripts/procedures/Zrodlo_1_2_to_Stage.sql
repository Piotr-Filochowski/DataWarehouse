USE [Stage]
GO

/****** Object:  StoredProcedure [dbo].[Zrodlo1_to_Stage]    Script Date: 12.09.2019 10:25:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Piotr Filochowski
-- Create date: 12.09
-- Description:	Wstawianie danych ze zrodla1 do Stage
-- =============================================
ALTER PROCEDURE [dbo].[Zrodlo_to_Stage] 
AS
BEGIN

	-- czyszczenie wszystkich tabel w Stage
	exec sp_MSforeachtable 'TRUNCATE TABLE?'

	-- kopiowanie danych z tabel zrodlowych
	-- do zmiany na kursor po metadanych

	insert into Z1_DOLADOWANIE_TELEFONU select ID_DOLADOWANIA, ID_KONTA, ID_OPERATOR, NUMER_TELEFONU, KWOTA_DOLADOWANIA, '9999-12-12', 1 from Zrodlo1.dbo.DOLADOWANIE_TELEFONU;
	insert into Z1_KARTA select ID_KARTY, ID_KONTA, NUMER_KARTY, CVC, DATA_WAZNOSCI_KARTY, '9999-12-12', 1 from Zrodlo1.dbo.KARTA;
	insert into Z1_KONTO select ID_KONTA, NUMER_KONTA, OPROCENTOWANIE_KONTA, '9999-12-12', 1 from Zrodlo1.dbo.KONTO;
	insert into Z1_OPERATOR select  ID_OPERATOR, NAZWA_OPERATORA, OPROCENTOWANIE_OPERATORA, '9999-12-12', 1 from Zrodlo1.dbo.OPERATOR;
	insert into Z1_PLATNOSC_KARTA select ID_PLATNOSCI, ID_KARTY, ID_TERMINALU, WARTOSC, DATA_PLATNOSCI, '9999-12-12', 1 from Zrodlo1.dbo.PLATNOSC_KARTA;
	insert into Z1_POZYCZKA select ID_POZYCZKA, SUMA, OPROCENTOWANIE, DATA_POZYCZKI, '9999-12-12', 1 from Zrodlo1.dbo.POZYCZKA;
	insert into Z1_TERMINAL select ID_TERMINALU, WLASCICIEL, DATA_WAZNOSCI, '9999-12-12', 1 from Zrodlo1.dbo.TERMINAL;
	insert into Z1_WPLATA_RATY_POZYCZKI select ID_RATY, ID_POZYCZKA, ID_KONTA, KWOATA, DATA_WPLATY_RATY, '9999-12-12', 1 from Zrodlo1.dbo.WPLATA_RATY_POZYCZKI;

	insert into Z2_KARTA select ID_KARTY, ID_KONTA, NUMER_KARTY, CVC, DATA_WAZNOSCI_KARTY, '9999-12-12', 2 from Zrodlo2.dbo.KARTA;
	insert into Z2_KONTO select ID_KONTA, NUMER_KONTA, OPROCENTOWANIE_KONTA, '9999-12-12', 2 from Zrodlo2.dbo.KONTO;
	insert into Z2_ADRES select ID_ADRES, ULICA, MIASTO, KOD_POCZTOWY, MIESZKANIE, '9999-12-12', 2 from Zrodlo2.dbo.ADRES;
	insert into Z2_BANK select ID_BANK, NAZWA_BANKU, '9999-12-12', 2 from Zrodlo2.dbo.BANK;
	insert into Z2_BANKOMAT select ID_BANKOMAT, ID_BANK, ID_ADRES, NAZWA_BANKOMATU, '9999-12-12', 2 from Zrodlo2.dbo.BANKOMAT;
	insert into Z2_TRANSAKCJA select ID_TRANSAKCJI, ID_KONTA, KON_ID_KONTA, ID_TYPU, KWOTA, '9999-12-12', 2 from Zrodlo2.dbo.TRANSAKCJA;
	insert into Z2_TYP_TRANSAKCJI select ID_TYPU, OPIS, '9999-12-12', 2 from Zrodlo2.dbo.TYP_TRANSAKCJI;
	insert into Z2_WYPLATA_Z_BANKOMATU select ID_WYPLATY, ID_BANKOMAT, ID_KARTY, DATA_WYPLATY, '9999-12-12', 2 from Zrodlo2.dbo.WYPLATA_Z_BANKOMATU;

	

END
GO


