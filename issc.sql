USE [master]
GO
/****** Object:  Database [ShoppingOnline]    Script Date: 2/26/2022 10:19:25 AM ******/
CREATE DATABASE [ShoppingOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShoppingOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoppingOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoppingOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoppingOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingOnline', N'ON'
GO
ALTER DATABASE [ShoppingOnline] SET QUERY_STORE = OFF
GO
USE [ShoppingOnline]
GO
/****** Object:  Table [dbo].[account]    Script Date: 2/26/2022 10:19:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NULL,
	[displayName] [nvarchar](100) NULL,
	[address] [nvarchar](200) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[role_id] [int] NULL,
	[status] [int] NULL,
	[create_date] [date] NULL,
	[active_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](200) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[image_url] [nvarchar](50) NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](100) NULL,
	[shipping_id] [int] NULL,
	[create_date] [date] NULL,
	[total_price] [float] NULL,
	[note] [nvarchar](2000) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](200) NULL,
	[product_price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[product_image] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[code] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[description] [nvarchar](2000) NULL,
	[image] [nvarchar](100) NULL,
	[create_date] [date] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__product__3213E83FE0F71A36] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 2/26/2022 10:19:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](200) NULL,
 CONSTRAINT [PK__Shipping__3213E83F52ED128F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'admin12', N'1234', N'Nguyá»n Thá» BÃ­ch Thá»§y', N'2/108C, ÄÆ°á»ng áº¤p ÄÃ¬nh 4,áº¤p ÄÃ¬nh , XÃ£ TÃ¢n XuÃ¢n', N'lionvs12345@gmail.com', N'0906129926', 1, 1, CAST(N'2022-02-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'kiet', N'12345', N'Tuan Kiet', N'2/108C, ÄÆ°á»ng áº¤p ÄÃ¬nh 4,áº¤p ÄÃ¬nh , XÃ£ TÃ¢n XuÃ¢n', NULL, NULL, 1, 1, CAST(N'2021-05-04' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'minh', N'123', N'Nhat Minh', N'Thanh Hoa', N'minh@gmail.com', N'0123456789', 2, 1, CAST(N'2020-10-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'nghia', N'123', N'Minh Nghia', N'Thanh Hoa', N'nghia@gmail.com', N'0987654321', 2, 1, CAST(N'2020-10-25' AS Date), NULL)
INSERT [dbo].[account] ([userName], [password], [displayName], [address], [email], [phone], [role_id], [status], [create_date], [active_code]) VALUES (N'quan', N'123', N'Hong Quan', N'Thanh Hoa', N'quan@gmail.com', N'0866823499', 2, 1, CAST(N'2020-10-25' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category], [status]) VALUES (1, N'Tools', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (2, N'Measuament', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (3, N'HomeGarden', 1)
INSERT [dbo].[category] ([id], [category], [status]) VALUES (4, N'Improvement', 1)
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[image] ON 

INSERT [dbo].[image] ([id], [productId], [image_url]) VALUES (1, 1, N'1_1.jpg')
INSERT [dbo].[image] ([id], [productId], [image_url]) VALUES (2, 1, N'1_2.jpg')
INSERT [dbo].[image] ([id], [productId], [image_url]) VALUES (3, 1, N'1_3.jpg')
INSERT [dbo].[image] ([id], [productId], [image_url]) VALUES (4, 1, N'1_4.jpg')
SET IDENTITY_INSERT [dbo].[image] OFF
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([id], [Customer], [shipping_id], [create_date], [total_price], [note], [status]) VALUES (1, N'kiet', 1, CAST(N'2021-05-07' AS Date), 175, N'be careful', 1)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[order_detail] ON 

INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (1, 1, 1, N'product1', CAST(15 AS Decimal(18, 0)), 3, N'1.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (2, 1, 2, N'product2', CAST(19 AS Decimal(18, 0)), 2, N'2.jpg')
INSERT [dbo].[order_detail] ([id], [order_id], [product_id], [product_name], [product_price], [quantity], [product_image]) VALUES (3, 1, 3, N'product3', CAST(23 AS Decimal(18, 0)), 4, N'3.jpg')
SET IDENTITY_INSERT [dbo].[order_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (1, 1, N'SP001', N'product1', 20, 15, NULL, N'1.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (2, 1, N'SP002', N'product2', 3, 19, NULL, N'2.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (3, 3, N'SP003', N'product3', 4, 23, NULL, N'3.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (4, 4, N'SP004', N'product4', 3, 34, NULL, N'4.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (5, 2, N'SP005', N'product5', 65, 54, NULL, N'5.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (6, 1, N'SP006', N'product6', 54, 64, NULL, N'6.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (7, 2, N'SP007', N'product7', 34, 43, NULL, N'7.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (8, 3, N'SP008', N'product8', 98, 2, NULL, N'8.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (9, 4, N'SP009', N'product9', 20, 34, NULL, N'9.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (10, 2, N'SP0010', N'product10', 1, 56, NULL, N'10.jpg', CAST(N'2021-04-28' AS Date), 1)
INSERT [dbo].[product] ([id], [category_id], [code], [name], [quantity], [price], [description], [image], [create_date], [status]) VALUES (11, 3, N'SP0011', N'product11', 25, NULL, NULL, N'11.jpg', CAST(N'2021-04-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'Nguyá»n Thá» BÃ­ch Thá»§y', N'0906129926', N'2/108C, ÄÆ°á»ng áº¤p ÄÃ¬nh 4,áº¤p ÄÃ¬nh , XÃ£ TÃ¢n XuÃ¢n')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_Account_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [DF_order_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[product] ADD  CONSTRAINT [DF__product__create___145C0A3F]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([Customer])
REFERENCES [dbo].[account] ([userName])
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
USE [master]
GO
ALTER DATABASE [ShoppingOnline] SET  READ_WRITE 
GO
