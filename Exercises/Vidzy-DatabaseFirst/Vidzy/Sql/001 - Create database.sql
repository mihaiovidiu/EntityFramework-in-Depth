USE [master]
GO
/****** Object:  Database [Vidzy]    Script Date: 10/11/2015 12:37:26 PM ******/

USE [Vidzy]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 10/11/2015 12:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [tinyint] NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoGenres]    Script Date: 10/11/2015 12:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoGenres](
	[VideoId] [int] NOT NULL,
	[GenreId] [tinyint] NOT NULL,
 CONSTRAINT [PK_VideoGenres] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Videos]    Script Date: 10/11/2015 12:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[VideoGenres]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoGenres] CHECK CONSTRAINT [FK_VideoGenres_Genres]
GO
ALTER TABLE [dbo].[VideoGenres]  WITH CHECK ADD  CONSTRAINT [FK_VideoGenres_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VideoGenres] CHECK CONSTRAINT [FK_VideoGenres_Videos]
GO
/****** Object:  StoredProcedure [dbo].[spAddVideo]    Script Date: 10/11/2015 12:37:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddVideo]
(
	@Name varchar(255),
	@ReleaseDate datetime,
	@Genre varchar(255)
)
AS

	DECLARE @GenreId tinyint
	SET @GenreId = (SELECT Id FROM Genres WHERE Name = @Genre)

	INSERT INTO Videos (Name, ReleaseDate)
	VALUES (@Name, @ReleaseDate)

	DECLARE @VideoId int
	SET @VideoId = SCOPE_IDENTITY()

	INSERT INTO VideoGenres (VideoId, GenreId)
	VALUES (@VideoId, @GenreId)

GO
INSERT INTO Genres (Id, Name)
VALUES 
	(1, 'Comedy'), 
	(2, 'Action'), 
	(3, 'Horror'), 
	(4, 'Thriller'), 
	(5, 'Family'), 
	(6, 'Romance')