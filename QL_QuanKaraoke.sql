USE [master]
GO
/****** Object:  Database [QuanLyQuanKaraoke]    Script Date: 10/8/2019 9:37:46 AM ******/
CREATE DATABASE [QuanLyQuanKaraoke]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanKaraoke', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyQuanKaraoke.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanKaraoke_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\QuanLyQuanKaraoke_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanKaraoke].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyQuanKaraoke', N'ON'
GO
USE [QuanLyQuanKaraoke]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHD] [varchar](10) NOT NULL,
	[MaDV] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DVT] [nvarchar](10) NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHD_Tam]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTHD_Tam](
	[MaPV] [varchar](10) NOT NULL,
	[MaDV] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonViTinh] [nvarchar](10) NULL,
 CONSTRAINT [PK_CTHD_Tam] PRIMARY KEY CLUSTERED 
(
	[MaPV] ASC,
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTPN_DichVu]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTPN_DichVu](
	[MaPN_DichVu] [varchar](10) NOT NULL,
	[MaDichVu] [varchar](10) NOT NULL,
	[SL_DichVuNhap] [int] NULL,
	[DG_DichVuNhap] [float] NULL,
	[DVT_DichVuNhap] [nvarchar](15) NULL,
 CONSTRAINT [PK_CTPN_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaPN_DichVu] ASC,
	[MaDichVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTPN_ThietBi]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTPN_ThietBi](
	[MaPN_ThietBi] [varchar](10) NOT NULL,
	[MaTB] [varchar](10) NOT NULL,
	[SL_ThietBiNhap] [int] NULL,
	[DG_ThietBiNhap] [float] NULL,
 CONSTRAINT [PK_CTPN_ThietBi] PRIMARY KEY CLUSTERED 
(
	[MaPN_ThietBi] ASC,
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatPhong]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatPhong](
	[MaDatPhong] [varchar](10) NOT NULL,
	[MaPhong] [varchar](10) NULL,
	[TenKhachDat] [nvarchar](50) NULL,
	[SDT_Khach] [char](10) NULL,
	[GioNhanPhong] [datetime] NULL,
	[TienCoc] [int] NULL,
 CONSTRAINT [PK_DatPhong] PRIMARY KEY CLUSTERED 
(
	[MaDatPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DichVu](
	[MaDV] [varchar](10) NOT NULL,
	[TenDichVu] [nvarchar](30) NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [float] NULL,
	[DonGiaBan] [float] NULL,
	[DVT] [nvarchar](15) NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DoThatLac]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoThatLac](
	[MaPhong] [varchar](10) NOT NULL,
	[NgayGio] [datetime] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_DoThatLac] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC,
	[NgayGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](10) NOT NULL,
	[SDT_KhachHang] [char](10) NULL,
	[MaPhong] [varchar](10) NULL,
	[MaNV] [varchar](10) NULL,
	[GioBatDau] [datetime] NULL,
	[GioKetThuc] [datetime] NULL,
	[MaPhuThu] [varchar](10) NULL,
	[TienCoc] [int] NULL,
	[KhuyenMai] [int] NULL,
	[TienDenBu] [float] NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_Hoa_Don] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDon_Tam]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon_Tam](
	[MaPhucVu] [varchar](10) NOT NULL,
	[MaPhong] [varchar](10) NOT NULL,
	[SDT_KH] [char](10) NOT NULL,
	[GioBD] [datetime] NOT NULL,
 CONSTRAINT [PK_HoaDon_Tam_1] PRIMARY KEY CLUSTERED 
(
	[MaPhucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[TenKH] [nvarchar](50) NULL,
	[SDT] [char](10) NOT NULL,
	[TichDiem] [int] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLoaiPhong] [varchar](10) NOT NULL,
	[TenLoaiPhong] [nvarchar](10) NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[MaLoaiPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [char](10) NULL,
	[CMND] [char](10) NULL,
	[NgayVaoLam] [date] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieNhap] [varchar](10) NOT NULL,
	[MaNhanVien] [varchar](10) NULL,
	[NgayNhap] [date] NULL,
	[TongPN] [float] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [varchar](10) NOT NULL,
	[MaLoaiPhong] [varchar](10) NULL,
	[GiaPhong] [float] NULL,
	[TinhTrang] [nvarchar](20) NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhuThu]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhuThu](
	[MaPhuThu] [varchar](10) NOT NULL,
	[TenPhuThu] [nvarchar](30) NULL,
	[SoTien] [int] NULL,
 CONSTRAINT [PK_PhuThu] PRIMARY KEY CLUSTERED 
(
	[MaPhuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_ChucNang]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_ChucNang](
	[MaChucNang] [varchar](10) NOT NULL,
	[TenChucNang] [nvarchar](40) NULL,
 CONSTRAINT [PK_QL_ChucNang] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_NhomNguoiDung]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_NhomNguoiDung](
	[MaNhom] [varchar](10) NOT NULL,
	[TenNhom] [nvarchar](15) NULL,
	[GhiChu] [nvarchar](30) NULL,
 CONSTRAINT [PK_QL_NhomNguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_PhanQuyen]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_PhanQuyen](
	[MaNhomNguoiDung] [varchar](10) NOT NULL,
	[MaChucNang] [varchar](10) NOT NULL,
	[CoQuyen] [bit] NOT NULL,
 CONSTRAINT [PK_QL_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaNhomNguoiDung] ASC,
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_PhanQuyenTaiKhoan]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_PhanQuyenTaiKhoan](
	[TenDN] [varchar](10) NOT NULL,
	[MaCN] [varchar](10) NOT NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_QL_PhanQuyenTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDN] ASC,
	[MaCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QL_TaiKhoan]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QL_TaiKhoan](
	[TenDangNhap] [varchar](10) NOT NULL,
	[MatKhau] [varchar](20) NULL,
	[MaNV] [varchar](10) NULL,
	[HoatDong] [bit] NOT NULL,
	[NhomNguoiDung] [varchar](10) NULL,
 CONSTRAINT [PK_QL_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThietBi]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThietBi](
	[MaThietBi] [varchar](10) NOT NULL,
	[TenThietBi] [nvarchar](40) NULL,
	[SoLuong] [int] NULL,
	[Gia] [float] NULL,
 CONSTRAINT [PK_ThietBi] PRIMARY KEY CLUSTERED 
(
	[MaThietBi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThietBi_Phong]    Script Date: 10/8/2019 9:37:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThietBi_Phong](
	[MaPhong] [varchar](10) NOT NULL,
	[MaThietBi] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ThietBi_Phong] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC,
	[MaThietBi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaDV], [SoLuong], [DVT], [ThanhTien]) VALUES (N'HD001', N'DV001', 2, N'Đĩa', 100000)
