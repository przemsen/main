USE master;
GO
CREATE TABLE [dbo].[Data] (
	[Id] int NOT NULL IDENTITY(1,1) PRIMARY KEY, 
	[Key] nvarchar(254) NOT NULL, 
	[Value] nvarchar(254)
) ON [PRIMARY]
GO
INSERT INTO [dbo].[Data] ([Key],[Value]) VALUES (N'aaaa',N'bbbbbb');
GO