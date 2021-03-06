USE [master]
GO
/****** Object:  Database [WSCDatabase]    Script Date: 8/24/2014 12:34:57 PM ******/
CREATE DATABASE [WSCDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WSCDatabaseSQL_dat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WSCDatabaseSQL.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WSCDatabaseSQL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WSCDatabaseSQL.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WSCDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WSCDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WSCDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WSCDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WSCDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WSCDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WSCDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [WSCDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WSCDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WSCDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WSCDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WSCDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WSCDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WSCDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WSCDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WSCDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WSCDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WSCDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WSCDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WSCDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WSCDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WSCDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WSCDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WSCDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WSCDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WSCDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [WSCDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WSCDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WSCDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WSCDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WSCDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WSCDatabase]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_FName] [nvarchar](255) NOT NULL,
	[C_LName] [nvarchar](255) NOT NULL,
	[C_Address] [nvarchar](255) NOT NULL,
	[C_City] [nvarchar](255) NOT NULL,
	[C_State] [nvarchar](255) NOT NULL,
	[C_ZIP] [nvarchar](255) NOT NULL,
	[C_Email] [nvarchar](255) NOT NULL,
	[C_Phone] [nvarchar](255) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EXT_ORDER]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXT_ORDER](
	[ExtOrderID] [int] IDENTITY(1,1) NOT NULL,
	[MediaCatNum] [int] NOT NULL,
	[VendorName] [nvarchar](255) NULL,
	[ETA] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MEDIA]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDIA](
	[MediaCatNum] [int] IDENTITY(1,1) NOT NULL,
	[MediaType] [nvarchar](255) NULL,
	[MediaQOH] [int] NULL,
	[ManufacturerName] [nvarchar](255) NULL,
	[MediaPrice] [money] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeID] [int] NOT NULL,
	[MediaCatNum] [int] NOT NULL,
	[C_ID] [int] NOT NULL,
	[UserID] [int] NULL,
	[OrderQuantity] [int] NOT NULL,
	[AmountDue] [money] NULL,
	[OrderPrice] [money] NULL,
	[ExtOrderID] [int] NULL,
	[IsValidated] [bit] NULL CONSTRAINT [DF_ORDER_IsValidated]  DEFAULT ((0)),
	[DepositAmount] [money] NULL,
	[Memo] [nvarchar](250) NULL,
	[InStock] [bit] NULL CONSTRAINT [DF_ORDER_InStock]  DEFAULT ((0)),
	[PulledFromStock] [bit] NULL CONSTRAINT [DF_ORDER_PulledFromStock]  DEFAULT ((0)),
	[OnOrder] [bit] NULL CONSTRAINT [DF_ORDER_OnOrder]  DEFAULT ((0)),
	[IsDelivered] [bit] NULL CONSTRAINT [DF_ORDER_IsDelivered]  DEFAULT ((0)),
	[IsComplete] [bit] NULL CONSTRAINT [DF_ORDER_IsComplete]  DEFAULT ((0)),
	[IsClosed] [bit] NULL CONSTRAINT [DF_ORDER_IsClosed]  DEFAULT ((0)),
	[OrderContent] [nvarchar](250) NULL,
	[IsSold] [bit] NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAYMENT_TYPE]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_TYPE](
	[PaymentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PAYMENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUALITY_CONTROL]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUALITY_CONTROL](
	[QualityControlID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsPassed] [bit] NOT NULL,
	[InspectionMemo] [nvarchar](1000) NULL,
 CONSTRAINT [PK_QUALITY_CONTROL] PRIMARY KEY CLUSTERED 
(
	[QualityControlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[UserName] [nvarchar](25) NOT NULL,
	[UserFName] [nvarchar](25) NULL,
	[UserLName] [nvarchar](25) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](250) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER_TYPE]    Script Date: 8/24/2014 12:34:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_TYPE](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [nvarchar](50) NOT NULL,
	[UserTypeDescription] [nvarchar](250) NULL,
 CONSTRAINT [PK_USER_TYPE] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1, N'John', N'Smith', N'204 Main Street', N'Millinocket', N'ME', N'04462', N'jsmith@gmail.com', N'207.501.2257')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (2, N'Jane', N'Doe', N'120 Main Street', N'Claremont', N'NH', N'03743', N'jdoe@yahoo.com', N'603.542.2214')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1004, N'Tom', N'Johnson', N'292 South Street', N'Philadelphia', N'PA', N'19148', N'tjohnson@geocities.com', N'215.468.4220')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1007, N'Chris', N'Jefferson', N'383 Main Street', N'New York', N'NY', N'25145', N'cjefferson@gmail.com', N'555.212.2205')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1008, N'Sarah', N'Connor', N'34 West Street', N'Portland', N'OR', N'51421', N's.connor@yahoo.com', N'555.645.1255')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1009, N'Tom', N'Sawyer', N'100 East 60th Street', N'Saratoga', N'NY', N'12554', N'tsawyer@gmail.com', N'518.224.6452')
