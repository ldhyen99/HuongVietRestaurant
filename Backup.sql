USE [master]
GO
/****** Object:  Database [HuongVietResto]    Script Date: 14/05/2020 3:53:11 PM ******/
CREATE DATABASE [HuongVietResto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HuongVietResto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQSER\MSSQL\DATA\HuongVietResto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HuongVietResto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQSER\MSSQL\DATA\HuongVietResto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HuongVietResto] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HuongVietResto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HuongVietResto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HuongVietResto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HuongVietResto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HuongVietResto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HuongVietResto] SET ARITHABORT OFF 
GO
ALTER DATABASE [HuongVietResto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HuongVietResto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HuongVietResto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HuongVietResto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HuongVietResto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HuongVietResto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HuongVietResto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HuongVietResto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HuongVietResto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HuongVietResto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HuongVietResto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HuongVietResto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HuongVietResto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HuongVietResto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HuongVietResto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HuongVietResto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HuongVietResto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HuongVietResto] SET RECOVERY FULL 
GO
ALTER DATABASE [HuongVietResto] SET  MULTI_USER 
GO
ALTER DATABASE [HuongVietResto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HuongVietResto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HuongVietResto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HuongVietResto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HuongVietResto] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HuongVietResto', N'ON'
GO
ALTER DATABASE [HuongVietResto] SET QUERY_STORE = OFF
GO
USE [HuongVietResto]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MaTV]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MaTV]()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(MaTV) FROM ThanhVien) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(MaTV, 3)) FROM ThanhVien
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	
	RETURN @ID
END
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoDH]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoDH]() 
returns varchar(5)
as
begin
	
	declare @ID varchar(5)
	
	 select top 1 @ID = SUBSTRING(MaDonHang, 3,5) from DonHang Order BY MaDonHang desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'DH00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'DH0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoGiaoDich]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoGiaoDich] () 
returns varchar(5)
as
begin
	declare @ID varchar(5)
	 select top 1 @ID = SUBSTRING(MaGD, 3,5) from GiaoDich Order BY MaGD desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN '00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN '0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoKV]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoKV] () 
returns varchar(5)
as
begin
	declare @ID varchar(5)
	 select top 1 @ID = SUBSTRING(MaKV, 3,5) from KhuVuc Order BY MaKV desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'KV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'KV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoMoiMon]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoMoiMon] () 
returns varchar(5)
as
begin
	declare @ID varchar(5)
	 select top 1 @ID = SUBSTRING(MaMoiMon, 3,5) from MoiMon Order BY MaMoiMon desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'MM00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'MM0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoTP]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoTP]() 
returns varchar(5)
as
begin
	declare @ID nvarchar(5)
	 select top 1 @ID = SUBSTRING(MaTP, 3,5) from ThanhPho Order BY MaTP desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TP00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TP0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[Chect_AutoTV]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[Chect_AutoTV] () 
returns varchar(5)
as
begin
	declare @ID varchar(5)
	declare @IDTV varchar(5)
	--set @IDTV  =  (select MaTV from ThanhVien)
	--if(@IDTV = dbo.AUTO_MaTV())
--		set @ID = 0
	--else 
	--set @ID = 'TV007'
	 --SELECT @ID = MAX(RIGHT(MaTV, 3)) FROM ThanhVien
	 select top 1 @ID = SUBSTRING(MaTV, 3,5) from ThanhVien Order BY MaTV desc
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'TV00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'TV0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	return @ID
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_ChangeMaCN]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_ChangeMaCN]
(
	@TenCN nvarchar(50)
)
returns char(10)
as
begin
	declare @kq char(10)
	set @kq = (select cn.MaCN from  ChiNhanh cn where cn.TenCN = @TenCN)
return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_ChangeMaKV]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_ChangeMaKV]
(
	@TenKV nvarchar(50)
)
returns char(10)
as
begin
	declare @kq char(5)
	set @TenKV = (select MaKV from KhuVuc where TenKV = @TenKV)
--	if(@TenKV is not null)
		set @kq = @TenKV
--	 set @kq = 'True'
--else set @kq = 'False'

return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_ChangeMaMonAN]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_ChangeMaMonAN]
(
	@TenMonAn nvarchar(50)
)
returns char(10)
as
begin
	declare @kq char(10)
	set @kq = (select ma.MaMoiMon from  MoiMon ma where ma.TenMoiMon = @TenMonAn)
	
