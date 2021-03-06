USE [HotelManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](100) NOT NULL,
	[EmployeeID] [varchar](10) NOT NULL,
	[Password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerTV]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTV](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Gender] [bit] NULL,
	[CumilativePoint] [int] NULL,
	[Address] [nvarchar](300) NULL,
 CONSTRAINT [PK_CustomerTV] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [varchar](10) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Gender] [bit] NULL,
	[Phone] [varchar](145) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [varchar](20) NOT NULL,
	[TypeID] [int] NOT NULL,
	[RentalPrice] [money] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Image] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[RoomBookingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Person] [int] NOT NULL,
	[RoomID] [varchar](20) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CheckinDate] [date] NOT NULL,
	[CheckoutDate] [date] NOT NULL,
	[EmployeeID] [varchar](10) NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[RoomBookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomBookingService]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBookingService](
	[RoomBookingID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[OderDate] [date] NOT NULL,
 CONSTRAINT [PK_RoomBookingService] PRIMARY KEY CLUSTERED 
(
	[RoomBookingID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomService]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomService](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK_RoomService] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 23/10/2017 6:14:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [EmployeeID], [Password]) VALUES (N'chaugiang', N'NV001', N'123456')
INSERT [dbo].[Account] ([Username], [EmployeeID], [Password]) VALUES (N'thanhtam', N'NV002', N'123456')
INSERT [dbo].[Account] ([Username], [EmployeeID], [Password]) VALUES (N'huyentrang', N'NV003', N'123456')
INSERT [dbo].[Account] ([Username], [EmployeeID], [Password]) VALUES (N'ngochoa', N'NV004', N'123456')
INSERT [dbo].[Account] ([Username], [EmployeeID], [Password]) VALUES (N'thanhduy', N'NV005', N'123456')
SET IDENTITY_INSERT [dbo].[CustomerTV] ON 

INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (2, N'Ngọc Hương', CAST(N'1962-12-12' AS Date), N'0985369747', N'huongngoc@gmail.com', 0, 69, N'Tân Chánh Hiệp, Q12')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (3, N'Diệu Hạnh', CAST(N'1995-02-21' AS Date), N'0945781236', N'hanhdang@gmail.com', 0, 155, N'Q3, TpHCM')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (4, N'Thu Thương', CAST(N'1997-08-25' AS Date), N'01968745632', N'thuthuong@gmail.com', 0, 20, N'Lê Đức Thọ, Gò Vấp')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (12, N'fsdfsdfs', CAST(N'0001-01-01' AS Date), N'224234142', N'dangchafdsfsugiang171@gmail.com', 1, 0, N'ÁEss')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (13, N'rwe', CAST(N'0001-01-01' AS Date), N'432423412421', N'dangchafdsfsuruergiang171@gmail.com', 1, 0, N'gdsgsd')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (21, N'chaugiang', CAST(N'1998-03-17' AS Date), N'0969987279', N'chau@gmail.com', 0, 0, N'Q12')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (22, N'trọng bình', CAST(N'1991-01-17' AS Date), N'0956985698', N'bình', 1, 0, N'đồng nai')
INSERT [dbo].[CustomerTV] ([CustomerID], [Name], [Birthday], [Phone], [Email], [Gender], [CumilativePoint], [Address]) VALUES (23, N'chau giang', CAST(N'1997-01-17' AS Date), N'0969987279', N'be@gmail.com', 0, 0, N'quan 12')
SET IDENTITY_INSERT [dbo].[CustomerTV] OFF
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Gender], [Phone], [Birthday], [Email]) VALUES (N'NV001', N'Châu Giang', N'Q12, Tp.HCM', 0, N'0969987279', CAST(N'1997-01-17' AS Date), N'giang@gmail.com')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Gender], [Phone], [Birthday], [Email]) VALUES (N'NV002', N'Thanh Tâm', N'Q9, Tp.HCM', 1, N'0958369747', CAST(N'1986-12-25' AS Date), N'tam@gmail.com')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Gender], [Phone], [Birthday], [Email]) VALUES (N'NV003', N'Huyền Trang', N'Q1, Tp.hcm', 0, N'0987015995', CAST(N'1982-01-30' AS Date), N'trangha@GMAIL.COM')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Gender], [Phone], [Birthday], [Email]) VALUES (N'NV004', N'Ngọc Hoa', N'BRVT', 0, N'01635894455', CAST(N'1964-04-09' AS Date), N'hoa@gmail.com')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Address], [Gender], [Phone], [Birthday], [Email]) VALUES (N'NV005', N'Thanh Duy', N'Thủ Đức', 1, N'0969875267', CAST(N'1999-05-06' AS Date), N'duy@gmail.com')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P001', 1, 150000.0000, 1, N'Content\assets\img\phongdon\1.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P002', 2, 250000.0000, 2, N'Content\assets\img\phongdoi\1.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P003', 2, 500000.0000, 1, N'Content\assets\img\phongdoi\d2.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P004', 1, 600000.0000, 1, N'Content\assets\img\phongdon\3.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P005', 2, 650000.0000, 3, N'Content\assets\img\phongdoi\d3.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P006', 1, 450000.0000, 1, N'Content\assets\img\phongdon\3.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P007', 1, 360000.0000, 1, N'Content\assets\img\phongdon\4.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P008', 1, 800000.0000, 1, N'Content\assets\img\phongdon\5.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P009', 1, 820000.0000, 2, N'Content\assets\img\phongdon\5.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P010', 1, 690000.0000, 2, N'Content\assets\img\phongdon\8.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P011', 2, 560000.0000, 2, N'Content\assets\img\phongdoi\d8.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P012', 2, 260000.0000, 2, N'Content\assets\img\phongdoi\d8.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P013', 2, 456000.0000, 3, N'Content\assets\img\phongdoi\d10.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P014', 2, 120000.0000, 1, N'Content\assets\img\phongdoi\d2.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P015', 2, 360000.0000, 3, N'Content\assets\img\phongdoi\d8.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P016', 1, 256000.0000, 1, N'Content\assets\img\phongdon\8.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P017', 2, 365000.0000, 1, N'Content\assets\img\phongdoi\d3.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P018', 1, 125000.0000, 1, N'Content\assets\img\phongdon\7.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P019', 1, 369000.0000, 1, N'Content\assets\img\phongdoi\d3.jpg')
INSERT [dbo].[Room] ([RoomID], [TypeID], [RentalPrice], [StatusID], [Image]) VALUES (N'P020', 1, 360000.0000, 1, N'Content\assets\img\phongdon\8.jpg')
SET IDENTITY_INSERT [dbo].[RoomBooking] ON 

INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (38, NULL, 1, N'P001', N'Thu Thương', N'01365897755', N'thuong@gmail', CAST(N'2017-10-19' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (39, NULL, 1, N'P001', N'Quốc Nhật', N'0612456789', N'nhat@gmail.com', CAST(N'2017-10-19' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (40, NULL, 1, N'P001', N'Quốc Nhật', N'0612456789', N'nhat@gmail.com', CAST(N'2017-10-09' AS Date), CAST(N'2017-10-18' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (41, NULL, 1, N'P001', N'Thu Hiền', N'0698524123', N'hien@gmail.com', CAST(N'2017-10-09' AS Date), CAST(N'2017-10-12' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (42, NULL, 1, N'P001', N'Thu Hiền', N'0698524123', N'hien@gmail.com', CAST(N'2017-10-09' AS Date), CAST(N'2017-10-12' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (43, NULL, 1, N'P001', N'Thu Thương', N'01365897755', N'thuong@gmail', CAST(N'2017-10-26' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (44, NULL, 1, N'P001', N'Thu Thương', N'01365897755', N'thuong@gmail', CAST(N'2017-10-10' AS Date), CAST(N'2017-10-20' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (45, NULL, 1, N'P007', N'Quốc Nhật', N'0612456789', N'nhat@gmail.com', CAST(N'2017-10-11' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (46, NULL, 2, N'P008', N'Thu Hiền', N'0698524123', N'hien@gmail.com', CAST(N'2017-10-20' AS Date), CAST(N'2017-10-26' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (47, NULL, 2, N'P008', N'Chí Linh', N'012398756412', N'chilinh@gmail.com', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-22' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (48, NULL, 1, N'P001', N'Quốc Nhật', N'0612456789', N'nhat@gmail.com', CAST(N'2017-10-17' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (49, NULL, 1, N'P001', N'Giang Lun', N'0123456789', N'dangchaugiang171@gmail.com', CAST(N'2017-10-17' AS Date), CAST(N'2017-10-27' AS Date), N'NV001', N'Canceled')
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (50, NULL, 2, N'P008', N'Diệu Hạnh', N'01202638794', N'Q3, TpHCM', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-19' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (51, NULL, 4, N'P005', N'Diệu Hạnh', N'0165385122', N'Q3, TpHCM', CAST(N'2017-10-17' AS Date), CAST(N'2017-10-23' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (52, NULL, 4, N'P005', N'Diệu Hạnh', N'0165385122', N'Q3, TpHCM', CAST(N'2017-10-17' AS Date), CAST(N'2017-10-23' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (53, NULL, 3, N'P005', N'Diệu Hạnh', N'01698683248', N'Q3, TpHCM', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-23' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (54, NULL, 2, N'P001', N'Thanh Hòa', N'01635867896', N'TpHCM', CAST(N'2017-10-21' AS Date), CAST(N'2017-10-26' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (55, NULL, 1, N'P001', N'Ngọc Hoa', N'01635894455', N'hoangoc@gmail.com', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-19' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (56, NULL, 1, N'P001', N'Nga Xinh đẹp', N'0698751236', N'thanhngabkav01@gmail.com', CAST(N'2017-10-17' AS Date), CAST(N'2017-10-22' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (57, NULL, 2, N'P001', N'Đạt Nguyễn', N'0969654789', N'datnguyen@gmail.com', CAST(N'2017-10-16' AS Date), CAST(N'2017-10-24' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (76, NULL, 1, N'P014', N'be xinh dep', N'01693546987', N'dangchaugiang171@gmail.com', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (77, NULL, 1, N'P001', N'phúc', N'0969987279', N'dangchaugiang171@gmail.com', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-25' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (78, NULL, 1, N'P001', N'phúc', N'0969987279', N'dangchaugiang171@gmail.com', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-25' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (79, NULL, 1, N'P014', N'ngoc hoa nguyen', N'01635984455', N'dangchaugiang171@gmail.com', CAST(N'2017-10-25' AS Date), CAST(N'2017-10-30' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (80, NULL, 1, N'P018', N'Đặng Thị Diệu Hạnh', N'0969987279', N'dangchaugiang171@gmail.com', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), N'NV001', N'Canceled')
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (81, NULL, 1, N'P016', N'tuấn', N'0123456789123', N'dangchaugiang171@gmail.com', CAST(N'2017-10-23' AS Date), CAST(N'2017-10-26' AS Date), N'NV001', NULL)
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (82, NULL, 1, N'P014', N'Hồ Sỹ Minh Hoàng', N'01698965423', N'dangchaugiang171@gmail.com', CAST(N'2017-10-24' AS Date), CAST(N'2017-10-26' AS Date), N'NV001', N'Canceled')
INSERT [dbo].[RoomBooking] ([RoomBookingID], [CustomerID], [Person], [RoomID], [Name], [Phone], [Email], [CheckinDate], [CheckoutDate], [EmployeeID], [Status]) VALUES (83, NULL, 1, N'P014', N'Tiến đẹp gái', N'0969987279', N'dangchaugiang171@gmail.com', CAST(N'2017-10-24' AS Date), CAST(N'2017-10-25' AS Date), N'NV001', N'Canceled')
SET IDENTITY_INSERT [dbo].[RoomBooking] OFF
SET IDENTITY_INSERT [dbo].[RoomService] ON 

INSERT [dbo].[RoomService] ([ServiceID], [Name], [Price]) VALUES (1, N'SPA', 250000.0000)
INSERT [dbo].[RoomService] ([ServiceID], [Name], [Price]) VALUES (2, N'BAR', 600000.0000)
INSERT [dbo].[RoomService] ([ServiceID], [Name], [Price]) VALUES (3, N'FULLMEAL', 350000.0000)
INSERT [dbo].[RoomService] ([ServiceID], [Name], [Price]) VALUES (4, N'GAMECENTER', 9800000.0000)
INSERT [dbo].[RoomService] ([ServiceID], [Name], [Price]) VALUES (5, N'CASINO', 780000.0000)
SET IDENTITY_INSERT [dbo].[RoomService] OFF
SET IDENTITY_INSERT [dbo].[RoomStatus] ON 

INSERT [dbo].[RoomStatus] ([StatusID], [Name]) VALUES (1, N'FREE')
INSERT [dbo].[RoomStatus] ([StatusID], [Name]) VALUES (2, N'ON_HOLD')
INSERT [dbo].[RoomStatus] ([StatusID], [Name]) VALUES (3, N'RENTING')
SET IDENTITY_INSERT [dbo].[RoomStatus] OFF
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([TypeID], [Name]) VALUES (1, N'SINGLE')
INSERT [dbo].[RoomType] ([TypeID], [Name]) VALUES (2, N'DOUBLE')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Employee]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[RoomStatus] ([StatusID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomStatus]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[RoomType] ([TypeID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_CustomerTV] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[CustomerTV] ([CustomerID])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_CustomerTV]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Employee]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Employee1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Employee1]
GO
ALTER TABLE [dbo].[RoomBookingService]  WITH CHECK ADD  CONSTRAINT [FK_RoomBookingService_RoomBooking] FOREIGN KEY([RoomBookingID])
REFERENCES [dbo].[RoomBooking] ([RoomBookingID])
GO
ALTER TABLE [dbo].[RoomBookingService] CHECK CONSTRAINT [FK_RoomBookingService_RoomBooking]
GO
ALTER TABLE [dbo].[RoomBookingService]  WITH CHECK ADD  CONSTRAINT [FK_RoomBookingService_RoomService] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[RoomService] ([ServiceID])
GO
ALTER TABLE [dbo].[RoomBookingService] CHECK CONSTRAINT [FK_RoomBookingService_RoomService]
GO