INSERT [dbo].[CUSTOMER] ([C_ID], [C_FName], [C_LName], [C_Address], [C_City], [C_State], [C_ZIP], [C_Email], [C_Phone]) VALUES (1010, N'Don', N'Smith', N'100 South Street', N'Waldensburg', N'WA', N'51254', N'dsmith@gmail.com', N'555.123.4577')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
SET IDENTITY_INSERT [dbo].[MEDIA] ON 

INSERT [dbo].[MEDIA] ([MediaCatNum], [MediaType], [MediaQOH], [ManufacturerName], [MediaPrice]) VALUES (1, N'T-Shirt', 3, N'American Apparel', 10.0000)
INSERT [dbo].[MEDIA] ([MediaCatNum], [MediaType], [MediaQOH], [ManufacturerName], [MediaPrice]) VALUES (2, N'Sweatshirt', 1, N'Spectra USA', 15.0000)
INSERT [dbo].[MEDIA] ([MediaCatNum], [MediaType], [MediaQOH], [ManufacturerName], [MediaPrice]) VALUES (3, N'Plaque', 1, N'Franklin Bronze', 20.0000)
INSERT [dbo].[MEDIA] ([MediaCatNum], [MediaType], [MediaQOH], [ManufacturerName], [MediaPrice]) VALUES (4, N'Trophy', 0, N'Trophyland USA', 25.0000)
INSERT [dbo].[MEDIA] ([MediaCatNum], [MediaType], [MediaQOH], [ManufacturerName], [MediaPrice]) VALUES (1002, N'Mug', 2, N'Mugs, USA', 5.0000)
SET IDENTITY_INSERT [dbo].[MEDIA] OFF
SET IDENTITY_INSERT [dbo].[ORDER] ON 

INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (22, 1, 1, 2, 1016, 1, 10.0000, 10.0000, NULL, 1, 0.0000, N'', 0, 0, 0, 0, 0, 0, N'Hello, There!', 1)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (24, 1, 3, 2, 1016, 1, 20.0000, 20.0000, NULL, 1, 0.0000, N'', 0, 0, 0, 0, 0, 0, N'An Order.', NULL)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (25, 1, 3, 2, 1016, 1, 20.0000, 20.0000, NULL, 0, 0.0000, N'', 0, 0, 0, 0, 0, 1, N'Hello', NULL)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (26, 2, 1, 1007, 1017, 2, 9.0000, 10.0000, NULL, 0, 1.0000, NULL, 0, 0, 0, 0, 0, 0, N'Test. Order.', NULL)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (27, 1, 1002, 1007, 1017, 1, 5.0000, 5.0000, NULL, 0, 0.0000, NULL, 0, 0, 0, 0, 0, 0, N'This is a mug.', NULL)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (28, 2, 1, 1004, 1017, 1, 9.0000, 10.0000, NULL, 0, 1.0000, NULL, 0, 0, 0, 0, 0, 0, N'This is a T-Shirt.', NULL)
INSERT [dbo].[ORDER] ([OrderID], [PaymentTypeID], [MediaCatNum], [C_ID], [UserID], [OrderQuantity], [AmountDue], [OrderPrice], [ExtOrderID], [IsValidated], [DepositAmount], [Memo], [InStock], [PulledFromStock], [OnOrder], [IsDelivered], [IsComplete], [IsClosed], [OrderContent], [IsSold]) VALUES (29, 1, 1, 1004, 1016, 1, 10.0000, 10.0000, NULL, 1, 0.0000, N'', 0, 0, 0, 0, 0, 0, N'this is a t-shirt', NULL)
SET IDENTITY_INSERT [dbo].[ORDER] OFF
SET IDENTITY_INSERT [dbo].[PAYMENT_TYPE] ON 

INSERT [dbo].[PAYMENT_TYPE] ([PaymentTypeID], [PaymentType]) VALUES (1, N'Bill')
INSERT [dbo].[PAYMENT_TYPE] ([PaymentTypeID], [PaymentType]) VALUES (2, N'Cash On Delivery')
SET IDENTITY_INSERT [dbo].[PAYMENT_TYPE] OFF
SET IDENTITY_INSERT [dbo].[USER] ON 

