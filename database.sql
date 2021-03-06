USE [master]
GO
/****** Object:  Database [Gold_Shop]    Script Date: 03/12/2022 21:48:04 ******/
CREATE DATABASE [Gold_Shop] ON  PRIMARY 
( NAME = N'Gold_Shop', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Gold_Shop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gold_Shop_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Gold_Shop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gold_Shop] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gold_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gold_Shop] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Gold_Shop] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Gold_Shop] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Gold_Shop] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Gold_Shop] SET ARITHABORT OFF
GO
ALTER DATABASE [Gold_Shop] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Gold_Shop] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Gold_Shop] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Gold_Shop] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Gold_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Gold_Shop] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Gold_Shop] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Gold_Shop] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Gold_Shop] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Gold_Shop] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Gold_Shop] SET  DISABLE_BROKER
GO
ALTER DATABASE [Gold_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Gold_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Gold_Shop] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Gold_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Gold_Shop] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Gold_Shop] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Gold_Shop] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Gold_Shop] SET  READ_WRITE
GO
ALTER DATABASE [Gold_Shop] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Gold_Shop] SET  MULTI_USER
GO
ALTER DATABASE [Gold_Shop] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Gold_Shop] SET DB_CHAINING OFF
GO
USE [Gold_Shop]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender_id] [int] IDENTITY(1,1) NOT NULL,
	[Gender_Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Forgot_Password]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forgot_Password](
	[Req_id] [int] IDENTITY(1,1) NOT NULL,
	[Id] [nvarchar](500) NOT NULL,
	[User_id] [int] NOT NULL,
	[Req_DateTime] [datetime] NULL,
 CONSTRAINT [PK_Forgot_Password] PRIMARY KEY CLUSTERED 
(
	[Req_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Brand_id] [int] IDENTITY(1,1) NOT NULL,
	[Brand_name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Brand_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personalization_Request]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personalization_Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[metal] [nvarchar](100) NOT NULL,
	[minimum_price] [money] NOT NULL,
	[maximum_price] [money] NOT NULL,
	[phone_no] [nvarchar](50) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[username] [nvarchar](500) NOT NULL,
	[details] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[User_Name] [nvarchar](150) NOT NULL,
	[Product_Name] [nvarchar](200) NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[Weight] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](150) NOT NULL,
	[State] [nvarchar](150) NOT NULL,
	[Pincode] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Payment_Type] [nvarchar](150) NOT NULL,
	[Payment_Status] [nvarchar](200) NOT NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[Order_Status] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Type]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Type](
	[ProductType_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Type_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product_Type] PRIMARY KEY CLUSTERED 
(
	[ProductType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Image_Name] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
	[Heading_Name] [nvarchar](100) NOT NULL,
	[Details] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_detail]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_detail](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NOT NULL,
	[Username] [nchar](30) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[Phone_no] [nvarchar](50) NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[Password] [nchar](30) NOT NULL,
	[User_Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_User_detail] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Cart]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Cart_id] [nchar](10) NOT NULL,
	[User_name] [nvarchar](150) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Product_Name] [nvarchar](max) NOT NULL,
	[Image_url] [nvarchar](max) NOT NULL,
	[Size] [nvarchar](100) NULL,
	[Weight] [nvarchar](100) NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Temp_Cart] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sub_Category]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sub_Category](
	[Sub_Category_id] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory_Name] [nvarchar](max) NOT NULL,
	[Main_Category_id] [int] NOT NULL,
 CONSTRAINT [PK_Sub_Category] PRIMARY KEY CLUSTERED 