return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_Check_feeShip]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_Check_feeShip] (
	@MaKV char(5),
	@MaGD char(5)
)
returns int --kiểu dữ liệu trả về
as
begin
	
	declare @TP1 char(10)
    set @TP1 = (Select kv.MaTP -- Lấy mã thành phố trùng với khu vực giao dịch
   from GiaoDich gd join KhuVuc kv on (gd.MaKV=kv.MaKV) where gd.MaGD=@MaGD   )

	declare @TP2 char(10)
	set @TP2 = (Select kv.MaTP -- -- Lấy mã thành phố trùng với khu vực chi nhánh
	from ChiNhanh cn join KhuVuc kv on (cn.MaKV=kv.MaKV) where cn.MaKV = @MaKV)

	declare @KV1 char(10)
    set @KV1 = (Select gd.MaKV -- Lấy mã khu vực của giao dịch
   from GiaoDich gd where gd.MaGD=@MaGD  )

	declare @KV2 char(10)
	set @KV2 = (Select cn.MaKV -- Lấy mã khu vực của chi nhánh
	from ChiNhanh cn where cn.MaKV=@MaKV)

	declare @TVNULL char(10)
	set @TVNULL =(select MaTV from GiaoDich where MaGD=@MaGD)

	declare @kq int
	if(@TP1 = @TP2  and @TVNULL is null)
		set @kq= 20 -- Cùng thành phố, khác khu vực + cùng khu vực nhưng ko là thành viên -> 20k
	
	else if(@TP1 = @TP2 and @KV1!=@KV2 and @TVNULL is not null)

		set @kq = 20 -- Cùng thành phố, khác khu vực và ko là thành viên

	else if(@KV1 = @KV2 and @TVNULL is not null)

		set @kq=0 -- Là thành viên và cùng khu vực cùng thành phố -> free
	else 

		set @kq=50 -- Khác thành phố  -> 50k
return @kq --kết quả muốn trả về
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_Check_LamThe]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_Check_LamThe]
(
	@maGD char(10)
)
returns varchar(10)
as
begin
	declare @kq varchar(10)
	declare @The bit
	set @The = (select LamTheTV from GiaoDich where MaGD = @maGD)
	declare @MaTV char(10)
	set @MaTV = (select MaTV from GiaoDich where MaGD = @maGD)
	if(@The = 1 and @MaTV is Null)
		set @kq = 1 -- Làm thẻ

	else set @kq = 0 -- Không làm thẻ
return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_Check_UuDai]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_Check_UuDai]
(
	@MaGD char(10)
)
returns varchar(10)
as
begin
	declare @rank varchar(10)
	declare @TLTV int 
	declare @MaTV varchar(5)
	set @MaTV = (select MaTV from GiaoDich where MaGD = @MaGD)
	set @TLTV = (select TichLuy from ThanhVien where MaTV = @MaTV) -- Lấy điểm tích lũy của 1 thành viên bất kỳ

	if(@MaTV is not null)
	begin 
	iF(@TLTV > 5000)   
		set @rank = 'Gold' 
	else if(@TLTV > 20000)
		set @rank = 'Dimond'
	else if(@TLTV is NULL)
	    set @rank = 'QuanLy'
	else
		set @rank = 'Silver'
	end
	else 
		set @rank='No'
	return @rank
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_CheckMTP]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_CheckMTP]
(
	@TenTP nvarchar(50)
)
returns char(10)
as
begin
	declare @kq char(5)
	set @TenTP = (select MaTP from ThanhPho where TenTP = @TenTP)
	if(@TenTP is not null)
		set @kq = @TenTP
--	 set @kq = 'True'
--else set @kq = 'False'

