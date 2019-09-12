-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Piotr Filochowski
-- Create date: 12.09
-- Description:	Wstawianie danych ze zrodla1 do Stage
-- ============================================= 
CREATE PROCEDURE Zrodlo2_to_Stage 
AS
BEGIN
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