(
	[Sub_Category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_SubType]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_SubType](
	[Product_SubType_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Subtype_name] [nvarchar](100) NULL,
	[ProductType_id] [int] NOT NULL,
 CONSTRAINT [PK_Product_SubType] PRIMARY KEY CLUSTERED 
(
	[Product_SubType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gross_Weight]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gross_Weight](
	[Weight_id] [int] IDENTITY(1,1) NOT NULL,
	[Weight_Name] [nvarchar](100) NULL,
	[Brand_id] [int] NULL,
	[category_id] [int] NULL,
	[subCategory_id] [int] NULL,
	[Gender_id] [int] NULL,
	[productType_id] [int] NULL,
	[product_SubType_id] [int] NULL,
 CONSTRAINT [PK_Gross_Weight] PRIMARY KEY CLUSTERED 
(
	[Weight_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[Size_id] [int] IDENTITY(1,1) NOT NULL,
	[Size_Name] [nvarchar](100) NULL,
	[Brand_id] [int] NULL,
	[category_id] [int] NULL,
	[subCategory_id] [int] NULL,
	[Gender_id] [int] NULL,
	[productType_id] [int] NULL,
	[product_SubType_id] [int] NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[Size_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Detail]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Detail](
	[Product_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](max) NOT NULL,
	[Product_ListPrice] [money] NOT NULL,
	[Product_SellingPrice] [money] NOT NULL,
	[Product_BrandId] [int] NOT NULL,
	[Product_CategoryId] [int] NOT NULL,
	[Product_SubCategoryId] [int] NOT NULL,
	[Product_Gender] [int] NOT NULL,
	[Product_Description] [nvarchar](max) NOT NULL,
	[product_Detail] [nvarchar](max) NOT NULL,
	[Return_15_Days] [int] NOT NULL,
	[Product_Type] [int] NULL,
	[Product_SubType] [int] NULL,
	[Shipping] [int] NULL,
 CONSTRAINT [PK_Products_Detail] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03/12/2022 21:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Cart_id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](100) NULL,
	[Product_id] [int] NULL,
	[Product_Name] [nvarchar](100) NULL,
	[Image_Url] [nvarchar](max) NULL,
	[Size] [nvarchar](100) NULL,
	[Weight] [nvarchar](100) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[Cart_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[sizename]    Script Date: 03/12/2022 21:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[sizename]
(
@Size_id int
)
Returns Nvarchar(10)
as Begin
Declare @Size_Name nvarchar(10)
select @Size_Name = Size_Name from Product_Size where Size_id =@Size_id
Return @Size_Name
END
GO
/****** Object:  Table [dbo].[Stocks]    Script Date: 03/12/2022 21:48:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stocks](
	[Stock_id] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size_id] [int] NULL,
	[Weight_id] [int] NULL,
 CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED 
(
	[Stock_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertProduct]    Script Date: 03/12/2022 21:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insertProduct]
(
@Product_Name nvarchar(Max),
@Product_ListPrice money,
@Product_SellingPrice money,
@Product_BrandId int,
@Product_CategoryId int ,
@Product_SubCategoryId int ,
@Gender int ,
@Product_Description nvarchar(max) ,
@product_Detail nvarchar(max) ,
@Return_15_Days int ,
@Product_Type int ,
@Product_SubType int ,
@Shipping int 
)
as

insert into Products_Detail values(@Product_Name,@Product_ListPrice,@Product_SellingPrice,@Product_BrandId,@Product_CategoryId,@Product_SubCategoryId,@Gender,@Product_Description,@product_Detail,@Return_15_Days,@Product_Type,@Product_SubType,@Shipping)
select SCOPE_IDENTITY()
Return 0
GO
/****** Object:  Table [dbo].[Product_Images]    Script Date: 03/12/2022 21:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Images](
	[Product_ImageId] [int] IDENTITY(1,1) NOT NULL,
	[Product_id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Extension] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Product_Images] PRIMARY KEY CLUSTERED 
(
	[Product_ImageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[BindAllProducts]    Script Date: 03/12/2022 21:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BindAllProducts]
As
select A.*,B.*,C.Brand_name,A.Product_ListPrice-A.Product_SellingPrice as DiscountAmount,B.Name as ImageName,C.Brand_name as Brand_Name from Products_Detail A
inner join Brand C on C.Brand_id = A.Product_BrandId
cross apply(
select top 1 * from Product_Images B where B.Product_id= A.Product_id order by B.Product_id desc
)B
order by A.Product_id desc

Return 0
GO
/****** Object:  StoredProcedure [dbo].[Cat_Search]    Script Date: 03/12/2022 21:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Cat_Search]
(
@CategoryName nvarchar(Max)
)
As
select A.*,B.*,C.*,D.*,E.*,F.*,G.*,H.*,A.Product_ListPrice-A.Product_SellingPrice as DiscountAmount,H.Name as ImageName,B.Brand_name as Brand_Name from Products_Detail A
inner join Brand B on B.Brand_id = A.Product_BrandId
inner join Category C on C.Category_id = A.Product_CategoryId
inner join Sub_Category D on D.Sub_Category_id = A.Product_SubCategoryId
inner join Product_Type E on E.ProductType_id = A.Product_Type
inner join Product_SubType F on F.Product_SubType_id = A.Product_SubType
inner join Gender G on G.Gender_id = A.Product_Gender 
cross apply(
select top 1 * from Product_Images H where H.Product_id= A.Product_id order by H.Product_id desc
)H 
where Brand_name=@CategoryName 
or Category_Name=@CategoryName 
or SubCategory_Name=@CategoryName 
or Product_Type_Name=@CategoryName 
or Product_Subtype_name=@CategoryName 
or Gender_Name=@CategoryName 
order by A.Product_id desc

Return 0
GO
/****** Object:  ForeignKey [FK_Sub_Category_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Sub_Category]  WITH CHECK ADD  CONSTRAINT [FK_Sub_Category_Category] FOREIGN KEY([Main_Category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Sub_Category] CHECK CONSTRAINT [FK_Sub_Category_Category]
GO
/****** Object:  ForeignKey [FK_Product_SubType_Product_Type]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_SubType]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubType_Product_Type] FOREIGN KEY([ProductType_id])
REFERENCES [dbo].[Product_Type] ([ProductType_id])
GO
ALTER TABLE [dbo].[Product_SubType] CHECK CONSTRAINT [FK_Product_SubType_Product_Type]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Brand]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Brand] FOREIGN KEY([Brand_id])
REFERENCES [dbo].[Brand] ([Brand_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Brand]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Category]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Gender]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Gender] FOREIGN KEY([Gender_id])
REFERENCES [dbo].[Gender] ([Gender_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Gender]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Product_SubType]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Product_SubType] FOREIGN KEY([product_SubType_id])
REFERENCES [dbo].[Product_SubType] ([Product_SubType_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Product_SubType]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Product_Type]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Product_Type] FOREIGN KEY([productType_id])
REFERENCES [dbo].[Product_Type] ([ProductType_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Product_Type]
GO
/****** Object:  ForeignKey [FK_Gross_Weight_Sub_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Gross_Weight]  WITH CHECK ADD  CONSTRAINT [FK_Gross_Weight_Sub_Category] FOREIGN KEY([subCategory_id])
REFERENCES [dbo].[Sub_Category] ([Sub_Category_id])
GO
ALTER TABLE [dbo].[Gross_Weight] CHECK CONSTRAINT [FK_Gross_Weight_Sub_Category]
GO
/****** Object:  ForeignKey [FK_Product_Size_Brand]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Brand] FOREIGN KEY([Brand_id])
REFERENCES [dbo].[Brand] ([Brand_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Brand]
GO
/****** Object:  ForeignKey [FK_Product_Size_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Category]
GO
/****** Object:  ForeignKey [FK_Product_Size_Gender]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Gender] FOREIGN KEY([Size_id])
REFERENCES [dbo].[Gender] ([Gender_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Gender]
GO
/****** Object:  ForeignKey [FK_Product_Size_Product_SubType]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Product_SubType] FOREIGN KEY([product_SubType_id])
REFERENCES [dbo].[Product_SubType] ([Product_SubType_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Product_SubType]
GO
/****** Object:  ForeignKey [FK_Product_Size_Product_Type]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Product_Type] FOREIGN KEY([Size_id])
REFERENCES [dbo].[Product_Type] ([ProductType_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Product_Type]
GO
/****** Object:  ForeignKey [FK_Product_Size_Sub_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Product_Size]  WITH CHECK ADD  CONSTRAINT [FK_Product_Size_Sub_Category] FOREIGN KEY([product_SubType_id])
REFERENCES [dbo].[Sub_Category] ([Sub_Category_id])
GO
ALTER TABLE [dbo].[Product_Size] CHECK CONSTRAINT [FK_Product_Size_Sub_Category]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Brand]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Brand] FOREIGN KEY([Product_BrandId])
REFERENCES [dbo].[Brand] ([Brand_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Brand]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Category] FOREIGN KEY([Product_CategoryId])
REFERENCES [dbo].[Category] ([Category_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Category]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Gender]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Gender] FOREIGN KEY([Product_CategoryId])
REFERENCES [dbo].[Gender] ([Gender_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Gender]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Product_SubType]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Product_SubType] FOREIGN KEY([Product_SubType])
REFERENCES [dbo].[Product_SubType] ([Product_SubType_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Product_SubType]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Product_Type]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Product_Type] FOREIGN KEY([Product_Type])
REFERENCES [dbo].[Product_Type] ([ProductType_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Product_Type]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Products_Detail]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Products_Detail] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products_Detail] ([Product_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Products_Detail]
GO
/****** Object:  ForeignKey [FK_Products_Detail_Sub_Category]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Products_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Products_Detail_Sub_Category] FOREIGN KEY([Product_SubCategoryId])
REFERENCES [dbo].[Sub_Category] ([Sub_Category_id])
GO
ALTER TABLE [dbo].[Products_Detail] CHECK CONSTRAINT [FK_Products_Detail_Sub_Category]
GO
/****** Object:  ForeignKey [FK_Cart_Products_Detail]    Script Date: 03/12/2022 21:48:10 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products_Detail] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products_Detail] ([Product_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products_Detail]
GO
/****** Object:  ForeignKey [FK_Stocks_Gross_Weight]    Script Date: 03/12/2022 21:48:16 ******/
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Gross_Weight] FOREIGN KEY([Weight_id])
REFERENCES [dbo].[Gross_Weight] ([Weight_id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Gross_Weight]
GO
/****** Object:  ForeignKey [FK_Stocks_Product_Size]    Script Date: 03/12/2022 21:48:16 ******/
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Product_Size] FOREIGN KEY([Size_id])
REFERENCES [dbo].[Product_Size] ([Size_id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Product_Size]
GO
/****** Object:  ForeignKey [FK_Stocks_Products_Detail]    Script Date: 03/12/2022 21:48:16 ******/
ALTER TABLE [dbo].[Stocks]  WITH CHECK ADD  CONSTRAINT [FK_Stocks_Products_Detail] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products_Detail] ([Product_id])
GO
ALTER TABLE [dbo].[Stocks] CHECK CONSTRAINT [FK_Stocks_Products_Detail]
GO
/****** Object:  ForeignKey [FK_Product_Images_Products_Detail]    Script Date: 03/12/2022 21:48:31 ******/
ALTER TABLE [dbo].[Product_Images]  WITH CHECK ADD  CONSTRAINT [FK_Product_Images_Products_Detail] FOREIGN KEY([Product_id])
REFERENCES [dbo].[Products_Detail] ([Product_id])
GO
ALTER TABLE [dbo].[Product_Images] CHECK CONSTRAINT [FK_Product_Images_Products_Detail]
GO