INSERT [dbo].[ChiTietHoaDon] ([MaHD], [MaDV], [SoLuong], [DVT], [ThanhTien]) VALUES (N'HD001', N'DV002', 3, N'Lon', 36000)
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'102', N'DV001', 0, N'Thêm')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'102', N'DV004', 0, N'Thêm')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'102', N'DV007', 0, N'Thêm')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'203', N'DV001', 0, N'Thêm')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'203', N'DV002', 0, N'Thêm')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'PV0001', N'DV001', 3, N'Đĩa')
INSERT [dbo].[CTHD_Tam] ([MaPV], [MaDV], [SoLuong], [DonViTinh]) VALUES (N'PV0001', N'DV004', 5, N'Chai')
INSERT [dbo].[CTPN_DichVu] ([MaPN_DichVu], [MaDichVu], [SL_DichVuNhap], [DG_DichVuNhap], [DVT_DichVuNhap]) VALUES (N'PN002', N'DV001', 5, 500000, N'Đĩa')
INSERT [dbo].[CTPN_ThietBi] ([MaPN_ThietBi], [MaTB], [SL_ThietBiNhap], [DG_ThietBiNhap]) VALUES (N'PN001', N'TB01', 1, 1000000)
INSERT [dbo].[DatPhong] ([MaDatPhong], [MaPhong], [TenKhachDat], [SDT_Khach], [GioNhanPhong], [TienCoc]) VALUES (N'DP001', N'302', NULL, N'0953787628', CAST(0x0000AAAF00D0AA6F AS DateTime), 100000)
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV001', N'Đĩa Trái Cây', 50, 35000, 50000, N'Đĩa')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV002', N'Sting', 100, 10000, 14000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV003', N'Cocacola', 100, 10000, 14000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV004', N'Nước Suối', 100, 8000, 10000, N'Chai')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV005', N'7up', 100, 10000, 12000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV006', N'Snack', 80, 8000, 8000, N'Bịch')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV007', N'Đậu Phộng', 50, 7000, 10000, N'Bịch')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV008', N'Bia Sài Gòn', 100, 14000, 16000, N'Chai')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV009', N'Bia Heniken', 100, 15000, 17000, N'Chai')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV010', N'Bia Tiger', 100, 16000, 18000, N'Chai')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV011', N'Bia 333', 100, 14000, 16000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV012', N'Pepsi', 100, 10000, 12000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV013', N'Redbull', 100, 13000, 15000, N'Lon')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV014', N'Trà ô long', 100, 12000, 14000, N'Chai')
INSERT [dbo].[DichVu] ([MaDV], [TenDichVu], [SoLuong], [DonGiaNhap], [DonGiaBan], [DVT]) VALUES (N'DV015', N'Trà C2', 100, 10000, 12000, N'Chai')
INSERT [dbo].[DoThatLac] ([MaPhong], [NgayGio], [GhiChu]) VALUES (N'101', CAST(0x0000AAAF00D0AA6F AS DateTime), N'điện thoại samsung')
INSERT [dbo].[DoThatLac] ([MaPhong], [NgayGio], [GhiChu]) VALUES (N'103', CAST(0x0000AAC4008EBF6F AS DateTime), N'túi xách')
INSERT [dbo].[HoaDon] ([MaHD], [SDT_KhachHang], [MaPhong], [MaNV], [GioBatDau], [GioKetThuc], [MaPhuThu], [TienCoc], [KhuyenMai], [TienDenBu], [TongTien]) VALUES (N'HD001', N'0368728719', N'101', N'NV001', CAST(0x0000AAAF00D0AA6F AS DateTime), CAST(0x0000AAAF00F19FEF AS DateTime), N'PT01', 0, 0, 0, 700000)
INSERT [dbo].[HoaDon] ([MaHD], [SDT_KhachHang], [MaPhong], [MaNV], [GioBatDau], [GioKetThuc], [MaPhuThu], [TienCoc], [KhuyenMai], [TienDenBu], [TongTien]) VALUES (N'HD002', N'0783482688', N'302', N'NV001', CAST(0x0000AAB000685EC0 AS DateTime), CAST(0x0000AAB00099CF00 AS DateTime), N'PT01', 0, 0, 0, 1000000)
INSERT [dbo].[HoaDon_Tam] ([MaPhucVu], [MaPhong], [SDT_KH], [GioBD]) VALUES (N'102', N'102', N'0368728719', CAST(0x0000AADB00DBE99D AS DateTime))
INSERT [dbo].[HoaDon_Tam] ([MaPhucVu], [MaPhong], [SDT_KH], [GioBD]) VALUES (N'203', N'203', N'0368728719', CAST(0x0000AADB00DB2583 AS DateTime))
INSERT [dbo].[HoaDon_Tam] ([MaPhucVu], [MaPhong], [SDT_KH], [GioBD]) VALUES (N'PV0001', N'104', N'0368728719', CAST(0x0000AACE00D0AA6F AS DateTime))
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Phương', N'0368728719', 1)
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Long', N'0783482688', 1)
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Nhất', N'0794881672', 1)
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Lâm', N'0799746176', 1)
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Hiền', N'0977826513', 2)
INSERT [dbo].[KhachHang] ([TenKH], [SDT], [TichDiem]) VALUES (N'Đạt', N'0984618732', 1)
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong]) VALUES (N'LP01', N'VIP')
INSERT [dbo].[LoaiPhong] ([MaLoaiPhong], [TenLoaiPhong]) VALUES (N'LP02', N'Thường')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [DiaChi], [SDT], [CMND], [NgayVaoLam]) VALUES (N'NV001', N'Phan Văn Thắng', N'Nam', N'Hà Nội', N'0373388698', N'251148298 ', CAST(0x2A3F0B00 AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [DiaChi], [SDT], [CMND], [NgayVaoLam]) VALUES (N'NV002', N'Phạm Văn Hiệp', N'Nam', N'TP.HCM', N'0363789978', N'251164789 ', CAST(0x603F0B00 AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [DiaChi], [SDT], [CMND], [NgayVaoLam]) VALUES (N'NV003', N'Trần Thị Lan', N'Nữ', N'TP.HCM', N'0986725481', N'217839036 ', CAST(0x373F0B00 AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [DiaChi], [SDT], [CMND], [NgayVaoLam]) VALUES (N'NV004', N'Nguyễn Trần Lan Anh', N'Nữ', N'TP.HCM', N'0749263718', N'201787426 ', CAST(0x573F0B00 AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [DiaChi], [SDT], [CMND], [NgayVaoLam]) VALUES (N'NV005', N'Lê Vũ Linh', N'Nam', N'TP.HCM', N'0973682369', N'308672819 ', CAST(0x6F3F0B00 AS Date))
INSERT [dbo].[PhieuNhap] ([MaPhieNhap], [MaNhanVien], [NgayNhap], [TongPN]) VALUES (N'PN001', N'NV001', CAST(0x2B3F0B00 AS Date), 1000000)
INSERT [dbo].[PhieuNhap] ([MaPhieNhap], [MaNhanVien], [NgayNhap], [TongPN]) VALUES (N'PN002', N'NV001', CAST(0x2A3F0B00 AS Date), 500000)
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'101', N'LP02', 2500, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'102', N'LP02', 2500, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'103', N'LP02', 2500, N'Đang Dọn')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'104', N'LP02', 2500, N'Bảo Trì')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'105', N'LP02', 2500, N'Đang Hát')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'201', N'LP02', 2500, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'202', N'LP02', 2500, N'Đang Dọn')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'203', N'LP02', 2500, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'204', N'LP02', 2500, N'Đang Hát')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'205', N'LP02', 2500, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'301', N'LP01', 4000, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'302', N'LP01', 4000, N'Đang Hát')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'303', N'LP01', 4000, N'Đang Dọn')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'304', N'LP01', 4000, N'Trống')
INSERT [dbo].[Phong] ([MaPhong], [MaLoaiPhong], [GiaPhong], [TinhTrang]) VALUES (N'305', N'LP01', 4000, N'Đang Hát')
INSERT [dbo].[PhuThu] ([MaPhuThu], [TenPhuThu], [SoTien]) VALUES (N'PT01', N'Thứ 2 -Thứ 6', 0)
INSERT [dbo].[PhuThu] ([MaPhuThu], [TenPhuThu], [SoTien]) VALUES (N'PT02', N'Thứ 7, Chủ Nhật', 50000)
INSERT [dbo].[PhuThu] ([MaPhuThu], [TenPhuThu], [SoTien]) VALUES (N'PT03', N'Ngày Lễ', 100000)
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN01', N'Hệ Thống - Hệ Thống')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN02', N'Hệ Thống - Chức Năng')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN03', N'Danh Mục Quản Lý -  Giao Ca')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN04', N'Danh Mục Quản Lý - Thu Chi')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN05', N'Danh Mục Quản Lý - QL Chung')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN06', N'Thiết Lập Ban Đầu - Quản Lý Chung')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN07', N'Thiết Lập Ban Đầu - Quản Lý Phòng')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN08', N'Báo Cáo Thống Kê - Báo Cáo')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN09', N'Báo Cáo Thống Kê - Quản Lý Kho')
INSERT [dbo].[QL_ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'CN10', N'Trợ Giúc')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'NHOM01', N'Quản Lý', NULL)
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'NHOM02', N'Tiếp Tân', NULL)
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'NHOM03', N'Nhân Viên Kho', NULL)
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'NHOM04', N'Nhân Viên Bếp', N'')
INSERT [dbo].[QL_NhomNguoiDung] ([MaNhom], [TenNhom], [GhiChu]) VALUES (N'NHOM05', N'Nhân Viên Kh', N'')
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN03', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN04', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN06', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN07', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN08', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN09', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM01', N'CN10', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN03', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN04', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN06', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN07', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN08', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN09', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM02', N'CN10', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN03', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN04', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN06', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN07', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN08', 0)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN09', 1)
INSERT [dbo].[QL_PhanQuyen] ([MaNhomNguoiDung], [MaChucNang], [CoQuyen]) VALUES (N'NHOM03', N'CN10', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN03', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN04', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN06', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN07', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN08', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN09', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin', N'CN10', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN03', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN04', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN06', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN07', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN08', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN09', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'admin1', N'CN10', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN01', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN02', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN03', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN04', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN05', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN06', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN07', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN08', 0)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN09', 1)
INSERT [dbo].[QL_PhanQuyenTaiKhoan] ([TenDN], [MaCN], [Quyen]) VALUES (N'nhan', N'CN10', 1)
INSERT [dbo].[QL_TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV], [HoatDong], [NhomNguoiDung]) VALUES (N'admin', N'1', N'NV001', 1, N'NHOM01')
INSERT [dbo].[QL_TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV], [HoatDong], [NhomNguoiDung]) VALUES (N'admin1', N'1', N'NV004', 1, N'NHOM02')
INSERT [dbo].[QL_TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV], [HoatDong], [NhomNguoiDung]) VALUES (N'nhan', N'11111', N'NV005', 1, N'NHOM03')
INSERT [dbo].[QL_TaiKhoan] ([TenDangNhap], [MatKhau], [MaNV], [HoatDong], [NhomNguoiDung]) VALUES (N'nhanvien', N'11111', N'NV003', 1, N'NHOM02')
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB01', N'TIVI 40 inch', 20, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB02', N'TIVI 50 inch', 6, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB03', N'Máy Lạnh', 20, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB04', N'Bàn', 30, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB05', N'Ghế sofa dài', 45, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB06', N'Ghế sofa đơn', 40, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB07', N'Mic có dây', 30, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB08 ', N'Mic không dây', 30, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB09', N'Quạt Trần', 15, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB10', N'Loa', 40, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB11', N'Đầu Hát Karaoke', 20, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB12', N'Màn Hình Cảm Ứng', 20, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB13', N'Máy Tính Bảng', 20, NULL)
INSERT [dbo].[ThietBi] ([MaThietBi], [TenThietBi], [SoLuong], [Gia]) VALUES (N'TB14', N'Đèn Trang Trí', 50, NULL)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB03', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB06', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB07', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB10', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'101', N'TB14', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB03', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB05', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB06', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB07', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB10', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'102', N'TB14', 4)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB03', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB07', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB08', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB10', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'103', N'TB14', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB03', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB05', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB06', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB07', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'104', N'TB14', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB03', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB07', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'105', N'TB14', 4)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB01', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB02', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB03', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB04', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB08', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'301', N'TB14', 5)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB02', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB03', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB05', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB06', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB08', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'302', N'TB14', 5)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB02', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB03', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB05', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB06', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB08', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'303', N'TB14', 5)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB02', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB03', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB08', 3)
GO
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'304', N'TB14', 5)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB02', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB03', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB04', 2)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB05', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB08', 3)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB09', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB10', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB11', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB12', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB13', 1)
INSERT [dbo].[ThietBi_Phong] ([MaPhong], [MaThietBi], [SoLuong]) VALUES (N'305', N'TB14', 5)
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_DichVu]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_Hoa_Don] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_Hoa_Don]
GO
ALTER TABLE [dbo].[CTHD_Tam]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_Tam_DichVu] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[CTHD_Tam] CHECK CONSTRAINT [FK_CTHD_Tam_DichVu]
GO
ALTER TABLE [dbo].[CTHD_Tam]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_Tam_HoaDon_Tam] FOREIGN KEY([MaPV])
REFERENCES [dbo].[HoaDon_Tam] ([MaPhucVu])
GO
ALTER TABLE [dbo].[CTHD_Tam] CHECK CONSTRAINT [FK_CTHD_Tam_HoaDon_Tam]
GO
ALTER TABLE [dbo].[CTPN_DichVu]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_DichVu_DichVu] FOREIGN KEY([MaDichVu])
REFERENCES [dbo].[DichVu] ([MaDV])
GO
ALTER TABLE [dbo].[CTPN_DichVu] CHECK CONSTRAINT [FK_CTPN_DichVu_DichVu]
GO
ALTER TABLE [dbo].[CTPN_DichVu]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_DichVu_PhieuNhap] FOREIGN KEY([MaPN_DichVu])
REFERENCES [dbo].[PhieuNhap] ([MaPhieNhap])
GO
ALTER TABLE [dbo].[CTPN_DichVu] CHECK CONSTRAINT [FK_CTPN_DichVu_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPN_ThietBi]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_ThietBi_PhieuNhap] FOREIGN KEY([MaPN_ThietBi])
REFERENCES [dbo].[PhieuNhap] ([MaPhieNhap])
GO
ALTER TABLE [dbo].[CTPN_ThietBi] CHECK CONSTRAINT [FK_CTPN_ThietBi_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPN_ThietBi]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_ThietBi_ThietBi] FOREIGN KEY([MaTB])
REFERENCES [dbo].[ThietBi] ([MaThietBi])
GO
ALTER TABLE [dbo].[CTPN_ThietBi] CHECK CONSTRAINT [FK_CTPN_ThietBi_ThietBi]
GO
ALTER TABLE [dbo].[DatPhong]  WITH CHECK ADD  CONSTRAINT [FK_DatPhong_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[DatPhong] CHECK CONSTRAINT [FK_DatPhong_Phong]
GO
ALTER TABLE [dbo].[DoThatLac]  WITH CHECK ADD  CONSTRAINT [FK_DoThatLac_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[DoThatLac] CHECK CONSTRAINT [FK_DoThatLac_Phong]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Hoa_Don_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_Hoa_Don_PhuThu] FOREIGN KEY([MaPhuThu])
REFERENCES [dbo].[PhuThu] ([MaPhuThu])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_Hoa_Don_PhuThu]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([SDT_KhachHang])
REFERENCES [dbo].[KhachHang] ([SDT])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Phong]
GO
ALTER TABLE [dbo].[HoaDon_Tam]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Tam_KhachHang] FOREIGN KEY([SDT_KH])
REFERENCES [dbo].[KhachHang] ([SDT])
GO
ALTER TABLE [dbo].[HoaDon_Tam] CHECK CONSTRAINT [FK_HoaDon_Tam_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon_Tam]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Tam_Phong1] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[HoaDon_Tam] CHECK CONSTRAINT [FK_HoaDon_Tam_Phong1]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNhanVien])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([MaLoaiPhong])
REFERENCES [dbo].[LoaiPhong] ([MaLoaiPhong])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_QL_ChucNang] FOREIGN KEY([MaChucNang])
REFERENCES [dbo].[QL_ChucNang] ([MaChucNang])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_QL_ChucNang]
GO
ALTER TABLE [dbo].[QL_PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoiDung] FOREIGN KEY([MaNhomNguoiDung])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_PhanQuyen] CHECK CONSTRAINT [FK_QL_PhanQuyen_QL_NhomNguoiDung]
GO
ALTER TABLE [dbo].[QL_PhanQuyenTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyenTaiKhoan_QL_ChucNang] FOREIGN KEY([MaCN])
REFERENCES [dbo].[QL_ChucNang] ([MaChucNang])
GO
ALTER TABLE [dbo].[QL_PhanQuyenTaiKhoan] CHECK CONSTRAINT [FK_QL_PhanQuyenTaiKhoan_QL_ChucNang]
GO
ALTER TABLE [dbo].[QL_PhanQuyenTaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_QL_PhanQuyenTaiKhoan_QL_TaiKhoan] FOREIGN KEY([TenDN])
REFERENCES [dbo].[QL_TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[QL_PhanQuyenTaiKhoan] CHECK CONSTRAINT [FK_QL_PhanQuyenTaiKhoan_QL_TaiKhoan]
GO
ALTER TABLE [dbo].[QL_TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_QL_TaiKhoan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[QL_TaiKhoan] CHECK CONSTRAINT [FK_QL_TaiKhoan_NhanVien]
GO
ALTER TABLE [dbo].[QL_TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_QL_TaiKhoan_QL_NhomNguoiDung] FOREIGN KEY([NhomNguoiDung])
REFERENCES [dbo].[QL_NhomNguoiDung] ([MaNhom])
GO
ALTER TABLE [dbo].[QL_TaiKhoan] CHECK CONSTRAINT [FK_QL_TaiKhoan_QL_NhomNguoiDung]
GO
ALTER TABLE [dbo].[ThietBi_Phong]  WITH CHECK ADD  CONSTRAINT [FK_ThietBi_Phong_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[ThietBi_Phong] CHECK CONSTRAINT [FK_ThietBi_Phong_Phong]
GO
ALTER TABLE [dbo].[ThietBi_Phong]  WITH CHECK ADD  CONSTRAINT [FK_ThietBi_Phong_ThietBi] FOREIGN KEY([MaThietBi])
REFERENCES [dbo].[ThietBi] ([MaThietBi])
GO
ALTER TABLE [dbo].[ThietBi_Phong] CHECK CONSTRAINT [FK_ThietBi_Phong_ThietBi]
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanKaraoke] SET  READ_WRITE 
GO
