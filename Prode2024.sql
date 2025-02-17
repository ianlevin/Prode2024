USE [master]
GO
/****** Object:  Database [Prode2024]    Script Date: 18/6/2024 22:59:47 ******/
CREATE DATABASE [Prode2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prode2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Prode2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prode2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Prode2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Prode2024] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prode2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prode2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prode2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prode2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prode2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prode2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prode2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prode2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prode2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prode2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prode2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prode2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prode2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prode2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prode2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prode2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prode2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prode2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prode2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prode2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prode2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prode2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prode2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prode2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Prode2024] SET  MULTI_USER 
GO
ALTER DATABASE [Prode2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prode2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prode2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prode2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prode2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prode2024] SET QUERY_STORE = OFF
GO
USE [Prode2024]
GO
/****** Object:  Table [dbo].[Apuesta]    Script Date: 18/6/2024 22:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NOT NULL,
	[idMatch] [int] NOT NULL,
	[winner] [int] NOT NULL,
 CONSTRAINT [PK_Apuesta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 18/6/2024 22:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[image] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 18/6/2024 22:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRival1] [int] NOT NULL,
	[idRival2] [int] NOT NULL,
	[date] [date] NOT NULL,
	[winner] [int] NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18/6/2024 22:59:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apuesta] ON 

INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (16, 2, 4, 1)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (17, 1, 3, 1)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (18, 1, 4, 3)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (19, 1, 5, 2)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (20, 1, 1, 2)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (21, 1, 6, 3)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (22, 1, 2, 1)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (1002, 1, 8, 1)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (1003, 3, 2, 2)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (1004, 4, 1, 3)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (1005, 4, 2, 2)
INSERT [dbo].[Apuesta] ([id], [idUser], [idMatch], [winner]) VALUES (1006, 4, 4, 1)
SET IDENTITY_INSERT [dbo].[Apuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([id], [name], [image]) VALUES (1, N'Argentina', N'/img/argentina.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (2, N'Peru', N'/img/peru.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (3, N'Chile', N'/img/chile.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (4, N'Canada', N'/img/canada.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (5, N'USA', N'/img/usa.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (6, N'Uruguay', N'/img/uruguay.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (7, N'Panama', N'/img/panama.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (8, N'Bolivia', N'/img/bolivia.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (9, N'Mexico', N'/img/mexico.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (10, N'Ecuador', N'/img/ecuador.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (11, N'Venezuela', N'/img/venezuela.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (12, N'Jamaica', N'/img/jamaica.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (13, N'Brasil', N'/img/brasil.jpg')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (14, N'Colombia', N'/img/colombia.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (15, N'Paraguay', N'/img/paraguay.png')
INSERT [dbo].[Country] ([id], [name], [image]) VALUES (16, N'Costa Rica', N'/img/costarica.png')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[Match] ON 

INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (1, 1, 2, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (2, 1, 3, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (3, 1, 4, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (4, 2, 3, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (5, 2, 4, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (6, 3, 4, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (8, 5, 6, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (9, 5, 7, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (10, 5, 8, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (11, 6, 7, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (12, 6, 8, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (14, 7, 8, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (15, 9, 10, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (16, 9, 11, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (17, 9, 12, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (18, 10, 11, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (19, 10, 12, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (20, 11, 12, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (21, 13, 14, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (23, 13, 15, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (24, 13, 16, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (25, 14, 15, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (26, 14, 16, CAST(N'2024-07-20' AS Date), NULL)
INSERT [dbo].[Match] ([id], [idRival1], [idRival2], [date], [winner]) VALUES (27, 15, 16, CAST(N'2024-07-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Match] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [username], [password]) VALUES (1, N'ian', N'hola')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
USE [master]
GO
ALTER DATABASE [Prode2024] SET  READ_WRITE 
GO