return @kq
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_Set_Date]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_Set_Date] ()
returns datetime2
as 
begin
	DECLARE @date1 datetime2 
	DECLARE @date2 datetime2 
	set @date1 = GETDATE()
	set @date2 = DATEADD(hour, 3, @date1);
	return @date2
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_TongTien]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_TongTien]()
returns int
as
begin
	declare @MaGD char(5) 
	set @MaGD = '004'

	declare @feeShip int 
	set @feeShip = (select top 1 FeeShip from GiaoDich order by FeeShip desc)

	declare @GiamGia int
	declare @TongTien int
	set @TongTien = dbo.UF_ToTal(dbo.UF_ChangeMaMonAN(N'Bún chả giò'),5)
	if(dbo.UF_Check_UuDai(@MaGD) = 'Gold')	
		set @GiamGia = @TongTien * 5 / 100
	else if(dbo.UF_Check_UuDai(@MaGD) = 'Dimond')	
		set @GiamGia = @TongTien * 10 / 100
	else 
		set @GiamGia = 0
	set @TongTien = @TongTien - @GiamGia + @feeShip
return @TongTien
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_ToTal]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_ToTal] (@MaMoiMon char(5), @SL int)
 returns int
 as
begin
	declare @DonGia money
	declare @TongTien money

	set @DonGia = (select GiamGia from MoiMon where MaMoiMon = @MaMoiMon)
	set @TongTien = @DonGia * @SL
