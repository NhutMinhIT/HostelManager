USE [master]
GO
/****** Object:  Database [HostelDB]    Script Date: 07/01/2022 11:43:18 PM ******/
CREATE DATABASE [HostelDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostelDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HostelDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HostelDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostelDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostelDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostelDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostelDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostelDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostelDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostelDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostelDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostelDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostelDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostelDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostelDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HostelDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostelDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostelDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostelDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostelDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostelDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostelDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostelDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HostelDB] SET  MULTI_USER 
GO
ALTER DATABASE [HostelDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostelDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostelDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostelDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HostelDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HostelDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HostelDB', N'ON'
GO
ALTER DATABASE [HostelDB] SET QUERY_STORE = OFF
GO
USE [HostelDB]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [nvarchar](15) NOT NULL,
	[customer_id] [nvarchar](15) NOT NULL,
	[total] [decimal](15, 4) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[created] [date] NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[billd_id] [nvarchar](15) NOT NULL,
	[bill_id] [nvarchar](15) NOT NULL,
	[detail_id] [int] NOT NULL,
	[old_qty] [int] NULL,
	[qty] [int] NULL,
	[total] [decimal](15, 4) NULL,
	[description] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [nvarchar](5) NOT NULL,
	[city_name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[contract_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [nvarchar](15) NOT NULL,
	[room_id] [int] NOT NULL,
	[signed_date] [date] NULL,
	[due_date] [date] NULL,
	[status] [nvarchar](10) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [nvarchar](15) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[gender] [nvarchar](10) NULL,
	[dob] [date] NULL,
	[phone] [char](10) NULL,
	[status] [nvarchar](16) NULL,
	[address] [nvarchar](100) NULL,
	[ward_id] [nvarchar](5) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[district_id] [nvarchar](5) NOT NULL,
	[district_name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](30) NOT NULL,
	[city_id] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hostel]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hostel](
	[hostel_id] [int] IDENTITY(1,1) NOT NULL,
	[hostel_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NULL,
	[phone] [nchar](10) NULL,
	[status] [nvarchar](10) NULL,
	[user_id] [nvarchar](15) NULL,
	[ward_id] [nvarchar](5) NULL,
 CONSTRAINT [PK_Hostel] PRIMARY KEY CLUSTERED 
(
	[hostel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paypal]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paypal](
	[paypal_id] [nvarchar](50) NOT NULL,
	[total] [money] NULL,
	[status] [nvarchar](50) NULL,
	[created] [date] NULL,
	[bill_id] [nvarchar](15) NULL,
 CONSTRAINT [PK_Paypal] PRIMARY KEY CLUSTERED 
(
	[paypal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[hostel_id] [int] NOT NULL,
	[room_number] [int] NULL,
	[price] [money] NULL,
	[description] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceDetail]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[detail_name] [nvarchar](50) NULL,
	[calculation_unit] [nvarchar](25) NULL,
	[unit_price] [money] NULL,
	[updated_date] [date] NULL,
	[description] [nvarchar](200) NULL,
	[status] [nvarchar](15) NULL,
	[hostel_id] [int] NULL,
	[service_id] [int] NULL,
 CONSTRAINT [PK_ServiceHistory] PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[service_id] [int] IDENTITY(1,1) NOT NULL,
	[service_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[phone] [char](10) NULL,
	[status] [nvarchar](10) NULL,
	[Role] [nchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 07/01/2022 11:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[ward_id] [nvarchar](5) NOT NULL,
	[ward_name] [nvarchar](100) NULL,
	[type] [nvarchar](30) NULL,
	[district_id] [nvarchar](5) NULL,
 CONSTRAINT [PK_Ward] PRIMARY KEY CLUSTERED 
(
	[ward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[City] ([city_id], [city_name], [type]) VALUES (N'79', N'Thành phố Hồ Chí Minh', N'Thành phố trung ương')
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([contract_id], [customer_id], [room_id], [signed_date], [due_date], [status], [description]) VALUES (1, N'312456854', 1, CAST(N'2022-12-06' AS Date), CAST(N'2023-12-06' AS Date), N'ACTIVE    ', N'non')
INSERT [dbo].[Contract] ([contract_id], [customer_id], [room_id], [signed_date], [due_date], [status], [description]) VALUES (2, N'312469817', 4, CAST(N'2022-12-06' AS Date), CAST(N'2023-12-06' AS Date), N'ACTIVE    ', N'non')
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
INSERT [dbo].[Customer] ([customer_id], [password], [fullname], [email], [gender], [dob], [phone], [status], [address], [ward_id]) VALUES (N'312456854', NULL, N'Nguyễn Nhựt Minh', NULL, N'male      ', CAST(N'2001-01-29' AS Date), N'093373331 ', N'ACTIVE', N'số 233, tổ 7, khu 4, xã Trung An, TP.Mỹ Tho', NULL)
INSERT [dbo].[Customer] ([customer_id], [password], [fullname], [email], [gender], [dob], [phone], [status], [address], [ward_id]) VALUES (N'312469817', NULL, N'Trần Quang Hùng', NULL, N'male      ', CAST(N'2001-11-29' AS Date), N'0368770727', N'ACTIVE', N'Quận 9, TP.HCm', NULL)
GO
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'760', N'Quận 1', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'761', N'Quận 12', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'762', N'Quận Thủ Đức', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'763', N'Quận 9', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'764', N'Quận Gò Vấp', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'765', N'Quận Bình Thạnh', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'766', N'Quận Tân Bình', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'767', N'Quận Tân Phú', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'768', N'Quận Phú Nhuận', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'769', N'Quận 2', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'770', N'Quận 3', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'771', N'Quận 10', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'772', N'Quận 11', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'773', N'Quận 4', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'774', N'Quận 5', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'775', N'Quận 6', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'776', N'Quận 8', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'777', N'Quận Bình Tân', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'778', N'Quận 7', N'Quận', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'783', N'Huyện Củ Chi', N'Huyện', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'784', N'Huyện Hóc Môn', N'Huyện', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'785', N'Huyện Bình Chánh', N'Huyện', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'786', N'Huyện Nhà Bè', N'Huyện', N'79')
INSERT [dbo].[District] ([district_id], [district_name], [type], [city_id]) VALUES (N'787', N'Huyện Cần Giờ', N'Huyện', N'79')
GO
SET IDENTITY_INSERT [dbo].[Hostel] ON 

INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (1, N'Monn', N'23 Lê Văn Việt, Quận 9', N'023311112 ', N'ACTIVE', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (2, N'Hoos', N'22 Quận 2', N'046488822 ', N'ACTIVE', N'2', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (3, N'AIN', N'41 Quận 3', N'034747478 ', N'ACTIVE', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (1005, N'BAE', N'42 Quận 5', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (2005, N'Mfff', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (2006, N'Mfff', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (3005, N'Mfff', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (3006, N'g', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (3007, N'ffffffff', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
INSERT [dbo].[Hostel] ([hostel_id], [hostel_name], [address], [phone], [status], [user_id], [ward_id]) VALUES (4005, N'BAE', N', , , ', N'021412414 ', N'DISABLED', N'1', NULL)
SET IDENTITY_INSERT [dbo].[Hostel] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (1, 1, 1, 2300000.0000, NULL, N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2, 1, 2, 1600000.0000, NULL, N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (3, 2, 1, 2400000.0000, NULL, N'EMPTY')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (4, 3, 1, 4220000.0000, NULL, N'RENTING')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (6, 1, 4, 124444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (7, 1, 5, 22222222.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (1007, 1005, 2, 333.0000, N'', N'EMPTY')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (1008, 1005, 2, 333.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (1009, 3, 5, 2000000.0000, N'', N'EMPTY')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (1010, 1, 1, 343404.0000, N'', N'EMPTY')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2007, 3, 8, 333.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2008, 2006, 9, 12444444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2009, 2006, 9, 12444444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2010, 2006, 9, 12444444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2011, 2006, 9, 12444444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (2012, 2006, 9, 12444444.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (3007, 1, 6, 23232.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (3008, 1, 2, 2300000.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (3009, 1, 2, 88888.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (3010, 1, 9, 888888.0000, N'', N'DISABLED')
INSERT [dbo].[Room] ([room_id], [hostel_id], [room_number], [price], [description], [status]) VALUES (4007, 3, 9, 2000000.0000, N'', N'EMPTY')
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceDetail] ON 

INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (1, N'Điện', N'kWh', 1300.0000, CAST(N'2022-02-16' AS Date), NULL, N'ACTIVE', 1, 1)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (2, N'Nước', N'm3', 2400.0000, CAST(N'2021-02-02' AS Date), NULL, N'ACTIVE', 1, 2)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (3, N'Điện', N'kWh', 1200.0000, CAST(N'2021-02-22' AS Date), NULL, N'DISABLED', 1, 1)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (1004, N'Nước Sinh hoạt', N'm3', 4000.0000, CAST(N'2021-02-23' AS Date), NULL, N'ACTIVE', 3, 2)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (3004, N'Internet', N'm3', 3.0000, CAST(N'2022-06-18' AS Date), N'', N'DELETE', 1, 2)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (4004, N'Internet', N'', 12.0000, CAST(N'2022-06-11' AS Date), N'', N'DELETE', 3, 3)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (5004, N'Internet', N'', 5000.0000, CAST(N'2022-06-30' AS Date), N'', N'ACTIVE', 1, 3)
INSERT [dbo].[ServiceDetail] ([detail_id], [detail_name], [calculation_unit], [unit_price], [updated_date], [description], [status], [hostel_id], [service_id]) VALUES (6004, N'yyy', N'kWh', 5000.0000, CAST(N'2022-06-14' AS Date), N'', N'DELETE', 1, 1)
SET IDENTITY_INSERT [dbo].[ServiceDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([service_id], [service_name]) VALUES (1, N'Điện')
INSERT [dbo].[ServiceType] ([service_id], [service_name]) VALUES (2, N'Nước')
INSERT [dbo].[ServiceType] ([service_id], [service_name]) VALUES (3, N'Internet')
INSERT [dbo].[ServiceType] ([service_id], [service_name]) VALUES (4, N'Khác')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
GO
INSERT [dbo].[User] ([user_id], [password], [email], [fullname], [phone], [status], [Role]) VALUES (1, N'hung', N'hungtqse150272@fpt.edu.vn', N'Trần Quang Hùng', N'021412414 ', N'APPROVED  ', N'US')
INSERT [dbo].[User] ([user_id], [password], [email], [fullname], [phone], [status], [Role]) VALUES (2, N'hung', N'hung@gmail.com', NULL, NULL, N'REJECTED  ', N'US')
GO
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26734', N'Phường Tân Định', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26737', N'Phường Đa Kao', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26740', N'Phường Bến Nghé', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26743', N'Phường Bến Thành', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26746', N'Phường Nguyễn Thái Bình', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26749', N'Phường Phạm Ngũ Lão', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26752', N'Phường Cầu Ông Lãnh', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26755', N'Phường Cô Giang', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26758', N'Phường Nguyễn Cư Trinh', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26761', N'Phường Cầu Kho', N'Phường', N'760')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26764', N'Phường Thạnh Xuân', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26767', N'Phường Thạnh Lộc', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26770', N'Phường Hiệp Thành', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26773', N'Phường Thới An', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26776', N'Phường Tân Chánh Hiệp', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26779', N'Phường An Phú Đông', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26782', N'Phường Tân Thới Hiệp', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26785', N'Phường Trung Mỹ Tây', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26787', N'Phường Tân Hưng Thuận', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26788', N'Phường Đông Hưng Thuận', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26791', N'Phường Tân Thới Nhất', N'Phường', N'761')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26794', N'Phường Linh Xuân', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26797', N'Phường Bình Chiểu', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26800', N'Phường Linh Trung', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26803', N'Phường Tam Bình', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26806', N'Phường Tam Phú', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26809', N'Phường Hiệp Bình Phước', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26812', N'Phường Hiệp Bình Chánh', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26815', N'Phường Linh Chiểu', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26818', N'Phường Linh Tây', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26821', N'Phường Linh Đông', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26824', N'Phường Bình Thọ', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26827', N'Phường Trường Thọ', N'Phường', N'762')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26830', N'Phường Long Bình', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26833', N'Phường Long Thạnh Mỹ', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26836', N'Phường Tân Phú', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26839', N'Phường Hiệp Phú', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26842', N'Phường Tăng Nhơn Phú A', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26845', N'Phường Tăng Nhơn Phú B', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26848', N'Phường Phước Long B', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26851', N'Phường Phước Long A', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26854', N'Phường Trường Thạnh', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26857', N'Phường Long Phước', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26860', N'Phường Long Trường', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26863', N'Phường Phước Bình', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26866', N'Phường Phú Hữu', N'Phường', N'763')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26869', N'Phường 15', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26872', N'Phường 13', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26875', N'Phường 17', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26876', N'Phường 6', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26878', N'Phường 16', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26881', N'Phường 12', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26882', N'Phường 14', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26884', N'Phường 10', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26887', N'Phường 05', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26890', N'Phường 07', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26893', N'Phường 04', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26896', N'Phường 01', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26897', N'Phường 9', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26898', N'Phường 8', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26899', N'Phường 11', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26902', N'Phường 03', N'Phường', N'764')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26905', N'Phường 13', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26908', N'Phường 11', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26911', N'Phường 27', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26914', N'Phường 26', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26917', N'Phường 12', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26920', N'Phường 25', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26923', N'Phường 05', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26926', N'Phường 07', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26929', N'Phường 24', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26932', N'Phường 06', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26935', N'Phường 14', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26938', N'Phường 15', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26941', N'Phường 02', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26944', N'Phường 01', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26947', N'Phường 03', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26950', N'Phường 17', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26953', N'Phường 21', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26956', N'Phường 22', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26959', N'Phường 19', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26962', N'Phường 28', N'Phường', N'765')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26965', N'Phường 02', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26968', N'Phường 04', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26971', N'Phường 12', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26974', N'Phường 13', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26977', N'Phường 01', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26980', N'Phường 03', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26983', N'Phường 11', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26986', N'Phường 07', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26989', N'Phường 05', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26992', N'Phường 10', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26995', N'Phường 06', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'26998', N'Phường 08', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27001', N'Phường 09', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27004', N'Phường 14', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27007', N'Phường 15', N'Phường', N'766')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27010', N'Phường Tân Sơn Nhì', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27013', N'Phường Tây Thạnh', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27016', N'Phường Sơn Kỳ', N'Phường', N'767')
GO
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27019', N'Phường Tân Quý', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27022', N'Phường Tân Thành', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27025', N'Phường Phú Thọ Hòa', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27028', N'Phường Phú Thạnh', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27031', N'Phường Phú Trung', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27034', N'Phường Hòa Thạnh', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27037', N'Phường Hiệp Tân', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27040', N'Phường Tân Thới Hòa', N'Phường', N'767')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27043', N'Phường 04', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27046', N'Phường 05', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27049', N'Phường 09', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27052', N'Phường 07', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27055', N'Phường 03', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27058', N'Phường 01', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27061', N'Phường 02', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27064', N'Phường 08', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27067', N'Phường 15', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27070', N'Phường 10', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27073', N'Phường 11', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27076', N'Phường 17', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27079', N'Phường 14', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27082', N'Phường 12', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27085', N'Phường 13', N'Phường', N'768')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27088', N'Phường Thảo Điền', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27091', N'Phường An Phú', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27094', N'Phường Bình An', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27097', N'Phường Bình Trưng Đông', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27100', N'Phường Bình Trưng Tây', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27103', N'Phường Bình Khánh', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27106', N'Phường An Khánh', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27109', N'Phường Cát Lái', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27112', N'Phường Thạnh Mỹ Lợi', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27115', N'Phường An Lợi Đông', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27118', N'Phường Thủ Thiêm', N'Phường', N'769')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27121', N'Phường 08', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27124', N'Phường 07', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27127', N'Phường 14', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27130', N'Phường 12', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27133', N'Phường 11', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27136', N'Phường 13', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27139', N'Phường 06', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27142', N'Phường 09', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27145', N'Phường 10', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27148', N'Phường 04', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27151', N'Phường 05', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27154', N'Phường 03', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27157', N'Phường 02', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27160', N'Phường 01', N'Phường', N'770')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27163', N'Phường 15', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27166', N'Phường 13', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27169', N'Phường 14', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27172', N'Phường 12', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27175', N'Phường 11', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27178', N'Phường 10', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27181', N'Phường 09', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27184', N'Phường 01', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27187', N'Phường 08', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27190', N'Phường 02', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27193', N'Phường 04', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27196', N'Phường 07', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27199', N'Phường 05', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27202', N'Phường 06', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27205', N'Phường 03', N'Phường', N'771')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27208', N'Phường 15', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27211', N'Phường 05', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27214', N'Phường 14', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27217', N'Phường 11', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27220', N'Phường 03', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27223', N'Phường 10', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27226', N'Phường 13', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27229', N'Phường 08', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27232', N'Phường 09', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27235', N'Phường 12', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27238', N'Phường 07', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27241', N'Phường 06', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27244', N'Phường 04', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27247', N'Phường 01', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27250', N'Phường 02', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27253', N'Phường 16', N'Phường', N'772')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27256', N'Phường 12', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27259', N'Phường 13', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27262', N'Phường 09', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27265', N'Phường 06', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27268', N'Phường 08', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27271', N'Phường 10', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27274', N'Phường 05', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27277', N'Phường 18', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27280', N'Phường 14', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27283', N'Phường 04', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27286', N'Phường 03', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27289', N'Phường 16', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27292', N'Phường 02', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27295', N'Phường 15', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27298', N'Phường 01', N'Phường', N'773')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27301', N'Phường 04', N'Phường', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27304', N'Phường 09', N'Phường', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27307', N'Phường 03', N'Phường', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27310', N'Phường 12', N'Phường', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27313', N'Phường 02', N'Phường', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27316', N'Phường 08', N'Phường', N'774')
GO
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27319', N'Phường 15', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27322', N'Phường 07', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27325', N'Phường 01', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27328', N'Phường 11', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27331', N'Phường 14', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27334', N'Phường 05', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27337', N'Phường 06', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27340', N'Phường 10', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27343', N'Phường 13', N'Phường                        ', N'774')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27346', N'Phường 14', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27349', N'Phường 13', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27352', N'Phường 09', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27355', N'Phường 06', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27358', N'Phường 12', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27361', N'Phường 05', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27364', N'Phường 11', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27367', N'Phường 02', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27370', N'Phường 01', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27373', N'Phường 04', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27376', N'Phường 08', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27379', N'Phường 03', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27382', N'Phường 07', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27385', N'Phường 10', N'Phường                        ', N'775')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27388', N'Phường 08', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27391', N'Phường 02', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27394', N'Phường 01', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27397', N'Phường 03', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27400', N'Phường 11', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27403', N'Phường 09', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27406', N'Phường 10', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27409', N'Phường 04', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27412', N'Phường 13', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27415', N'Phường 12', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27418', N'Phường 05', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27421', N'Phường 14', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27424', N'Phường 06', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27427', N'Phường 15', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27430', N'Phường 16', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27433', N'Phường 07', N'Phường                        ', N'776')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27436', N'Phường Bình Hưng Hòa', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27439', N'Phường Bình Hưng Hoà A', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27442', N'Phường Bình Hưng Hoà B', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27445', N'Phường Bình Trị Đông', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27448', N'Phường Bình Trị Đông A', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27451', N'Phường Bình Trị Đông B', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27454', N'Phường Tân Tạo', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27457', N'Phường Tân Tạo A', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27460', N'Phường  An Lạc', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27463', N'Phường An Lạc A', N'Phường                        ', N'777')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27466', N'Phường Tân Thuận Đông', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27469', N'Phường Tân Thuận Tây', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27472', N'Phường Tân Kiểng', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27475', N'Phường Tân Hưng', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27478', N'Phường Bình Thuận', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27481', N'Phường Tân Quy', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27484', N'Phường Phú Thuận', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27487', N'Phường Tân Phú', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27490', N'Phường Tân Phong', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27493', N'Phường Phú Mỹ', N'Phường                        ', N'778')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27496', N'Thị trấn Củ Chi', N'Thị trấn                      ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27499', N'Xã Phú Mỹ Hưng', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27502', N'Xã An Phú', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27505', N'Xã Trung Lập Thượng', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27508', N'Xã An Nhơn Tây', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27511', N'Xã Nhuận Đức', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27514', N'Xã Phạm Văn Cội', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27517', N'Xã Phú Hòa Đông', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27520', N'Xã Trung Lập Hạ', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27523', N'Xã Trung An', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27526', N'Xã Phước Thạnh', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27529', N'Xã Phước Hiệp', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27532', N'Xã Tân An Hội', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27535', N'Xã Phước Vĩnh An', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27538', N'Xã Thái Mỹ', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27541', N'Xã Tân Thạnh Tây', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27544', N'Xã Hòa Phú', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27547', N'Xã Tân Thạnh Đông', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27550', N'Xã Bình Mỹ', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27553', N'Xã Tân Phú Trung', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27556', N'Xã Tân Thông Hội', N'Xã                            ', N'783')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27559', N'Thị trấn Hóc Môn', N'Thị trấn                      ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27562', N'Xã Tân Hiệp', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27565', N'Xã Nhị Bình', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27568', N'Xã Đông Thạnh', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27571', N'Xã Tân Thới Nhì', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27574', N'Xã Thới Tam Thôn', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27577', N'Xã Xuân Thới Sơn', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27580', N'Xã Tân Xuân', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27583', N'Xã Xuân Thới Đông', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27586', N'Xã Trung Chánh', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27589', N'Xã Xuân Thới Thượng', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27592', N'Xã Bà Điểm', N'Xã                            ', N'784')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27595', N'Thị trấn Tân Túc', N'Thị trấn                      ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27598', N'Xã Phạm Văn Hai', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27601', N'Xã Vĩnh Lộc A', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27604', N'Xã Vĩnh Lộc B', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27607', N'Xã Bình Lợi', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27610', N'Xã Lê Minh Xuân', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27613', N'Xã Tân Nhựt', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27616', N'Xã Tân Kiên', N'Xã                            ', N'785')
GO
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27619', N'Xã Bình Hưng', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27622', N'Xã Phong Phú', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27625', N'Xã An Phú Tây', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27628', N'Xã Hưng Long', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27631', N'Xã Đa Phước', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27634', N'Xã Tân Quý Tây', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27637', N'Xã Bình Chánh', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27640', N'Xã Quy Đức', N'Xã                            ', N'785')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27643', N'Thị trấn Nhà Bè', N'Thị trấn                      ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27646', N'Xã Phước Kiển', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27649', N'Xã Phước Lộc', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27652', N'Xã Nhơn Đức', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27655', N'Xã Phú Xuân', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27658', N'Xã Long Thới', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27661', N'Xã Hiệp Phước', N'Xã                            ', N'786')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27664', N'Thị trấn Cần Thạnh', N'Thị trấn                      ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27667', N'Xã Bình Khánh', N'Xã                            ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27670', N'Xã Tam Thôn Hiệp', N'Xã                            ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27673', N'Xã An Thới Đông', N'Xã                            ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27676', N'Xã Thạnh An', N'Xã                            ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27679', N'Xã Long Hòa', N'Xã                            ', N'787')
INSERT [dbo].[Ward] ([ward_id], [ward_name], [type], [district_id]) VALUES (N'27682', N'Xã Lý Nhơn', N'Xã                            ', N'787')
GO
/****** Object:  Index [IX_Room]    Script Date: 07/01/2022 11:43:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Room] ON [dbo].[Room]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Room_1]    Script Date: 07/01/2022 11:43:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_Room_1] ON [dbo].[Room]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_ServiceDetail] FOREIGN KEY([detail_id])
REFERENCES [dbo].[ServiceDetail] ([detail_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_ServiceDetail]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Customer]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Room1] FOREIGN KEY([room_id])
REFERENCES [dbo].[Room] ([room_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Room1]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Ward] FOREIGN KEY([ward_id])
REFERENCES [dbo].[Ward] ([ward_id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Ward]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_City1] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_City1]
GO
ALTER TABLE [dbo].[Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Hostel_Ward] FOREIGN KEY([ward_id])
REFERENCES [dbo].[Ward] ([ward_id])
GO
ALTER TABLE [dbo].[Hostel] CHECK CONSTRAINT [FK_Hostel_Ward]
GO
ALTER TABLE [dbo].[Paypal]  WITH CHECK ADD  CONSTRAINT [FK_Paypal_Bill] FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Paypal] CHECK CONSTRAINT [FK_Paypal_Bill]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Hostel] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Hostel]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetail_Hostel] FOREIGN KEY([hostel_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_ServiceDetail_Hostel]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetail_ServiceType] FOREIGN KEY([service_id])
REFERENCES [dbo].[ServiceType] ([service_id])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_ServiceDetail_ServiceType]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Hostel] FOREIGN KEY([user_id])
REFERENCES [dbo].[Hostel] ([hostel_id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Hostel]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_District] FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([district_id])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_District]
GO
USE [master]
GO
ALTER DATABASE [HostelDB] SET  READ_WRITE 
GO
