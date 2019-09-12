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
CREATE PROCEDURE Zrodlo1_to_Stage 
AS
BEGIN
	insert into Z1_DOLADOWANIE_TELEFONU select * from Zrodlo1.dbo.DOLADOWANIE_TELEFONU;
	insert into Z1_KARTA select * from Zrodlo1.dbo.KARTA;
	insert into Z1_KONTO select * from Zrodlo1.dbo.KONTO;
	insert into Z1_OPERATOR select * from Zrodlo1.dbo.OPERATOR;
	insert into Z1_PLATNOSC_KARTA select * from Zrodlo1.dbo.PLATNOSC_KARTA;
	insert into Z1_POZYCZKA select * from Zrodlo1.dbo.POZYCZKA;
	insert into Z1_TERMINAL select * from Zrodlo1.dbo.TERMINAL;
	insert into Z1_WPLATA_RATY_POZYCZKI select * from Zrodlo1.dbo.WPLATA_RATY_POZYCZKI;
END
GO