return @TongTien
end
GO
/****** Object:  UserDefinedFunction [dbo].[UF_XuLy_TinhTrang]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[UF_XuLy_TinhTrang]
(
	@maHD char(10)
)
returns varchar(10)
as
begin

 declare @kq varchar(10)
 declare @status nvarchar(50)
 set @status = (select TinhTrang from DonHang where MaDonHang = @maHD)

 if(@status = N'Đang Giao')
	
	set @kq = 1 -- Xuất hóa đơn, khi dùng bữa tại nhà hàng thì chuyển thành Chờ Giao Hàng
 else if(@status = N'Tiếp Nhận')
	set @kq = 2 -- Hủy đơn hàng

 else 
	set @kq = 3
 
return @kq
end
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 14/05/2020 3:53:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MaCN] [char](10) NOT NULL,
	[TenCN] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Hotline] [int] NULL,
	[MaKV] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietQuyen]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietQuyen](
	[MaChiTiet] [char](10) NOT NULL,
	[MaQuyen] [char](10) NULL,
	[TenHanhDong] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[CheckHanhDong] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [char](10) NOT NULL,
	[MaGD] [char](10) NULL,
	[MaMoiMon] [char](10) NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [int] NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [pk_MaMoiMon] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[MaGD] [char](10) NOT NULL,
	[TinhTrang] [nvarchar](50) NULL,
	[MaTV] [char](10) NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[ThoiGianDat] [datetime] NULL,
	[ThoiGianGiaoDuKien] [datetime] NULL,
	[PhuongThucGD] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](100) NULL,
	[MaKV] [char](10) NULL,
	[LamTheTV] [bit] NULL,
	[FeeShip] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[MaKV] [char](10) NOT NULL,
	[MaTP] [char](10) NULL,
	[TenKV] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMon](
	[MaLoaiMon] [char](10) NOT NULL,
	[TenLoaiMon] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoiMon]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoiMon](
	[MaMoiMon] [char](10) NOT NULL,
	[TenMoiMon] [nvarchar](50) NULL,
	[MaLoaiMon] [char](10) NULL,
	[SoLuongConLai] [int] NULL,
	[DonGia] [money] NULL,
	[GiamGia] [money] NULL,
	[ImgLink] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMoiMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenHan]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenHan](
	[MaQuyen] [char](10) NOT NULL,
	[TenQuyenHan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TVAdnQuyenHan]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TVAdnQuyenHan](
	[Ma_User_Per] [char](10) NOT NULL,
	[MaQuyen] [char](10) NULL,
	[MaTV] [char](10) NULL,
	[licensed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ma_User_Per] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[MaTP] [char](10) NOT NULL,
	[TenTP] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[MaTV] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [int] NULL,
	[MaCN] [char](10) NULL,
	[CMND] [int] NULL,
	[NgaySinh] [date] NULL,
	[User_Email] [varchar](32) NULL,
	[User_Password] [varchar](32) NULL,
	[Day_Create] [date] NULL,
	[TichLuy] [int] NULL,
	[MaKV] [char](10) NULL,
	[MaQuyen] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UuDai]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UuDai](
	[MaUuDai] [char](10) NOT NULL,
	[TenUuDai] [nvarchar](50) NULL,
	[DiemTichLuy] [int] NULL,
	[NoiDung] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUuDai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UuDaiChoThanhVien]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UuDaiChoThanhVien](
	[MaTV] [char](10) NOT NULL,
	[MaUD] [char](10) NOT NULL,
	[LanDungUuDai] [int] NOT NULL,
	[NgayDung] [date] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [Hotline], [MaKV]) VALUES (N'CN001     ', N'Cần Thơ', N'đường Đại lộ Hòa Bình', 2858942, N'KV001     ')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [Hotline], [MaKV]) VALUES (N'CN002     ', N'Sài Gòn', N'đường Phạn Thế Hiển', 2856345, N'KV002     ')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [Hotline], [MaKV]) VALUES (N'CN003     ', N'Đà Nẵng', N'đường Huyền Trân Công Chúa', 2852469, N'KV003     ')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [Hotline], [MaKV]) VALUES (N'CN004     ', N'Nghệ An', N'đường Phan Bội Châu', 2859315, N'KV004     ')
INSERT [dbo].[ChiNhanh] ([MaCN], [TenCN], [DiaChi], [Hotline], [MaKV]) VALUES (N'CN005     ', N'Hà Nội', N'Cầu Chương Dương', 2851125, N'KV005     ')
INSERT [dbo].[ChiTietQuyen] ([MaChiTiet], [MaQuyen], [TenHanhDong], [Code], [CheckHanhDong]) VALUES (N'CTQ001    ', N'MQ001     ', N'Thêm', N'ADD', 1)
INSERT [dbo].[ChiTietQuyen] ([MaChiTiet], [MaQuyen], [TenHanhDong], [Code], [CheckHanhDong]) VALUES (N'CTQ002    ', N'MQ001     ', N'Sửa', N'EDIT', 1)
INSERT [dbo].[ChiTietQuyen] ([MaChiTiet], [MaQuyen], [TenHanhDong], [Code], [CheckHanhDong]) VALUES (N'CTQ003    ', N'MQ001     ', N'Xóa', N'DELETE', 1)
INSERT [dbo].[ChiTietQuyen] ([MaChiTiet], [MaQuyen], [TenHanhDong], [Code], [CheckHanhDong]) VALUES (N'CTQ004    ', N'MQ001     ', N'Thống kê', N'STATISTICS', 1)
INSERT [dbo].[ChiTietQuyen] ([MaChiTiet], [MaQuyen], [TenHanhDong], [Code], [CheckHanhDong]) VALUES (N'CTQ005    ', N'MQ001     ', N'Xem dữ liệu', N'VIEW', 1)
INSERT [dbo].[DonHang] ([MaDonHang], [MaGD], [MaMoiMon], [SoLuong], [GiamGia], [TinhTrang], [TongTien]) VALUES (N'DH001     ', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DonHang] ([MaDonHang], [MaGD], [MaMoiMon], [SoLuong], [GiamGia], [TinhTrang], [TongTien]) VALUES (N'DH002     ', N'007       ', N'MM001     ', 5, 0, N'Đang giao', 265)
INSERT [dbo].[GiaoDich] ([MaGD], [TinhTrang], [MaTV], [TenNguoiNhan], [SDT], [DiaChi], [ThoiGianDat], [ThoiGianGiaoDuKien], [PhuongThucGD], [GhiChu], [MaKV], [LamTheTV], [FeeShip]) VALUES (N'001       ', NULL, N'TV006     ', N'Giải Liên Hoàn', 75862498, N'Quận 12', CAST(N'2020-04-28T13:23:44.000' AS DateTime), CAST(N'2020-04-20T15:45:21.000' AS DateTime), N'Tiền mặt', NULL, N'KV002     ', 1, NULL)
INSERT [dbo].[GiaoDich] ([MaGD], [TinhTrang], [MaTV], [TenNguoiNhan], [SDT], [DiaChi], [ThoiGianDat], [ThoiGianGiaoDuKien], [PhuongThucGD], [GhiChu], [MaKV], [LamTheTV], [FeeShip]) VALUES (N'002       ', NULL, NULL, N'Trần Văn Cẩm', 7578598, N'Quận Hoàng Sa', CAST(N'2020-04-28T13:23:44.000' AS DateTime), CAST(N'2020-04-20T15:45:21.000' AS DateTime), N'Tiền mặt', NULL, N'KV002     ', 1, NULL)
INSERT [dbo].[GiaoDich] ([MaGD], [TinhTrang], [MaTV], [TenNguoiNhan], [SDT], [DiaChi], [ThoiGianDat], [ThoiGianGiaoDuKien], [PhuongThucGD], [GhiChu], [MaKV], [LamTheTV], [FeeShip]) VALUES (N'003       ', NULL, NULL, N'Trần Văn Cẩm', 7578598, N'Quận Hoàng Sa', CAST(N'2020-04-28T13:23:44.000' AS DateTime), CAST(N'2020-04-20T15:45:21.000' AS DateTime), N'Tiền mặt', NULL, N'KV003     ', NULL, NULL)
INSERT [dbo].[GiaoDich] ([MaGD], [TinhTrang], [MaTV], [TenNguoiNhan], [SDT], [DiaChi], [ThoiGianDat], [ThoiGianGiaoDuKien], [PhuongThucGD], [GhiChu], [MaKV], [LamTheTV], [FeeShip]) VALUES (N'004       ', N'Hoàn thành', N'TV004     ', N'AAA', 123658, N'Trường Sa', CAST(N'2020-05-06T14:07:33.767' AS DateTime), CAST(N'2020-05-06T17:07:33.767' AS DateTime), N'Thẻ ATM', NULL, N'KV004     ', 1, NULL)
INSERT [dbo].[GiaoDich] ([MaGD], [TinhTrang], [MaTV], [TenNguoiNhan], [SDT], [DiaChi], [ThoiGianDat], [ThoiGianGiaoDuKien], [PhuongThucGD], [GhiChu], [MaKV], [LamTheTV], [FeeShip]) VALUES (N'007       ', NULL, NULL, N'AAA', 123658, N'Trường Sa', CAST(N'2020-05-06T20:46:38.960' AS DateTime), CAST(N'2020-05-06T23:46:38.960' AS DateTime), N'Thẻ ATM', NULL, N'KV004     ', 1, 20)
INSERT [dbo].[KhuVuc] ([MaKV], [MaTP], [TenKV]) VALUES (N'KV001     ', N'TP001     ', N'Quận Ninh Kiều')
INSERT [dbo].[KhuVuc] ([MaKV], [MaTP], [TenKV]) VALUES (N'KV002     ', N'TP002     ', N'Quận 8')
INSERT [dbo].[KhuVuc] ([MaKV], [MaTP], [TenKV]) VALUES (N'KV003     ', N'TP003     ', N'Quận Ngũ Hành Sơn')
INSERT [dbo].[KhuVuc] ([MaKV], [MaTP], [TenKV]) VALUES (N'KV004     ', N'TP004     ', N'Thành phố Vinh')
INSERT [dbo].[KhuVuc] ([MaKV], [MaTP], [TenKV]) VALUES (N'KV005     ', N'TP005     ', N'Quận Hoàn Kiếm')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM001     ', N'Món nước')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM002     ', N'Cơm')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM003     ', N'Gỏi')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM004     ', N'Bánh mặn')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM005     ', N'Món chay')
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon]) VALUES (N'LM006     ', N'Nước uống')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM001     ', N'Bún chả giò', N'LM001     ', 49, 59.0000, 49.0000, N'https://kenh14cdn.com/2018/3/31/anh-ba-3-1522515382689364607840.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM0010    ', N'Tàu hủ kho', N'LM005     ', 50, 59.0000, NULL, N'https://camnanggiadinh.com.vn/wp-content/uploads/2018/10/cach-che-bien-mon-dau-hu-kho-nam-an-la-nho-mai-1.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM0011    ', N'Nước lọc có ga', N'LM006     ', 70, 69.0000, NULL, N'https://cf.shopee.vn/file/dfc5560f924feebc1330df75bbd85c9f')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM0013    ', N'Cappuchino', N'LM006     ', 30, 69.0000, NULL, N'https://www.torani.com/sites/default/files/styles/torani_syrup_recipe_detail/public/recipes/illustration/Cappuccino%20with%20spice%20and%20beans_0.jpg?itok=1_nRwbzV')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM0014    ', N'Bloody Mary', N'LM006     ', 30, 159.0000, NULL, N'https://cdn.whatsgabycooking.com/wp-content/uploads/2019/09/Cholula-_-Summer-Bloody-Mary-9-copy-500x375.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM0015    ', N'Cosmopolitan ', N'LM006     ', 30, 159.0000, NULL, N'https://cdn.tasteatlas.com/images/ingredients/25e6db4c0f7a435ba26af7e7bc51cb60.jpg?w=600&h=450')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM002     ', N'Phở', N'LM001     ', 50, 59.0000, 49.0000, N'https://img-global.cpcdn.com/recipes/6824738c264d979d/751x532cq70/ph%E1%BB%9F-bo-vi%E1%BB%87t-nam-recipe-main-photo.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM003     ', N'Hủ Tiếu Nam Vang', N'LM001     ', 50, 59.0000, 49.0000, N'https://cdn.huongnghiepaau.com/wp-content/uploads/2019/01/hu-tieu-nam-vang-1.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM004     ', N'Cơm sườn', N'LM002     ', 50, 59.0000, 49.0000, N'https://media.cooky.vn/recipe/g5/47874/s480x480/recipe47874-cook-step5-636940316820312070.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM005     ', N'Cơm gà', N'LM002     ', 50, 59.0000, 49.0000, N'https://images.foody.vn/res/g11/105260/prof/s576x330/foody-upload-api-foody-mobile-com-jpg-180813103513.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM006     ', N'Cơm chiên hải sản', N'LM002     ', 50, 59.0000, 49.0000, N'https://shipdoandemff.com/wp-content/uploads/2017/06/com-chien-hai-san-nha-hang-shipdoandemFF.png')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM007     ', N'Gỏi thập cẩm', N'LM003     ', 20, 69.0000, 49.0000, N'https://congthucmonngon.com/wp-content/uploads/2020/04/cach-lam-goi-thap-cam-sieu-hap-dan-5Nylfh.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM008     ', N'Bánh bèo', N'LM004     ', 50, 29.0000, NULL, N'https://statics.vntrip.vn/data-v2/data-guide/img_content/1462768758_banh-beo-chen-1.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM009     ', N'Bánh xèo', N'LM004     ', 50, 69.0000, NULL, N'https://thucthan.com/media/2018/06/banh-xeo/banh-xeo.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM010     ', N'Cơm cháy', NULL, 5, 25000.0000, NULL, N'https://media.cooky.vn/recipe/g5/48025/s/recipe48025-cook-step5-636961077502873943.jpg')
INSERT [dbo].[MoiMon] ([MaMoiMon], [TenMoiMon], [MaLoaiMon], [SoLuongConLai], [DonGia], [GiamGia], [ImgLink]) VALUES (N'MM011     ', N'Chè thái', NULL, 50, 30000.0000, NULL, N'https://bizweb.dktcdn.net/thumb/grande/100/134/673/products/5455549che-3-jpeg.jpg?v=1475805426357')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ001     ', N'Quản lý chung')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ002     ', N'Thêm')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ003     ', N'Sửa')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ004     ', N'Xóa')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ005     ', N'Cập nhật thông tin khách')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ006     ', N'Quản lý đơn hàng online')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ007     ', N'Thống kê')
INSERT [dbo].[QuyenHan] ([MaQuyen], [TenQuyenHan]) VALUES (N'MQ008     ', N'Xem dữ liệu')
INSERT [dbo].[TVAdnQuyenHan] ([Ma_User_Per], [MaQuyen], [MaTV], [licensed]) VALUES (N'UP001     ', N'MQ001     ', N'TV006     ', 1)
INSERT [dbo].[ThanhPho] ([MaTP], [TenTP]) VALUES (N'TP001     ', N'Cần Thơ')
INSERT [dbo].[ThanhPho] ([MaTP], [TenTP]) VALUES (N'TP002     ', N'Sài Gòn')
INSERT [dbo].[ThanhPho] ([MaTP], [TenTP]) VALUES (N'TP003     ', N'Đà Nẵng')
INSERT [dbo].[ThanhPho] ([MaTP], [TenTP]) VALUES (N'TP004     ', N'Nghệ An')
INSERT [dbo].[ThanhPho] ([MaTP], [TenTP]) VALUES (N'TP005     ', N'Hà Nội')
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV001     ', N'Bàn Tử', N'Cầu Ninh Kiều', 826789248, N'CN001     ', 98563225, CAST(N'1985-12-14' AS Date), N'bantu@gmail.com', N'123', CAST(N'2020-04-28' AS Date), 0, NULL, NULL)
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV003     ', N'A Ninh', N' đường Bạch Đằng', 28569471, N'CN003     ', 98856325, CAST(N'1990-06-25' AS Date), N'aninh@gmail.com', N'123', CAST(N'2020-04-20' AS Date), 9999, NULL, NULL)
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV004     ', N'Ngô Tà', N'đường Tràn Phú', 87795482, N'CN004     ', 88565832, CAST(N'1989-03-02' AS Date), N'ngota@gmail.com', N'123', CAST(N'2020-04-14' AS Date), 99999999, NULL, NULL)
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV005     ', N'Phan Tử', N'Hàng Bạc', 72489653, N'CN005     ', 99885632, CAST(N'1985-04-03' AS Date), N'phantu@gmail.com', N'123', CAST(N'2020-04-17' AS Date), 0, NULL, NULL)
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV006     ', N'Giải Liên Hoàn', N'Hàng Bạc', 72697854, N'CN002     ', 99852632, CAST(N'1975-05-17' AS Date), N'lienhoan@gmail.com', N'123', CAST(N'2020-04-26' AS Date), 0, NULL, NULL)
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV007     ', N'Lý Thanh Vân', NULL, NULL, NULL, NULL, NULL, N'lythanhvan@gmail.com', N'1236', NULL, NULL, NULL, N'MQ001     ')
INSERT [dbo].[ThanhVien] ([MaTV], [HoTen], [DiaChi], [SDT], [MaCN], [CMND], [NgaySinh], [User_Email], [User_Password], [Day_Create], [TichLuy], [MaKV], [MaQuyen]) VALUES (N'TV008     ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1236', NULL, NULL, NULL, NULL)
INSERT [dbo].[UuDai] ([MaUuDai], [TenUuDai], [DiemTichLuy], [NoiDung]) VALUES (N'UD001     ', N'Thành viên hạng GOLD, trên 5 triệu', 500000, N'Giảm 5%')
INSERT [dbo].[UuDai] ([MaUuDai], [TenUuDai], [DiemTichLuy], [NoiDung]) VALUES (N'UD002     ', N'Thành viên hạng Dimond, trên 20 triệu', 2000000, N'Giảm 10%')
ALTER TABLE [dbo].[ChiNhanh]  WITH CHECK ADD  CONSTRAINT [fk_CN_KV] FOREIGN KEY([MaKV])
REFERENCES [dbo].[KhuVuc] ([MaKV])
GO
ALTER TABLE [dbo].[ChiNhanh] CHECK CONSTRAINT [fk_CN_KV]
GO
ALTER TABLE [dbo].[ChiTietQuyen]  WITH CHECK ADD FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenHan] ([MaQuyen])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaGD])
REFERENCES [dbo].[GiaoDich] ([MaGD])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaMoiMon])
REFERENCES [dbo].[MoiMon] ([MaMoiMon])
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[GiaoDich]  WITH CHECK ADD  CONSTRAINT [fk_GD_KV] FOREIGN KEY([MaKV])
REFERENCES [dbo].[KhuVuc] ([MaKV])
GO
ALTER TABLE [dbo].[GiaoDich] CHECK CONSTRAINT [fk_GD_KV]
GO
ALTER TABLE [dbo].[KhuVuc]  WITH CHECK ADD FOREIGN KEY([MaTP])
REFERENCES [dbo].[ThanhPho] ([MaTP])
GO
ALTER TABLE [dbo].[MoiMon]  WITH CHECK ADD FOREIGN KEY([MaLoaiMon])
REFERENCES [dbo].[LoaiMon] ([MaLoaiMon])
GO
ALTER TABLE [dbo].[TVAdnQuyenHan]  WITH CHECK ADD FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenHan] ([MaQuyen])
GO
ALTER TABLE [dbo].[TVAdnQuyenHan]  WITH CHECK ADD FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD FOREIGN KEY([MaCN])
REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [fk_TV_KV] FOREIGN KEY([MaKV])
REFERENCES [dbo].[KhuVuc] ([MaKV])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [fk_TV_KV]
GO
ALTER TABLE [dbo].[ThanhVien]  WITH CHECK ADD  CONSTRAINT [fk_TV_QH] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenHan] ([MaQuyen])
GO
ALTER TABLE [dbo].[ThanhVien] CHECK CONSTRAINT [fk_TV_QH]
GO
ALTER TABLE [dbo].[UuDaiChoThanhVien]  WITH CHECK ADD FOREIGN KEY([MaTV])
REFERENCES [dbo].[ThanhVien] ([MaTV])
GO
ALTER TABLE [dbo].[UuDaiChoThanhVien]  WITH CHECK ADD FOREIGN KEY([MaUD])
REFERENCES [dbo].[UuDai] ([MaUuDai])
GO
/****** Object:  StoredProcedure [dbo].[USP_Add_KV]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Add_KV]

	--@TenTP nvarchar(50),
	@TenKV nvarchar(50)

as
begin
	if(dbo.UF_ChangeMaKV(@TenKV) is null)
		insert into KhuVuc values (dbo.Chect_AutoKV(),null,@TenKV)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_MoiMon]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ADD_MoiMon]
   @TenSP nvarchar(50),
   @GiaTien int,
   @SL int,
   @img nvarchar(50)
as
begin	


	insert into MoiMon(MaMoiMon,TenMoiMon,DonGia,SoLuongConLai,ImgLink) values (dbo.Chect_AutoMoiMon(),@TenSP,@GiaTien,@SL,@img )
		
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Add_TP]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Add_TP]

@TenTP nvarchar(50)
	
as
begin
	if(dbo.UF_CheckMTP(@TenTP) is null)
		insert into ThanhPho values (dbo.Chect_AutoTP(),@TenTP)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_TV]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ADD_TV]
    @HoTen nvarchar(50), 
	@DiaChi nvarchar(50), 
	@SDT int, 
	@TenCN nvarchar(50),
	@CMND int, 
	@NgaySinh date, 
	@User_Email varchar(32), 
	@User_Password varchar(32) ,
	@TenKV nvarchar(50)	
as
begin	
	declare @Day_Create date
	set @Day_Create = GETDATE()
--	insert into ThanhVien(MaTV) values (dbo.Chect_AutoTV ()) -- Thêm mã thành viên auto
	--	declare @MaKV char(10)

/*	if(dbo.UF_ChangeMaKV(@TenCN) = 'True')
	begin
		set @MaKV = (select MaKV from KhuVuc where TenKV = @TenKV)
	end
	*/
	insert into ThanhVien(MaTV,HoTen,DiaChi,SDT,MaCN,CMND,NgaySinh,User_Email,User_Password,Day_Create,TichLuy,MaKV) values (dbo.Chect_AutoTV(),@HoTen,@DiaChi,@SDT,dbo.UF_ChangeMaCN(@TenCN),@CMND,@NgaySinh,@User_Email,@User_Password,@Day_Create,0,dbo.UF_ChangeMaKV(@TenKV) )
		
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GiaoDich_AddNew]    Script Date: 14/05/2020 3:53:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GiaoDich_AddNew]
--	@Status nvarchar(50),
	@MaTV char(10),  -- Mã thành viên sẽ được hiển thị trong giao diện profile
	@HoTen nvarchar(50),
	@SDT int,
	@DiaChi nvarchar(50), -- Số nhà
	@PhuongThucGD nvarchar(32),
	@TenKV nvarchar(50),
	@GhiChu nvarchar(100),
	@TheTV bit
as
begin
	declare @ThoiGianDat datetime
	set @ThoiGianDat = GETDATE()
	declare @MaGD char(5)
	set @MaGD = (select top 1 MaGD from GiaoDich order by MaGD desc)
	insert into GiaoDich values (dbo.Chect_AutoGiaoDich(),null, @MaTV, @HoTen, @SDT, @DiaChi, @ThoiGianDat,dbo.UF_Set_Date(),@PhuongThucGD,@GhiChu,dbo.UF_ChangeMaKV(@TenKV),@TheTV,dbo.UF_Check_feeShip(dbo.UF_ChangeMaKV(@TenKV),@MaGD) )
end
GO
USE [master]
GO
ALTER DATABASE [HuongVietResto] SET  READ_WRITE 
GO
