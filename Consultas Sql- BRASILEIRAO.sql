CREATE DATABASE BRASILEIRAO GO

USE BRASILEIRAO

SELECT * FROM CAMPEONATO

--------------------------------------------------------------------
		/*Consulta de clubes participantes*/

SELECT distinct [Clube 1]FROM CAMPEONATO go
--------------------------------------------------------------------

		/*5 Clubes que mais jogaram*/

SELECT TOP 5 [CLUBE 1],COUNT([Clube 1]) AS TOTAL FROM CAMPEONATO  
GROUP BY([Clube 1]) ORDER BY (TOTAL) DESC go
----------------------------------------------------------------------------

		/*Clubes Pertencentes ao estado de SP*/

SELECT DISTINCT [CLUBE 1] FROM Campeonato 
WHERE [Clube 1 Estado] = 'SP' ORDER BY [Clube 1] GO
---------------------------------------------------------------------------

		/*QUANTIDADE DE PARTIDAS DE CLUBES POR ESTADOS*/

SELECT [Clube 1 Estado], COUNT([Clube 1]) AS TOTAL
FROM Campeonato GROUP BY [Clube 1 ESTADO] ORDER BY [Clube 1 Estado]
---------------------------------------------------------------------------

		/*CONFRONTOS DE CLUBES DO MESMO ESTADO*/

SELECT [Clube 1], [Clube 2], [Clube 1 Estado] AS ESTADO FROM Campeonato
WHERE [Clube 1 Estado] = [Clube 2 Estado]
-------------------------------------------------------------------------

		/*CONFRONTOS REALIZADOS NO SABADO*/
SELECT * FROM Campeonato
WHERE DIA = 'SABADO'
-----------------------------------------------------------------------------------------------------------------------

		/*MEDIA DE GOLS POR TIME*/


SELECT CAMP2.[CLUBE 2] AS CLUBE,
AVG( (CONVERT(INT,CAMP2.[Clube 1 Gols])) + (CONVERT(INT,CAMP2.[Clube 2 Gols])) ) AS TOTAL
FROM Campeonato AS CAMP1
JOIN CAMPEONATO AS CAMP2
ON CAMP1.[CLUBE 1] = CAMP2.[CLUBE 2]
GROUP BY CAMP2.[CLUBE 2] ORDER BY CAMP2.[CLUBE 2] 

------------------------------------------------------------------------

	/*EMPATES DE TIMES DO MESMO ESTADO.*/

	SELECT [Clube 1], [Clube 2], COUNT([Estado Clube Vencedor]) AS EMPATE
	FROM Campeonato WHERE [Estado Clube Vencedor] = 'EMPATE' AND [Clube 1 Estado] = [Clube 2 Estado]
	GROUP BY [CLUBE 1], [CLUBE 2]
----------------------------------------------------------------------------------------------------------

	/*VITORIAS COM 2 GOLS OU MAIS*/

	SELECT [Clube 1], [Clube 2], CONVERT(INT,[CLUBE 1 GOLS]) AS 'CLUBE 1', CONVERT(INT,[Clube 2 Gols]) AS 'CLUBE 2' FROM Campeonato
	WHERE [Clube 1 Gols] > 2 OR [Clube 2 Gols] > 2

-----------------------------------------------------------------------------------------------------------------------------------

	/*CLUBES QUE JOGARAM NA RODADA 1 NO ANO DE 2000*/

	SELECT * FROM Campeonato
	WHERE Rodada = '1ª Rodada' AND DATA LIKE '2000%'
-----------------------------------------------------------
	/*SOMATORIA DE GOLS FEITOS EM ESTADIO*/

	SELECT Arena ,SUM(CONVERT(INT,[CLUBE 1 GOLS]) + (CONVERT(INT,[CLUBE 2 GOLS]))) AS GOL2  FROM Campeonato
	GROUP BY Arena
-----------------------------------------------------------------------------------------------------------------------