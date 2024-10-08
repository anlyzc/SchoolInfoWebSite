USE [master]
GO
/****** Object:  Database [School]    Script Date: 29.08.2024 09:27:39 ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [School] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [School] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [School] SET QUERY_STORE = OFF
GO
USE [School]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 29.08.2024 09:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[FacID] [int] IDENTITY(1,1) NOT NULL,
	[FacName] [nvarchar](50) NULL,
	[UniID] [int] NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[FacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 29.08.2024 09:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[MajorID] [int] IDENTITY(1,1) NOT NULL,
	[MajorName] [nvarchar](50) NULL,
	[FacID] [int] NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[MajorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Professor]    Script Date: 29.08.2024 09:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[ProfID] [int] IDENTITY(1,1) NOT NULL,
	[ProfName] [nvarchar](50) NULL,
	[MajorID] [int] NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[ProfID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 29.08.2024 09:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StuID] [int] IDENTITY(1,1) NOT NULL,
	[StuName] [nvarchar](50) NULL,
	[MajorID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[University]    Script Date: 29.08.2024 09:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[University](
	[UniID] [int] IDENTITY(1,1) NOT NULL,
	[UniName] [nvarchar](50) NULL,
 CONSTRAINT [PK_University] PRIMARY KEY CLUSTERED 
(
	[UniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (1, N'Engineering Faculty', 4)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (2, N'Business Administration Faculty', 1)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (3, N'Faculty of Political Science', 2)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (4, N'Medicine Faculty', 10)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (5, N'Law Faculty', 7)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (6, N'Education Faculty', 11)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (7, N'Faculty of pharmacy', 13)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (8, N'Faculty of communication', 8)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (9, N'Faculty of architecture ', 9)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (10, N'Faculty of arts ', 2)
INSERT [dbo].[Faculty] ([FacID], [FacName], [UniID]) VALUES (11, N'Faculty of dentistry  ', 6)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Major] ON 

INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (1, N'Political Science', 3)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (2, N'Machine Engineering', 1)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (3, N'Business Administration ', 2)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (4, N'Management Information Systems', 2)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (5, N'Computer Engineering', 1)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (6, N'Plane engineering', 1)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (7, N'Medicine', 4)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (8, N'Law', 5)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (10, N'History', 6)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (11, N'Dentistry ', 11)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (12, N'Architecture', 9)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (13, N'Civil Architechure', 9)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (14, N'Pharmacy', 7)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (15, N'English Language and Literature ', 10)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (16, N'Political Science and International Relationships', 3)
INSERT [dbo].[Major] ([MajorID], [MajorName], [FacID]) VALUES (17, N'Primary school teacher', 6)
SET IDENTITY_INSERT [dbo].[Major] OFF
GO
SET IDENTITY_INSERT [dbo].[Professor] ON 

INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (1, N'Gökhan Uçak', 5)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (2, N'Osman Büyük', 1)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (3, N'Zeynep Ulaşoğlu', 3)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (4, N'Feride Sevinç', 6)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (5, N'Tülay Erdem', 7)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (6, N'Mehmet Yaşar', 4)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (7, N'Ceyda Aksakal', 8)
INSERT [dbo].[Professor] ([ProfID], [ProfName], [MajorID]) VALUES (8, N'İlhami Öztürkoğlu', 2)
SET IDENTITY_INSERT [dbo].[Professor] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (1, N'Ahmet Koyun', 8)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (2, N'Zeki Çelik', 5)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (3, N'Taner Kaplan', 3)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (4, N'Sude Korucu', 7)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (5, N'Ayça Çokum', 8)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (6, N'Giray Ateş', 2)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (7, N'Ferit Yakupoğlu', 10)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (8, N'Aras Arabacı', 1)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (9, N'Ramiz Karaeski', 6)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (10, N'Ali Candan', 5)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (11, N'Deniz Çiçek', 2)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (12, N'Hilmi Büyük', 7)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (13, N'İsmail Saymaz', 1)
INSERT [dbo].[Student] ([StuID], [StuName], [MajorID]) VALUES (14, N'Anıl Yazıcı', 4)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[University] ON 

INSERT [dbo].[University] ([UniID], [UniName]) VALUES (1, N'Marmara University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (2, N'Istanbul University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (3, N'Ankara University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (4, N'Istanbul Technical University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (5, N'Middle East Technical University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (6, N'Ege University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (7, N'Boğaziçi University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (8, N'Gazi University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (9, N'Yıldız Technical University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (10, N'Koç University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (11, N'Bilkent University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (12, N'Galatasaray University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (13, N'Dokuz Eylül University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (14, N'Sabancı University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (15, N'Akdeniz University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (16, N'Çukurova University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (17, N'Atatürk University')
INSERT [dbo].[University] ([UniID], [UniName]) VALUES (18, N'Hacettepe University')
SET IDENTITY_INSERT [dbo].[University] OFF
GO
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