INSERT [dbo].[USER] ([UserID], [UserTypeID], [UserName], [UserFName], [UserLName], [UserPassword], [UserEmail]) VALUES (2, 1, N'opsmanager', N'Ops       ', N'Manager   ', N'opsmanager!', N'opsmanager@wsc.com')
INSERT [dbo].[USER] ([UserID], [UserTypeID], [UserName], [UserFName], [UserLName], [UserPassword], [UserEmail]) VALUES (1014, 2, N'bmills', N'Bob', N'Mills', N'Pa55word!', N'bmills@gmail.com')
INSERT [dbo].[USER] ([UserID], [UserTypeID], [UserName], [UserFName], [UserLName], [UserPassword], [UserEmail]) VALUES (1015, 4, N'sthomas', N'Sarah', N'Thomas', N'init123!', N'sthomas@email.com')
INSERT [dbo].[USER] ([UserID], [UserTypeID], [UserName], [UserFName], [UserLName], [UserPassword], [UserEmail]) VALUES (1016, 3, N'tjones', N'Terry', N'Drew-Jones', N'init123!', N'tjones@aol.com')
INSERT [dbo].[USER] ([UserID], [UserTypeID], [UserName], [UserFName], [UserLName], [UserPassword], [UserEmail]) VALUES (1017, 5, N'Unassigned', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[USER] OFF
SET IDENTITY_INSERT [dbo].[USER_TYPE] ON 

INSERT [dbo].[USER_TYPE] ([UserTypeID], [UserType], [UserTypeDescription]) VALUES (1, N'Ops Manager', N'Operations Manager')
INSERT [dbo].[USER_TYPE] ([UserTypeID], [UserType], [UserTypeDescription]) VALUES (2, N'Salesperson', N'Salesperson')
INSERT [dbo].[USER_TYPE] ([UserTypeID], [UserType], [UserTypeDescription]) VALUES (3, N'Production', N'Printer and engraver')
INSERT [dbo].[USER_TYPE] ([UserTypeID], [UserType], [UserTypeDescription]) VALUES (4, N'Shipping', N'Shipping / warehouse')
INSERT [dbo].[USER_TYPE] ([UserTypeID], [UserType], [UserTypeDescription]) VALUES (5, N'Unassigned', N'Unassigned')
SET IDENTITY_INSERT [dbo].[USER_TYPE] OFF
/****** Object:  Index [aaaaaCUSTOMER_PK]    Script Date: 8/24/2014 12:34:57 PM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD  CONSTRAINT [aaaaaCUSTOMER_PK] PRIMARY KEY NONCLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaEXT_ORDER_PK]    Script Date: 8/24/2014 12:34:57 PM ******/
ALTER TABLE [dbo].[EXT_ORDER] ADD  CONSTRAINT [aaaaaEXT_ORDER_PK] PRIMARY KEY NONCLUSTERED 
(
	[ExtOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaaMEDIA_PK]    Script Date: 8/24/2014 12:34:57 PM ******/
ALTER TABLE [dbo].[MEDIA] ADD  CONSTRAINT [aaaaaMEDIA_PK] PRIMARY KEY NONCLUSTERED 
(
	[MediaCatNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_USER]    Script Date: 8/24/2014 12:34:57 PM ******/
ALTER TABLE [dbo].[USER] ADD  CONSTRAINT [IX_USER] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[QUALITY_CONTROL] ADD  CONSTRAINT [DF__QUALITY_C__IsPas__173876EA]  DEFAULT ((0)) FOR [IsPassed]
GO
ALTER TABLE [dbo].[EXT_ORDER]  WITH CHECK ADD  CONSTRAINT [FK_EXT_ORDER_MEDIA] FOREIGN KEY([MediaCatNum])
REFERENCES [dbo].[MEDIA] ([MediaCatNum])
GO
ALTER TABLE [dbo].[EXT_ORDER] CHECK CONSTRAINT [FK_EXT_ORDER_MEDIA]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_CUSTOMER] FOREIGN KEY([C_ID])
REFERENCES [dbo].[CUSTOMER] ([C_ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_CUSTOMER]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_EXT_ORDER] FOREIGN KEY([ExtOrderID])
REFERENCES [dbo].[EXT_ORDER] ([ExtOrderID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_EXT_ORDER]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_MEDIA] FOREIGN KEY([MediaCatNum])
REFERENCES [dbo].[MEDIA] ([MediaCatNum])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_MEDIA]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PAYMENT_TYPE] FOREIGN KEY([PaymentTypeID])
REFERENCES [dbo].[PAYMENT_TYPE] ([PaymentTypeID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_PAYMENT_TYPE]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[USER] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_USER]
GO
ALTER TABLE [dbo].[QUALITY_CONTROL]  WITH CHECK ADD  CONSTRAINT [FK_QUALITY_CONTROL_ORDER] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ORDER] ([OrderID])
GO
ALTER TABLE [dbo].[QUALITY_CONTROL] CHECK CONSTRAINT [FK_QUALITY_CONTROL_ORDER]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK_USER_USER_TYPE] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[USER_TYPE] ([UserTypeID])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK_USER_USER_TYPE]
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'砃佈維꓄࡭벁' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'昌剧媙䧴䞶' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_FName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_FName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_FName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'滗䧲䦲ꦝ鬐ᗐ鵐' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_LName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_LName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_LName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'쳽밂䃨ꎓ略ꪭ刮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_Address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_Address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Address'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'矄昷䉴⡾ٙ뿫' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_City' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_City' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_City'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'॒淑莐䴱徼熨㴂' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_InputMask', @value=N'>LL;0;_' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_State' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_State' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_State'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'샩浗䲵⒂蕷萵겥' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_InputMask', @value=N'99999;0;_' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_ZIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_ZIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_ZIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'찪㗥◑䖁㮯ｱ㐟✲' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'䔱┩뷸䃡Ṵ筹樧' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_InputMask', @value=N'!\(000") "000\-0000;0;_' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'C_Phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'C_Phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER', @level2type=N'COLUMN',@level2name=N'C_Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'7/16/2014 8:22:56 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'7/16/2014 9:18:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CUSTOMER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CUSTOMER'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'鳤欛曖䩣覮㈓ꓦ䀇' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ExtOrderID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ExtOrderID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EXT_ORDER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ExtOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'꘸⣈䙻ᮇ棼曏씣' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'VendorName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'VendorName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EXT_ORDER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'VendorName'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�괠搛䙲ꢣ螏뺿瓬' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ETA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowDatePicker', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ETA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'EXT_ORDER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER', @level2type=N'COLUMN',@level2name=N'ETA'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'7/16/2014 8:41:19 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'7/16/2014 9:18:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EXT_ORDER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EXT_ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1755' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'莍琻䭍侟䦮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MediaCatNum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MediaCatNum' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'MEDIA_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaCatNum'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowMultipleValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowValueListEdits', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1890' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'岈㡆흪䴃青鈸햩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_BoundColumn', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnHeads', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ColumnWidths', @value=N'1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'111' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_LimitToList', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListRows', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ListWidth', @value=N'1440twip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSource', @value=N'"Clothing";"Plaque";"Trophy"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_RowSourceType', @value=N'Value List' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MediaType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'ShowOnlyRowSourceValues', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MediaType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'MEDIA_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaType'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1800' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'텐嚭᜼䷐澝壼䙃䷮' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MediaQOH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MediaQOH' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'MEDIA_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'MediaQOH'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2445' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'㹾�乳ា琡떺' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ManufacturerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ManufacturerName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'MEDIA_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA', @level2type=N'COLUMN',@level2name=N'ManufacturerName'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'7/16/2014 8:18:44 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'7/16/2014 9:18:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MEDIA_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MEDIA'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'7/16/2014 8:47:07 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'7/16/2014 9:18:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ORDER_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORDER'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'�㦶䏇쎡解쌞쳦' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'IsPassed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'IsPassed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'QUALITY_CONTROL_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'IsPassed'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'CurrencyLCID', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'⥏Ꮻ䇽튉⧡礵땤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'InspectionMemo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'ResultType', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'InspectionMemo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'QUALITY_CONTROL_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL', @level2type=N'COLUMN',@level2name=N'InspectionMemo'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackShade', @value=N'95' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackThemeColorIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'AlternateBackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'BackShade', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'BackTint', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetForeThemeColorIndex', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'DatasheetGridlinesThemeColorIndex', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'7/16/2014 8:42:10 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'7/16/2014 9:18:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'QUALITY_CONTROL_local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'PublishToWeb', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'ReadOnlyWhenDisconnected', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'ThemeFontIndex', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'QUALITY_CONTROL'
GO
USE [master]
GO
ALTER DATABASE [WSCDatabase] SET  READ_WRITE 
GO
