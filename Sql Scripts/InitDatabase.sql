
-- ===================================
-- 刪除資料表
-- ===================================
DROP TABLE  [dbo].[OrderDetails]
GO

DROP TABLE  [dbo].[Orders]
GO

-- ===================================
-- 建立資料表及資料
-- ===================================

-- 訂單主檔
CREATE TABLE [dbo].[Orders](
	[OrderNo] [varchar](12) NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[DeliveryName] [nvarchar](16) NOT NULL,
	[DeliveryAddress] [nvarchar](64) NOT NULL,
	CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ( [OrderNo] )
)
GO


INSERT [dbo].[Orders] ([OrderNo], [DeliveryDate], [DeliveryName], [DeliveryAddress]) VALUES (N'201612170001', CAST(N'2016-12-30' AS Date), N'JASPER', N'TAIPEI');
INSERT [dbo].[Orders] ([OrderNo], [DeliveryDate], [DeliveryName], [DeliveryAddress]) VALUES (N'201612170002', CAST(N'2016-12-30' AS Date), N'JUDY', N'TAINAN');
GO

-- 訂單明細檔
CREATE TABLE [dbo].[OrderDetails](
	[OrderNo] [varchar](12) NOT NULL,
	[Line] [int] NOT NULL,
	[ProductName] [nvarchar](64) NOT NULL,
	[Qty] [int]	NOT NULL,
	[Amt] [decimal](8, 0) NOT NULL,
	CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED ([OrderNo], [Line] ),
    CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY ([OrderNo]) REFERENCES [Orders]( [OrderNo] ),
)
GO

INSERT [dbo].[OrderDetails] ([OrderNo], [Line], [ProductName], [Qty], [Amt]) VALUES (N'201612170001', 1, N'ASP.NET MVC 5 網站開發美學', 1, CAST(624 AS Decimal(8, 0)));
INSERT [dbo].[OrderDetails] ([OrderNo], [Line], [ProductName], [Qty], [Amt]) VALUES (N'201612170001', 2, N'ASP.NET MVC 5 實務專題範例教學', 1, CAST(502 AS Decimal(8, 0)));
INSERT [dbo].[OrderDetails] ([OrderNo], [Line], [ProductName], [Qty], [Amt]) VALUES (N'201612170001', 3, N'ASP.NET MVC 5 完全攻略', 1, CAST(552 AS Decimal(8, 0)));
INSERT [dbo].[OrderDetails] ([OrderNo], [Line], [ProductName], [Qty], [Amt]) VALUES (N'201612170002', 1, N'王者歸來 : jQuery開發權威指南, 2/e', 1, CAST(612 AS Decimal(8, 0)));
INSERT [dbo].[OrderDetails] ([OrderNo], [Line], [ProductName], [Qty], [Amt]) VALUES (N'201612170002', 2, N'思考的原點：大前研一的麥肯錫思考術', 1, CAST(257 AS Decimal(8, 0)));
GO


