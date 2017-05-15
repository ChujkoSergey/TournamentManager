USE TournamentMangerDB
GO

--Replace "e:\Study\EPAM\TournamentManager\TournamentManager.Image\" on path to folder TournamentManager.Image
INSERT INTO Game(Name, GameImage)
VALUES
('Volleyball',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Volleyball.jpg', Single_Blob) as image)),
('Mortal Kombat XL',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Mortal Kombat XL.jpg', Single_Blob) as image)),
('Dota 2',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Dota 2.jpg', Single_Blob) as image)),
('Counter-Strike: Global Offensive',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Counter-Strike Global Offensive.jpg', Single_Blob) as image)),
('Hearthstone',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Hearthstone.jpg', Single_Blob) as image)),
('Football',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Football.jpg', Single_Blob) as image)),
('Table football',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Table football.jpg', Single_Blob) as image)),
('Beer Pong',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Beer Pong.jpg', Single_Blob) as image)),
('Quake 3 Arena',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Quake 3 Arena.jpg', Single_Blob) as image)),
('Tekken 6',(SELECT BulkColumn FROM Openrowset( Bulk 'e:\Study\EPAM\TournamentManager\TournamentManager.Image\Tekken 6.jpg', Single_Blob) as image))
GO

DECLARE @COUNT INTEGER
SET @COUNT = 1
WHILE(@COUNT < 101)
BEGIN
	INSERT INTO [User](Nickname, Password)
	VALUES
	('user' + CONVERT(varchar, @count), 'pass' + CONVERT(varchar, @count))
	SET @COUNT += 1
END

INSERT INTO Tournament(AdministartorId, EventDate, GameId, MaxNumberOfMembers, Title)
VALUES
(1, DATEADD(MINUTE, 5, SYSDATETIME()), CONVERT(int, FLOOR(RAND() * 1000))%10 + 1, 32, 'Test tournament 1'),
(1, DATEADD(MINUTE, 5, SYSDATETIME()), CONVERT(int, FLOOR(RAND() * 1000))%10 + 1, 32, 'Test tournament 2')

INSERT INTO Members(MemberId, TournamentId)
SELECT TOP 32 Id, 1	FROM [User] WHERE Id > 1

INSERT INTO Members(MemberId, TournamentId)
SELECT TOP 32 Id, 2	FROM [User] ORDER BY Id DESC


--SELECT * FROM Tournament

--SELECT TOP 10 * FROM Members

--SELECT TOP 10 *
--FROM [User]

--SELECT * FROM Game