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
CREATE PROCEDURE [dbo].[Zrodlo_to_Stage] 
AS
BEGIN

	-- czyszczenie wszystkich tabel w Stage
	exec sp_MSforeachtable 'TRUNCATE TABLE'

	-- kopiowanie danych z tabel zrodlowych
	-- do zmiany na kursor po metadanych

	insert into Z1_DOLADOWANIE_TELEFONU select * from Zrodlo1.dbo.DOLADOWANIE_TELEFONU;
	insert into Z1_KARTA select * from Zrodlo1.dbo.KARTA;
	insert into Z1_KONTO select * from Zrodlo1.dbo.KONTO;
	insert into Z1_OPERATOR select * from Zrodlo1.dbo.OPERATOR;
	insert into Z1_PLATNOSC_KARTA select * from Zrodlo1.dbo.PLATNOSC_KARTA;
	insert into Z1_POZYCZKA select * from Zrodlo1.dbo.POZYCZKA;
	insert into Z1_TERMINAL select * from Zrodlo1.dbo.TERMINAL;
	insert into Z1_WPLATA_RATY_POZYCZKI select * from Zrodlo1.dbo.WPLATA_RATY_POZYCZKI;

	insert into Z2_KARTA select * from Zrodlo2.dbo.KARTA;
	insert into Z2_KONTO select * from Zrodlo2.dbo.KONTO;
	insert into Z2_ADRES select * from Zrodlo2.dbo.ADRES;
	insert into Z2_BANK select * from Zrodlo2.dbo.BANK;
	insert into Z2_BANKOMAT select * from Zrodlo2.dbo.BANKOMAT;
	insert into Z2_TRANSAKCJA select * from Zrodlo2.dbo.TRANSAKCJA;
	insert into Z2_TYP_TRANSAKCJI select * from Zrodlo2.dbo.TYP_TRANSAKCJI;
	insert into Z2_WYPLATA_Z_BANKOMATU select * from Zrodlo2.dbo.WYPLATA_Z_BANKOMATU;

	

END
GO


