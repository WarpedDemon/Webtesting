USE [master]
GO

ALTER DATABASE [vet_data] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vet_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vet_data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vet_data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vet_data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vet_data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vet_data] SET ARITHABORT OFF 
GO
ALTER DATABASE [vet_data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [vet_data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vet_data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vet_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vet_data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vet_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vet_data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vet_data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vet_data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vet_data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [vet_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vet_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vet_data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vet_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vet_data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vet_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vet_data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vet_data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vet_data] SET  MULTI_USER 
GO
ALTER DATABASE [vet_data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vet_data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vet_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vet_data] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [vet_data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vet_data] SET QUERY_STORE = OFF
GO
USE [vet_data]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [vet_data]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Vet_ID] [smallint] NOT NULL,
	[Pet_ID] [smallint] NOT NULL,
	[payment] [money] NULL,
	[paid] [bit] NULL,
	[Appointment_Date] [date] NOT NULL,
	[Appointment_Time] [time](7) NOT NULL,
	[Vet_Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appointment_Medication]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Medication](
	[Appointment_ID] [smallint] NOT NULL,
	[Medication_ID] [smallint] NOT NULL,
	[Quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_Appointment_Medication] PRIMARY KEY CLUSTERED 
(
	[Appointment_ID] ASC,
	[Medication_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[inventory]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[Medication_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Quantity] [varchar](50) NOT NULL,
	[Cost] [money] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED 
(
	[Medication_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[Pet_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Pet_OwnerID] [smallint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Dob] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NULL,
	[Breed] [nvarchar](50) NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[Pet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet_Owner]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet_Owner](
	[Pet_OwnerID] [smallint] IDENTITY(1,1) NOT NULL,
	[First] [varchar](50) NOT NULL,
	[Last] [varchar](50) NOT NULL,
	[Mobile_No] [varchar](50) NULL,
	[Email_Address] [varchar](50) NULL,
	[ID_checked] [bit] NULL,
	[Licence_No] [varchar](8) NULL,
	[Medicare_No] [varchar](10) NULL,
	[Utility_bill] [varchar](10) NULL,
	[Street_Address] [varchar](50) NULL,
	[Postcode] [varchar](10) NULL,
 CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED 
(
	[Pet_OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vet]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet](
	[Vet_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Last_Name] [varchar](50) NOT NULL,
	[Mobile_no] [varchar](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[Street_Address] [varchar](50) NULL,
	[Postcode] [smallint] NULL,
	[Skills] [varchar](50) NULL,
 CONSTRAINT [PK_Vet] PRIMARY KEY CLUSTERED 
(
	[Vet_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vet_Availability]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vet_Availability](
	[Vet_ID] [smallint] NOT NULL,
	[MONTH] [nvarchar](50) NOT NULL,
	[WEEK_BEGINNING] [int] NOT NULL,
	[DAYS] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (2, 1, 13, 75.0000, 1, CAST(N'2016-03-03' AS Date), CAST(N'09:00:00' AS Time), N'Antibiotic given')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (3, 2, 15, 70.0000, 1, CAST(N'2016-03-06' AS Date), CAST(N'11:00:00' AS Time), N'Disenfected foot and bandaged')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (4, 1, 17, 0.0000, 0, CAST(N'2016-03-11' AS Date), CAST(N'10:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (5, 2, 18, 78.0000, 1, CAST(N'2016-03-12' AS Date), CAST(N'14:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (6, 2, 14, 0.0000, 0, CAST(N'2016-04-11' AS Date), CAST(N'09:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (7, 1, 16, 0.0000, 0, CAST(N'2016-03-29' AS Date), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (9, 1, 14, 0.0000, 1, CAST(N'2016-06-30' AS Date), CAST(N'16:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (10, 1, 14, 90.0000, 1, CAST(N'2016-08-31' AS Date), CAST(N'12:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (11, 6, 18, 60.0000, 1, CAST(N'2016-12-27' AS Date), CAST(N'13:45:00' AS Time), N'Minor surgery, day procedure')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (12, 2, 13, 0.0000, 0, CAST(N'2016-04-25' AS Date), CAST(N'09:30:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (13, 6, 19, 0.0000, 1, CAST(N'2017-11-20' AS Date), CAST(N'16:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (14, 5, 16, 0.0000, 0, CAST(N'2016-12-31' AS Date), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (15, 2, 13, 0.0000, 1, CAST(N'2016-06-29' AS Date), CAST(N'10:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (113, 5, 14, 0.0000, 0, CAST(N'2016-12-31' AS Date), CAST(N'00:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (117, 2, 17, NULL, 0, CAST(N'2017-11-18' AS Date), CAST(N'10:30:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (119, 6, 21, NULL, 0, CAST(N'2017-11-20' AS Date), CAST(N'07:45:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (120, 5, 13, NULL, 0, CAST(N'2017-11-22' AS Date), CAST(N'07:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (126, 5, 15, NULL, 0, CAST(N'2017-11-25' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (127, 2, 17, NULL, 0, CAST(N'2017-11-28' AS Date), CAST(N'13:45:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (128, 6, 21, NULL, 0, CAST(N'2017-11-29' AS Date), CAST(N'11:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (129, 5, 15, NULL, 0, CAST(N'2017-11-30' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (130, 5, 15, NULL, 0, CAST(N'2017-11-30' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (131, 2, 16, NULL, 0, CAST(N'2017-12-01' AS Date), CAST(N'10:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (132, 2, 16, NULL, 0, CAST(N'2017-12-01' AS Date), CAST(N'10:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (133, 2, 16, NULL, 0, CAST(N'2017-12-01' AS Date), CAST(N'10:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (134, 2, 16, NULL, 0, CAST(N'2017-12-01' AS Date), CAST(N'10:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (135, 5, 15, NULL, 0, CAST(N'2017-12-04' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (136, 6, 15, NULL, 0, CAST(N'2017-12-04' AS Date), CAST(N'06:30:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (137, 1, 14, NULL, 0, CAST(N'2017-12-04' AS Date), CAST(N'06:45:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (138, 5, 15, NULL, 0, CAST(N'2017-11-22' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (139, 1, 14, NULL, 0, CAST(N'2017-11-23' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (140, 5, 15, NULL, 0, CAST(N'2017-11-22' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (141, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (142, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (143, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (144, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (145, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (146, 5, 15, 0.0000, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (147, 5, 15, NULL, 0, CAST(N'2017-12-07' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (148, 5, 15, NULL, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:00:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (149, 5, 15, NULL, 0, CAST(N'2017-07-12' AS Date), CAST(N'06:30:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (150, 5, 15, 0.0000, 0, CAST(N'2017-08-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (151, 5, 15, 0.0000, 0, CAST(N'2017-08-12' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (152, 5, 15, 0.0000, 0, CAST(N'2017-12-08' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (153, 1, 14, 0.0000, 0, CAST(N'2017-12-09' AS Date), CAST(N'11:30:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (154, 5, 15, 0.0000, 0, CAST(N'2017-12-11' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (155, 5, 15, 0.0000, 0, CAST(N'2017-12-11' AS Date), CAST(N'06:00:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (156, 1, 14, 0.0000, 0, CAST(N'2017-12-12' AS Date), CAST(N'09:45:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (157, 1, 14, 0.0000, 0, CAST(N'2017-12-12' AS Date), CAST(N'12:45:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (158, 5, 15, 0.0000, 0, CAST(N'2017-12-13' AS Date), CAST(N'10:45:00' AS Time), N'')
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (159, 6, 21, 0.0000, 0, CAST(N'2017-12-14' AS Date), CAST(N'07:15:00' AS Time), NULL)
INSERT [dbo].[Appointment] ([Appointment_ID], [Vet_ID], [Pet_ID], [payment], [paid], [Appointment_Date], [Appointment_Time], [Vet_Comments]) VALUES (160, 5, 14, 250.0000, 1, CAST(N'2017-12-14' AS Date), CAST(N'14:30:00' AS Time), NULL)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (2, 1, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (2, 2, 12)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (2, 3, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (2, 6, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (3, 2, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (4, 2, 2)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (5, 4, 2)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (6, 3, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (7, 5, 1)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (11, 7, 2)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (119, 1, 3)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (120, 7, 2)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (126, 1, 2)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (126, 7, 3)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (159, 27, 5)
INSERT [dbo].[Appointment_Medication] ([Appointment_ID], [Medication_ID], [Quantity]) VALUES (160, 1, 3)
SET IDENTITY_INSERT [dbo].[inventory] ON 

INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (1, N'Antibiotic X', N'2', 23.0000, 33.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (2, N'Antiseptic', N'1', 10.0000, 15.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (3, N'Gauze Bandages', N'100', 5.0000, 7.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (4, N'Tetanus shots', N'30', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (5, N'Distemper shots', N'30', 25.0000, 35.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (6, N'Panadol', N'94', 2.0000, 3.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (7, N'Antibiotic Y', N'2', 22.0000, 55.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (10, N'Ibuprofen', N'100', 10.0000, 25.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (12, N'Ibuprofen Z', N'150', 15.0000, 30.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (13, N'Ibuprofen A', N'200', 1.0000, 2.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (14, N'Ibuprofen X', N'200', 1.0000, 2.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (15, N'Paracetamol', N'600', 12.0000, 20.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (16, N'Paracetamol B', N'100', 5.0000, 6.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (17, N'Tetanus shots', N'40', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (18, N'Tetanus shots', N'40', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (19, N'Tetanus shots', N'40', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (20, N'Tetanus shots', N'50', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (21, N'Panadol 2', N'50', 5.0000, 7.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (22, N'Distemper shots', N'30', 25.0000, 35.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (23, N'Tetanus shots', N'100', 20.0000, 29.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (24, N'Panadol', N'50', 5.0000, 7.5000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (25, N'Ibuprofen 9', N'500', 20.0000, 30.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (26, N'Tetanus Z', N'150', 12.0000, 15.0000)
INSERT [dbo].[inventory] ([Medication_ID], [Name], [Quantity], [Cost], [Price]) VALUES (27, N'Antibiotic Z', N'45', 5.0000, 9.5000)
SET IDENTITY_INSERT [dbo].[inventory] OFF
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (13, 4, N'Sam', N'2013-10-07', N'Dog', N'Border Collie')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (14, 4, N'Fido', N'2013-12-24', N'Dog', N'Border Collie')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (15, 3, N'Fido', N'2013-10-07', N'Dog', N'Border Collie')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (16, 36, N'Tiger', N'2011-11-30', N'Dog', N'Irish Setter')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (17, 35, N'Speedster', N'2009-03-17', N'Cat', N'Tabby')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (18, 36, N'Lion', N'2017-07-17', N'Dog', N'Border Collie')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (19, 36, N'Leopard', N'2015-11-09', N'Horse', N'Thoroughbred')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (20, 36, N'Dino', N'2017-11-12', N'Dinosaur', N'Purple')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (21, 1, N'Dino', N'2017-11-07', N'Dinosaur', N'Purple')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (22, 7, N'Dino', N'2017-11-08', N'Dog', N'Irish Setter')
INSERT [dbo].[Pet] ([Pet_ID], [Pet_OwnerID], [Name], [Dob], [type], [Breed]) VALUES (26, 39, N'Lion', N'2012-07-24', N'Dog', N'Dingo')
SET IDENTITY_INSERT [dbo].[Pet] OFF
SET IDENTITY_INSERT [dbo].[Pet_Owner] ON 

INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (1, N'Fred', N'Wilson', N'0402245145', N'fred_wilson@example.com', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (2, N'Fred', N'Smith', N'0402245145', N'fred_smith@gmail.com', 1, N'554564', N'2316561156', N'8888', N'92 Smyth St, Joondalup', N'6047')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (3, N'Fred', N'brown', N'0402245145', N'fred_brown@example.com', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (4, N'Jeff', N'wilson', N'0402879445', N'jeff_wilson@example.com', 1, NULL, N'8848', NULL, N'639 General St', N'6088')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (5, N'Wilma', N'Wilson', N'0402812795', N'wilma_wilson@example.com', 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (6, N'rick', N'hope', N'0402983547', N'rick_hope@example.com', 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (7, N'jeff', N'hicks', N'0402654875', N'jeff_hicks@example.com', 1, N'12365', N'9876', N'545', N'45 Sturt Way', N'6001')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (8, N'Vannessa', N'Hickman', N'0402568748', N'vannessa_hickman@example.com', 1, NULL, NULL, NULL, NULL, N'6035')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (35, N'Peter', N'Brock', N'11111', N'pbrockie@gmail.com', 1, N'22222', N'33333', N'44444', N'5 Conrod St, Bathurst', N'2023')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (36, N'Matthew', N'Richardson', N'111', N'richo@gmail.com', 1, N'222', N'333', N'444', N'12 Punt Rd, Richmond', N'2333')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (37, N'Marc', N'Marquez', N'111', N'm_marquez@bigpond.com.au', 0, N'222', N'333', N'444', N'93 Gardner St, Lukey Heights', N'2045')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (38, N'Polly', N'Farmer', N'0409867321', N'graham@hotmail.com', 1, N'789', N'654', N'123', N'5 Geelong Way', N'2145')
INSERT [dbo].[Pet_Owner] ([Pet_OwnerID], [First], [Last], [Mobile_No], [Email_Address], [ID_checked], [Licence_No], [Medicare_No], [Utility_bill], [Street_Address], [Postcode]) VALUES (39, N'Jimmy', N'Johnson', N'0402245145', N'jj@hotmail.com', 1, NULL, N'12365', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pet_Owner] OFF
SET IDENTITY_INSERT [dbo].[Vet] ON 

INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (1, N'Peter', N'Brock', N'0419648265', N'brockie@hdt.com.au', N'5 Conrod St, Bathurst', 3002, N'Horsepower')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (2, N'Ryan', N'Renolds', N'0412457856', N'ryan_reynolds@example.com', N'2 fake street', 6002, N'Cats and dogs')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (5, N'Garth', N'Tander', N'0417852963', N'g_tander@grm.com.au', N'2 Skyline Way, Bathurst', 3001, N'Dogs')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (6, N'James', N'Smith', N'0402851742', N'jsmith@gmail.com', N'34 Somerset St, Vic. Park', 6045, N'Galahs')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (7, N'John', N'Smith', N'0407258963', N'smithie@iinet.net.au', N'98 Smithsonian St', 6541, N'Fish, frogs, reptiles')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (8, N'Roger', N'Federer', N'0402654321', N'fedex@gmail.com', N'19 Titles Way', 6541, N'Surgery')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (9, N'Steve', N'Smith', N'0401236465', N'ssmith@iinet.net.au', N'12 MCG Way', 6452, N'Dogs')
INSERT [dbo].[Vet] ([Vet_ID], [First_Name], [Last_Name], [Mobile_no], [Email], [Street_Address], [Postcode], [Skills]) VALUES (10, N'Dale', N'Weightman', N'0402456987', N'dweightman@gmail.com', NULL, 6253, NULL)
SET IDENTITY_INSERT [dbo].[Vet] OFF
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (2, N'Nov', 1, N'Mon,Tue,Thu')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (1, N'December', 10, N'Mon,Thu')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (1, N'Oct', 20, N'Tue,Thu')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (1, N'Jan', 1, N'Mon,Wed,Fri')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (1, N'Mar', 1, N'Tue,Wed')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (1, N'Jan', 1, N'Mon,Tue,Wed,Thu,Fri')
INSERT [dbo].[Vet_Availability] ([Vet_ID], [MONTH], [WEEK_BEGINNING], [DAYS]) VALUES (10, N'Jan', 1, N'Mon,Sat')
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_payment]  DEFAULT ((0)) FOR [payment]
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_paid]  DEFAULT ((0)) FOR [paid]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_Pet] FOREIGN KEY([Pet_ID])
REFERENCES [dbo].[Pet] ([Pet_ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Appointment] NOCHECK CONSTRAINT [FK_Appointment_Pet]
GO
ALTER TABLE [dbo].[Appointment]  WITH NOCHECK ADD  CONSTRAINT [FK_Appointment_Vet] FOREIGN KEY([Vet_ID])
REFERENCES [dbo].[Vet] ([Vet_ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Appointment] NOCHECK CONSTRAINT [FK_Appointment_Vet]
GO
ALTER TABLE [dbo].[Appointment_Medication]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Medication_Appointment] FOREIGN KEY([Appointment_ID])
REFERENCES [dbo].[Appointment] ([Appointment_ID])
GO
ALTER TABLE [dbo].[Appointment_Medication] CHECK CONSTRAINT [FK_Appointment_Medication_Appointment]
GO
ALTER TABLE [dbo].[Appointment_Medication]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Medication_inventory] FOREIGN KEY([Medication_ID])
REFERENCES [dbo].[inventory] ([Medication_ID])
GO
ALTER TABLE [dbo].[Appointment_Medication] CHECK CONSTRAINT [FK_Appointment_Medication_inventory]
GO
ALTER TABLE [dbo].[Pet]  WITH NOCHECK ADD  CONSTRAINT [FK_Pet_Pet_Owner] FOREIGN KEY([Pet_OwnerID])
REFERENCES [dbo].[Pet_Owner] ([Pet_OwnerID])
GO
ALTER TABLE [dbo].[Pet] NOCHECK CONSTRAINT [FK_Pet_Pet_Owner]
GO
ALTER TABLE [dbo].[Vet_Availability]  WITH NOCHECK ADD  CONSTRAINT [FK_Vet_Availability_Vet] FOREIGN KEY([Vet_ID])
REFERENCES [dbo].[Vet] ([Vet_ID])
GO
ALTER TABLE [dbo].[Vet_Availability] NOCHECK CONSTRAINT [FK_Vet_Availability_Vet]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAppointment]    Script Date: 26-Nov-17 5:35:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAppointment]
	@Vet_ID int, 
	@Pet_ID int, 
	@Payment money = null, 
	@Paid bit, 
	@Appointment_Date date, 
	@Appointment_Time time, 
	@Vet_Comments nvarchar = null,
	@New_ID int OUTPUT
AS
	INSERT INTO Appointment (Vet_ID, Pet_ID, Payment, Paid, 
				 			 Appointment_Date, Appointment_Time, 
							 Vet_Comments) 
	VALUES (@Vet_ID, @Pet_ID, @Payment, @Paid, 
			CONVERT(VARCHAR, CONVERT(Date, @Appointment_Date, 103)), 
			@Appointment_Time, @Vet_Comments)
	
	SELECT @New_ID = @@IDENTITY
	RETURN (1)

GO
USE [master]
GO
ALTER DATABASE [vet_data] SET  READ_WRITE 
GO
