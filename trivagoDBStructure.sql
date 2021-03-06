USE [master]
GO
/****** Object:  Database [TrivagoDB]    Script Date: 2/9/2019 8:43:51 PM ******/
CREATE DATABASE [TrivagoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrivagoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BETULMSSQL\MSSQL\DATA\TrivagoDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrivagoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.BETULMSSQL\MSSQL\DATA\TrivagoDB_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrivagoDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrivagoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrivagoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrivagoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrivagoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrivagoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrivagoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrivagoDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrivagoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrivagoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrivagoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrivagoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrivagoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrivagoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrivagoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrivagoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrivagoDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TrivagoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrivagoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrivagoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrivagoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrivagoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrivagoDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrivagoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrivagoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TrivagoDB] SET  MULTI_USER 
GO
ALTER DATABASE [TrivagoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrivagoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrivagoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrivagoDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TrivagoDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrivagoDB', N'ON'
GO
USE [TrivagoDB]
GO
/****** Object:  Table [dbo].[FiyatTarifeleri]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiyatTarifeleri](
	[FiyatTarifeID] [int] IDENTITY(1,1) NOT NULL,
	[OtelOdaDetayID] [int] NOT NULL,
	[Fiyat] [decimal](18, 0) NOT NULL,
	[GecerlilikBaslangicTarihi] [date] NOT NULL,
	[GecerlilikBitisTarihi] [date] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_FiyatTarifeleri] PRIMARY KEY CLUSTERED 
(
	[FiyatTarifeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Otel]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Otel](
	[OtelID] [int] IDENTITY(1,1) NOT NULL,
	[IlceID] [smallint] NOT NULL,
	[OtelAdi] [varchar](50) NOT NULL,
	[AcikAdres] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Otel] PRIMARY KEY CLUSTERED 
(
	[OtelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OtelHizmetTur]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelHizmetTur](
	[OtelID] [int] NOT NULL,
	[OtelHizmetTurID] [tinyint] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_OtelHizmetTur] PRIMARY KEY CLUSTERED 
(
	[OtelID] ASC,
	[OtelHizmetTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtelOdaDetay]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OtelOdaDetay](
	[OtelOdaDetayID] [int] IDENTITY(1,1) NOT NULL,
	[OtelID] [int] NOT NULL,
	[OdaTurID] [tinyint] NOT NULL,
	[OdaNumarasi] [varchar](20) NOT NULL,
	[YatakSayisi] [tinyint] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_OtelOdaDetay] PRIMARY KEY CLUSTERED 
(
	[OtelOdaDetayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OtelOzellikleri]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelOzellikleri](
	[OtelID] [int] NOT NULL,
	[OtelOzellikID] [smallint] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_OtelOzellikleri] PRIMARY KEY CLUSTERED 
(
	[OtelID] ASC,
	[OtelOzellikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtelPuan]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OtelPuan](
	[OtelPuanID] [int] IDENTITY(1,1) NOT NULL,
	[OtelID] [int] NOT NULL,
	[UyeID] [int] NOT NULL,
	[PuanTurID] [tinyint] NOT NULL,
	[Puan] [tinyint] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_OtelPuan] PRIMARY KEY CLUSTERED 
(
	[OtelPuanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OtelYorum]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OtelYorum](
	[OtelYorumID] [int] IDENTITY(1,1) NOT NULL,
	[OtelID] [int] NOT NULL,
	[UyeID] [int] NOT NULL,
	[Yorum] [varchar](500) NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_OtelYorum] PRIMARY KEY CLUSTERED 
(
	[OtelYorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rezervasyon]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervasyon](
	[RezervasyonID] [int] IDENTITY(1,1) NOT NULL,
	[OtelOdaDetayID] [int] NOT NULL,
	[RezervasyonDurumID] [tinyint] NOT NULL,
	[UyeID] [int] NOT NULL,
	[GirisTarihi] [date] NOT NULL,
	[CikisTarihi] [date] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_Rezervasyon] PRIMARY KEY CLUSTERED 
(
	[RezervasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RezervasyonIptal]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RezervasyonIptal](
	[RezervasyonIptalID] [int] IDENTITY(1,1) NOT NULL,
	[RezervasyonID] [int] NOT NULL,
	[IptalNedenID] [smallint] NULL,
	[Aciklama] [varchar](500) NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_RezervasyonIptal] PRIMARY KEY CLUSTERED 
(
	[RezervasyonIptalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[SatisID] [int] IDENTITY(1,1) NOT NULL,
	[RezervasyonID] [int] NOT NULL,
	[ToplamTutar] [decimal](18, 0) NOT NULL,
	[SatisTarihi] [date] NOT NULL,
 CONSTRAINT [PK_Satis] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SatisDetay]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatisDetay](
	[SatisID] [int] NOT NULL,
	[OdemeTurID] [tinyint] NOT NULL,
	[Tutar] [decimal](18, 0) NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
 CONSTRAINT [PK_SatisDetay] PRIMARY KEY CLUSTERED 
(
	[SatisID] ASC,
	[OdemeTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblT_HizmetTur]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_HizmetTur](
	[OtelHizmetTurID] [tinyint] IDENTITY(1,1) NOT NULL,
	[OtelHizmetTur] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblT_HizmetTur] PRIMARY KEY CLUSTERED 
(
	[OtelHizmetTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_Il]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_Il](
	[IlId] [tinyint] NOT NULL,
	[IlAdi] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblT_Il] PRIMARY KEY CLUSTERED 
(
	[IlId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_Ilce]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_Ilce](
	[IlceID] [smallint] IDENTITY(1,1) NOT NULL,
	[IlId] [tinyint] NOT NULL,
	[IlceAdi] [varchar](50) NOT NULL,
	[PostaKodu] [char](5) NOT NULL,
 CONSTRAINT [PK_tblT_Ilce] PRIMARY KEY CLUSTERED 
(
	[IlceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_OdaTuru]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_OdaTuru](
	[OdaTurID] [tinyint] NOT NULL,
	[OdaTuru] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblT_OdaTuru] PRIMARY KEY CLUSTERED 
(
	[OdaTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_OdemeTuru]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_OdemeTuru](
	[OdemeTurID] [tinyint] IDENTITY(1,1) NOT NULL,
	[OdemeTuru] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblT_OdemeTuru] PRIMARY KEY CLUSTERED 
(
	[OdemeTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_OtelOzellikleri]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_OtelOzellikleri](
	[OtelOzellikID] [smallint] IDENTITY(1,1) NOT NULL,
	[OtelOzelligi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblT_OtelOzellikleri] PRIMARY KEY CLUSTERED 
(
	[OtelOzellikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_PuanTur]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_PuanTur](
	[PuanTurID] [tinyint] IDENTITY(1,1) NOT NULL,
	[PuanTur] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblT_PuanTur] PRIMARY KEY CLUSTERED 
(
	[PuanTurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_RezervasyonDurum]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_RezervasyonDurum](
	[RezervasyonDurumID] [tinyint] IDENTITY(1,1) NOT NULL,
	[RezervasyonDurum] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblT_RezervasyonDurum] PRIMARY KEY CLUSTERED 
(
	[RezervasyonDurumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblT_RezervasyonIptalNeden]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblT_RezervasyonIptalNeden](
	[IptalNedenID] [smallint] IDENTITY(1,1) NOT NULL,
	[IptalNedeni] [varchar](100) NULL,
 CONSTRAINT [PK_tblT_RezervasyonIptalNeden] PRIMARY KEY CLUSTERED 
(
	[IptalNedenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UyeGirisBilgileri]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UyeGirisBilgileri](
	[UyeGirisBilgiID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NOT NULL,
	[KullaniciAdi] [char](10) NOT NULL,
	[Sifre] [char](10) NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_UyeGirisBilgileri] PRIMARY KEY CLUSTERED 
(
	[UyeGirisBilgiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UyeIletisim]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UyeIletisim](
	[UyeIletisimID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NOT NULL,
	[IlceID] [smallint] NOT NULL,
	[Telefon] [char](10) NOT NULL,
	[EMail] [varchar](50) NOT NULL,
	[AcikAdres] [varchar](250) NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_UyeIletisim] PRIMARY KEY CLUSTERED 
(
	[UyeIletisimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 2/9/2019 8:43:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[UyeAdi] [varchar](50) NOT NULL,
	[UyeSoyadi] [varchar](50) NOT NULL,
	[PasaportNo] [char](15) NULL,
	[Cinsiyet] [bit] NOT NULL,
	[DogumTarihi] [date] NOT NULL,
	[OlusturulmaTarihi] [datetime] NOT NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[AktifMi] [bit] NOT NULL,
 CONSTRAINT [PK_Uyeler] PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tblT_Il] ([IlId], [IlAdi]) VALUES (1, N'Adana')
INSERT [dbo].[tblT_Il] ([IlId], [IlAdi]) VALUES (34, N'Istanbul')
INSERT [dbo].[tblT_Il] ([IlId], [IlAdi]) VALUES (77, N'Yalova')
SET IDENTITY_INSERT [dbo].[tblT_Ilce] ON 

INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (1, 34, N'Kadiköy', N'34652')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (2, 34, N'Besiktas', N'34856')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (3, 34, N'Maltepe', N'34741')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (4, 77, N'Merkez', N'77896')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (5, 77, N'Çinarcik', N'77412')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (6, 1, N'Merkez', N'01478')
INSERT [dbo].[tblT_Ilce] ([IlceID], [IlId], [IlceAdi], [PostaKodu]) VALUES (7, 1, N'Ceyhan', N'01652')
SET IDENTITY_INSERT [dbo].[tblT_Ilce] OFF
ALTER TABLE [dbo].[FiyatTarifeleri] ADD  CONSTRAINT [DF_FiyatTarifeleri_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[OtelHizmetTur] ADD  CONSTRAINT [DF_OtelHizmetTur_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[OtelOdaDetay] ADD  CONSTRAINT [DF_OtelOdaDetay_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[OtelOzellikleri] ADD  CONSTRAINT [DF_OtelOzellikleri_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[OtelPuan] ADD  CONSTRAINT [DF_OtelPuan_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[OtelYorum] ADD  CONSTRAINT [DF_OtelYorum_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[Rezervasyon] ADD  CONSTRAINT [DF_Rezervasyon_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[RezervasyonIptal] ADD  CONSTRAINT [DF_RezervasyonIptal_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[UyeGirisBilgileri] ADD  CONSTRAINT [DF_UyeGirisBilgileri_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[UyeIletisim] ADD  CONSTRAINT [DF_UyeIletisim_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[Uyeler] ADD  CONSTRAINT [DF_Uyeler_AktifMi]  DEFAULT ((1)) FOR [AktifMi]
GO
ALTER TABLE [dbo].[FiyatTarifeleri]  WITH CHECK ADD  CONSTRAINT [FK_FiyatTarifeleri_OtelOdaDetay] FOREIGN KEY([OtelOdaDetayID])
REFERENCES [dbo].[OtelOdaDetay] ([OtelOdaDetayID])
GO
ALTER TABLE [dbo].[FiyatTarifeleri] CHECK CONSTRAINT [FK_FiyatTarifeleri_OtelOdaDetay]
GO
ALTER TABLE [dbo].[Otel]  WITH CHECK ADD  CONSTRAINT [FK_Otel_tblT_Ilce] FOREIGN KEY([IlceID])
REFERENCES [dbo].[tblT_Ilce] ([IlceID])
GO
ALTER TABLE [dbo].[Otel] CHECK CONSTRAINT [FK_Otel_tblT_Ilce]
GO
ALTER TABLE [dbo].[OtelHizmetTur]  WITH CHECK ADD  CONSTRAINT [FK_OtelHizmetTur_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([OtelID])
GO
ALTER TABLE [dbo].[OtelHizmetTur] CHECK CONSTRAINT [FK_OtelHizmetTur_Otel]
GO
ALTER TABLE [dbo].[OtelHizmetTur]  WITH CHECK ADD  CONSTRAINT [FK_OtelHizmetTur_tblT_HizmetTur] FOREIGN KEY([OtelHizmetTurID])
REFERENCES [dbo].[tblT_HizmetTur] ([OtelHizmetTurID])
GO
ALTER TABLE [dbo].[OtelHizmetTur] CHECK CONSTRAINT [FK_OtelHizmetTur_tblT_HizmetTur]
GO
ALTER TABLE [dbo].[OtelOdaDetay]  WITH CHECK ADD  CONSTRAINT [FK_OtelOdaDetay_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([OtelID])
GO
ALTER TABLE [dbo].[OtelOdaDetay] CHECK CONSTRAINT [FK_OtelOdaDetay_Otel]
GO
ALTER TABLE [dbo].[OtelOdaDetay]  WITH CHECK ADD  CONSTRAINT [FK_OtelOdaDetay_tblT_OdaTuru] FOREIGN KEY([OdaTurID])
REFERENCES [dbo].[tblT_OdaTuru] ([OdaTurID])
GO
ALTER TABLE [dbo].[OtelOdaDetay] CHECK CONSTRAINT [FK_OtelOdaDetay_tblT_OdaTuru]
GO
ALTER TABLE [dbo].[OtelOzellikleri]  WITH CHECK ADD  CONSTRAINT [FK_OtelOzellikleri_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([OtelID])
GO
ALTER TABLE [dbo].[OtelOzellikleri] CHECK CONSTRAINT [FK_OtelOzellikleri_Otel]
GO
ALTER TABLE [dbo].[OtelOzellikleri]  WITH CHECK ADD  CONSTRAINT [FK_OtelOzellikleri_tblT_OtelOzellikleri] FOREIGN KEY([OtelOzellikID])
REFERENCES [dbo].[tblT_OtelOzellikleri] ([OtelOzellikID])
GO
ALTER TABLE [dbo].[OtelOzellikleri] CHECK CONSTRAINT [FK_OtelOzellikleri_tblT_OtelOzellikleri]
GO
ALTER TABLE [dbo].[OtelPuan]  WITH CHECK ADD  CONSTRAINT [FK_OtelPuan_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([OtelID])
GO
ALTER TABLE [dbo].[OtelPuan] CHECK CONSTRAINT [FK_OtelPuan_Otel]
GO
ALTER TABLE [dbo].[OtelPuan]  WITH CHECK ADD  CONSTRAINT [FK_OtelPuan_tblT_PuanTur] FOREIGN KEY([PuanTurID])
REFERENCES [dbo].[tblT_PuanTur] ([PuanTurID])
GO
ALTER TABLE [dbo].[OtelPuan] CHECK CONSTRAINT [FK_OtelPuan_tblT_PuanTur]
GO
ALTER TABLE [dbo].[OtelPuan]  WITH CHECK ADD  CONSTRAINT [FK_OtelPuan_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[OtelPuan] CHECK CONSTRAINT [FK_OtelPuan_Uyeler]
GO
ALTER TABLE [dbo].[OtelYorum]  WITH CHECK ADD  CONSTRAINT [FK_OtelYorum_Otel] FOREIGN KEY([OtelID])
REFERENCES [dbo].[Otel] ([OtelID])
GO
ALTER TABLE [dbo].[OtelYorum] CHECK CONSTRAINT [FK_OtelYorum_Otel]
GO
ALTER TABLE [dbo].[OtelYorum]  WITH CHECK ADD  CONSTRAINT [FK_OtelYorum_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[OtelYorum] CHECK CONSTRAINT [FK_OtelYorum_Uyeler]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_OtelOdaDetay] FOREIGN KEY([OtelOdaDetayID])
REFERENCES [dbo].[OtelOdaDetay] ([OtelOdaDetayID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_OtelOdaDetay]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_tblT_RezervasyonDurum] FOREIGN KEY([RezervasyonDurumID])
REFERENCES [dbo].[tblT_RezervasyonDurum] ([RezervasyonDurumID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_tblT_RezervasyonDurum]
GO
ALTER TABLE [dbo].[Rezervasyon]  WITH CHECK ADD  CONSTRAINT [FK_Rezervasyon_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[Rezervasyon] CHECK CONSTRAINT [FK_Rezervasyon_Uyeler]
GO
ALTER TABLE [dbo].[RezervasyonIptal]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonIptal_Rezervasyon] FOREIGN KEY([RezervasyonID])
REFERENCES [dbo].[Rezervasyon] ([RezervasyonID])
GO
ALTER TABLE [dbo].[RezervasyonIptal] CHECK CONSTRAINT [FK_RezervasyonIptal_Rezervasyon]
GO
ALTER TABLE [dbo].[RezervasyonIptal]  WITH CHECK ADD  CONSTRAINT [FK_RezervasyonIptal_tblT_RezervasyonIptalNeden] FOREIGN KEY([IptalNedenID])
REFERENCES [dbo].[tblT_RezervasyonIptalNeden] ([IptalNedenID])
GO
ALTER TABLE [dbo].[RezervasyonIptal] CHECK CONSTRAINT [FK_RezervasyonIptal_tblT_RezervasyonIptalNeden]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK_Satis_Rezervasyon] FOREIGN KEY([RezervasyonID])
REFERENCES [dbo].[Rezervasyon] ([RezervasyonID])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK_Satis_Rezervasyon]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_Satis] FOREIGN KEY([SatisID])
REFERENCES [dbo].[Satis] ([SatisID])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_Satis]
GO
ALTER TABLE [dbo].[SatisDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatisDetay_tblT_OdemeTuru] FOREIGN KEY([OdemeTurID])
REFERENCES [dbo].[tblT_OdemeTuru] ([OdemeTurID])
GO
ALTER TABLE [dbo].[SatisDetay] CHECK CONSTRAINT [FK_SatisDetay_tblT_OdemeTuru]
GO
ALTER TABLE [dbo].[tblT_Ilce]  WITH CHECK ADD  CONSTRAINT [FK_tblT_Ilce_tblT_Il] FOREIGN KEY([IlId])
REFERENCES [dbo].[tblT_Il] ([IlId])
GO
ALTER TABLE [dbo].[tblT_Ilce] CHECK CONSTRAINT [FK_tblT_Ilce_tblT_Il]
GO
ALTER TABLE [dbo].[UyeGirisBilgileri]  WITH CHECK ADD  CONSTRAINT [FK_UyeGirisBilgileri_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[UyeGirisBilgileri] CHECK CONSTRAINT [FK_UyeGirisBilgileri_Uyeler]
GO
ALTER TABLE [dbo].[UyeIletisim]  WITH CHECK ADD  CONSTRAINT [FK_UyeIletisim_tblT_Ilce] FOREIGN KEY([IlceID])
REFERENCES [dbo].[tblT_Ilce] ([IlceID])
GO
ALTER TABLE [dbo].[UyeIletisim] CHECK CONSTRAINT [FK_UyeIletisim_tblT_Ilce]
GO
ALTER TABLE [dbo].[UyeIletisim]  WITH CHECK ADD  CONSTRAINT [FK_UyeIletisim_Uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[UyeIletisim] CHECK CONSTRAINT [FK_UyeIletisim_Uyeler]
GO
USE [master]
GO
ALTER DATABASE [TrivagoDB] SET  READ_WRITE 
GO
