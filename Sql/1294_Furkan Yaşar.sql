USE [master]
GO
/****** Object:  Database [1294_FurkanYasar]    Script Date: 19.05.2018 18:04:31 ******/
CREATE DATABASE [1294_FurkanYasar] ON  PRIMARY 
( NAME = N'1294_FurkanYasar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\1294_FurkanYasar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'1294_FurkanYasar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\1294_FurkanYasar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [1294_FurkanYasar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ARITHABORT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1294_FurkanYasar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [1294_FurkanYasar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1294_FurkanYasar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [1294_FurkanYasar] SET  MULTI_USER 
GO
ALTER DATABASE [1294_FurkanYasar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [1294_FurkanYasar] SET DB_CHAINING OFF 
GO
USE [1294_FurkanYasar]
GO
/****** Object:  Table [dbo].[tblKategoriler]    Script Date: 19.05.2018 18:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategoriler](
	[Kategoriid] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblKategoriler] PRIMARY KEY CLUSTERED 
(
	[Kategoriid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKisiler]    Script Date: 19.05.2018 18:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblKisiler](
	[Kisiid] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Parola] [varchar](50) NOT NULL,
	[Tarih] [date] NOT NULL CONSTRAINT [DF_tblKisiler_Tarih]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblKisiler] PRIMARY KEY CLUSTERED 
(
	[Kisiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblKonular]    Script Date: 19.05.2018 18:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKonular](
	[Konuid] [int] IDENTITY(1,1) NOT NULL,
	[KonuBaslik] [nvarchar](max) NOT NULL,
	[KonuIcerik] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_tblKonular_Tarih]  DEFAULT (getdate()),
	[Kisiid] [int] NOT NULL,
	[Kategoriid] [int] NOT NULL,
 CONSTRAINT [PK_tblKonular] PRIMARY KEY CLUSTERED 
(
	[Konuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYorumlar]    Script Date: 19.05.2018 18:04:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYorumlar](
	[Yorumid] [int] IDENTITY(1,1) NOT NULL,
	[Yorum] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_tblYorumlar_Tarih]  DEFAULT (getdate()),
	[Kisiid] [int] NOT NULL,
	[Konuid] [int] NOT NULL,
 CONSTRAINT [PK_tblYorumlar] PRIMARY KEY CLUSTERED 
(
	[Yorumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblKategoriler] ON 

INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (1, N'Donanım')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (2, N'Yazılım')
SET IDENTITY_INSERT [dbo].[tblKategoriler] OFF
SET IDENTITY_INSERT [dbo].[tblKisiler] ON 

INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (1, N'fyasar_19', N'furkan@hotmail.com', N'1234', CAST(N'2018-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (2, N'yasarfurkan', N'yasar@gmail.com', N'12345', CAST(N'2018-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (3, N'FYparol', N'parol@gmail.com', N'parol', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (4, N'fyasar_1937', N'deneme@hotmail.com', N'1234', CAST(N'2018-05-13' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (5, N'emir', N'emir@gmail.com', N'emir', CAST(N'2018-05-19' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (6, N'canPo', N'can@gmail.com', N'canpo', CAST(N'2018-05-19' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (7, N'ömer', N'ömer@gmail.com', N'ömer', CAST(N'2018-05-19' AS Date))
SET IDENTITY_INSERT [dbo].[tblKisiler] OFF
SET IDENTITY_INSERT [dbo].[tblKonular] ON 

INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (1, N'Mavi Ekran Hatası', N'Bilgisayar açıldıktan hemen 1 dk sonra ekrana mavi yazılar geliyor çözümünü bilen varsa yazabilirmi?', CAST(N'2018-05-12 18:59:04.153' AS DateTime), 1, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (2, N'html yazı ortalama nasıldı?', N'Bilen arkadaşlar varsa rica etsem gösterebilirlermi', CAST(N'2018-05-12 18:59:40.393' AS DateTime), 2, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (3, N'css dikeyde hizalama', N'vertical mıydı margin miydi neydii yada başka bişey miydi anlamadım important koyduğum halde olmadı bilen varsa söyleyebilirmi acaba', CAST(N'2018-05-12 19:00:31.313' AS DateTime), 1, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (4, N'Format yardım', N'format atmak için bios menüye girmem lazım hengi tuşla girecektim', CAST(N'2018-05-15 19:13:50.610' AS DateTime), 3, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (65, N'bi geliya, bi gidiya', N'<p>pc a&ccedil;ıldıktan 1-2 dk sonra tekrar kapanıyor</p>', CAST(N'2018-05-19 01:35:01.983' AS DateTime), 1, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (66, N'datalist eval hatası', N'<p>textbox=&quot;&lt;%# Eval(&quot;Kisiid&quot;)%&gt;&quot; hata veriyor</p>', CAST(N'2018-05-19 01:37:38.160' AS DateTime), 4, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (68, N'Yazılım siteleri', N'yazılım öğreten web siteler', CAST(N'2018-05-19 17:10:42.930' AS DateTime), 7, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (69, N'Pc den ses gelmesi', N'açar açmaz pc bağırıyor yardım edebilen varmı', CAST(N'2018-05-19 17:12:27.087' AS DateTime), 3, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (70, N'Ekrana görüntü gelmiyor', N'kasa çalışıyor ama ekrana görüntü gelmiyo', CAST(N'2018-05-19 17:14:15.217' AS DateTime), 4, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (71, N'datalist yardım', N'datalist tagının altına eklenen tagın adı neydi', CAST(N'2018-05-19 17:16:00.050' AS DateTime), 3, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (72, N'Saat değişiyor', N'bilgisayarı her açtığımda saat değişik oluyor', CAST(N'2018-05-19 17:18:35.820' AS DateTime), 2, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (73, N'Bilgisayarım Açılışta Kalıyor!', N'Güç sorunu
yok, her bağlantı yerli yerinde; fakat açılışta sistem mekanik olarak çalışsa
da monitör uyku kipinde kalıyor ve sistem herhangi bir hata sesi çıkartmıyor.', CAST(N'2018-05-19 17:19:36.850' AS DateTime), 4, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (74, N'Bilgisayarım Açılışta Yeniden Başlıyor!', N'Bilgisayar
açılırken her şey düzgün. Ne zaman ki işletim sistemi yüklenmeye başlıyor,
birden bire bilgisayar yeniden başlıyor.', CAST(N'2018-05-19 17:20:42.543' AS DateTime), 5, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (75, N'bilgisayarım cs:go kaldırımı', N'Ram:4gb -  işlemci: 2.5 ghz-ekran kartı-2gb', CAST(N'2018-05-19 17:24:36.253' AS DateTime), 3, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (76, N'üstüne gelme kodu', N'yazının üstüne geldiğimde rengini değiştirmek istiyorum', CAST(N'2018-05-19 17:26:06.467' AS DateTime), 4, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (77, N'navbar ', N'navbarın sabit kalması için ne yazmalıyım', CAST(N'2018-05-19 17:27:17.533' AS DateTime), 3, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (78, N'otomatik onarım', N'açılır açılmaz onarıma geçiyor', CAST(N'2018-05-19 17:29:33.157' AS DateTime), 2, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (79, N'2 monitor', N'monitor bağlamam için bişey almam lazımmı', CAST(N'2018-05-19 17:31:05.600' AS DateTime), 7, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (80, N'asp.net textbox', N'texboxı cs tarafında çağıramıyorum', CAST(N'2018-05-19 17:32:27.940' AS DateTime), 1, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (81, N'Ram yok gözüküyor', N'4 gb ram takılı olduğu halde yok diyor', CAST(N'2018-05-19 17:33:43.070' AS DateTime), 5, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (82, N'pc hızlandırma', N'az da olsa hızlandırmak için ne yapmam lazım', CAST(N'2018-05-19 17:36:09.963' AS DateTime), 1, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (83, N'margin ve paddin olmuyor', N'üstten ve alttan padding margin veriyorum ama olmuyor.sağdan soldan oluyor ama', CAST(N'2018-05-19 17:38:58.187' AS DateTime), 7, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (84, N'tooltip', N'üstüne gelince bilgi vermesini istiyorum', CAST(N'2018-05-19 17:40:02.723' AS DateTime), 4, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (85, N'textbox odak', N'sayfa açıldığında textboxın tıklanmış olmasını istiyorum', CAST(N'2018-05-19 17:41:14.693' AS DateTime), 1, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid]) VALUES (86, N'Deneme', N'deneme', CAST(N'2018-05-19 17:50:14.053' AS DateTime), 2, 2)
SET IDENTITY_INSERT [dbo].[tblKonular] OFF
SET IDENTITY_INSERT [dbo].[tblYorumlar] ON 

INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (1, N'Kesin çözüm olarak bence bilgisayara format at', CAST(N'2018-05-12 19:01:30.420' AS DateTime), 1, 1)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (2, N'text-align:center', CAST(N'2018-05-12 19:01:44.413' AS DateTime), 1, 2)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (3, N'vertical-align:middle', CAST(N'2018-05-12 19:02:03.593' AS DateTime), 1, 3)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (4, N'Laptoplarda fn+f11 galiba', CAST(N'2018-05-15 19:14:30.827' AS DateTime), 4, 4)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (5, N'Masaüstünde del yada f12 olabilir.Pc den pcye değişiyor.Pc özelikklerini at söyleyeyim kesin olarak', CAST(N'2018-05-15 19:15:39.827' AS DateTime), 2, 4)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (81, N'I don!t know', CAST(N'2018-05-15 19:20:50.737' AS DateTime), 1, 4)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (82, N'<p>textbox=&#39;&lt;%# Eval(&quot;Kisiid&quot;)%&gt;&#39; &ccedil;ift tırnakları tek tırnak yapman</p><p>&nbsp; &nbsp; &nbsp; &nbsp;gerekiyor.</p>', CAST(N'2018-05-19 02:00:03.983' AS DateTime), 3, 66)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (83, N'w3schools.com', CAST(N'2018-05-19 17:11:04.547' AS DateTime), 5, 68)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (84, N'içi pislenmiştir. pc temizleme aracıyla temizle ', CAST(N'2018-05-19 17:13:06.427' AS DateTime), 6, 69)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (85, N'kablo fana değiyor olabilir içini kontrol et', CAST(N'2018-05-19 17:13:24.410' AS DateTime), 2, 69)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (86, N'ekran kartında hata olabilir tak çıkar yap', CAST(N'2018-05-19 17:14:37.707' AS DateTime), 7, 70)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (87, N'vga kablonu ekran kartına değilde onboard yerine tak düzeleckmi', CAST(N'2018-05-19 17:15:01.477' AS DateTime), 2, 70)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (88, N'<itemtemplate>', CAST(N'2018-05-19 17:16:35.297' AS DateTime), 1, 71)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (89, N'bios pilinde sorun vardır', CAST(N'2018-05-19 17:18:56.487' AS DateTime), 7, 72)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (90, N'Bilgisayarınızın
güç kablosunu çekin. Arkadaki tüm bağlantı kablolarını çıkartın. Şimdi
bilgisayarınızın güç düğmesine basın (evet, çalışmayacak, burada bir hata yok).
Bu şekilde güç kaynağında kalmış olabilecek yükü boşaltıyoruz. Ardından kasayı
açmamız gerekiyor. Kasayı açarak BIOS piline veya BIOSu sıfırlamaya yarayan
iğnelere ulaşmamız gerekiyor. Bu iki bileşen genellikle birbirine yakındır.
Önce işin kolayını deneyelim. BIOS pilini, makine şu haldeyken çıkartıp bir
süre beklediğimizde BIOSun eski hâline dönmesi gerekir.', CAST(N'2018-05-19 17:20:19.680' AS DateTime), 1, 73)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (91, N'Eğer
bu sorun yeni SP2 yüklenmiş bir makinede oluşuyorsa, donanım sürücülerinizden
bazıları SP2 ile bir uyumsuzluk gösteriyor demektir.', CAST(N'2018-05-19 17:21:10.440' AS DateTime), 4, 74)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (92, N'can yo run it sitesinden bakabilirsin', CAST(N'2018-05-19 17:25:03.083' AS DateTime), 1, 75)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (93, N'yaz,:hover{color:red}', CAST(N'2018-05-19 17:26:27.993' AS DateTime), 7, 76)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (94, N'position:fixed', CAST(N'2018-05-19 17:27:39.960' AS DateTime), 4, 77)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (95, N'onarmayı yapsın bekle', CAST(N'2018-05-19 17:29:53.980' AS DateTime), 1, 78)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (96, N'format at kurtul', CAST(N'2018-05-19 17:30:03.887' AS DateTime), 6, 78)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (97, N'vga dönüştürücü', CAST(N'2018-05-19 17:31:22.073' AS DateTime), 4, 79)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (98, N'id ver ve runat=server', CAST(N'2018-05-19 17:32:44.703' AS DateTime), 2, 80)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (99, N'Ramler bozuktur', CAST(N'2018-05-19 17:34:08.057' AS DateTime), 1, 81)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (100, N'Ramler bozuk değilse yuvası çalışmıyordur', CAST(N'2018-05-19 17:34:33.240' AS DateTime), 7, 81)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (101, N'win+r temp yaz içindekileri sil', CAST(N'2018-05-19 17:36:34.113' AS DateTime), 2, 82)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (102, N'%temp% yazıp ordakileride silebilirsin', CAST(N'2018-05-19 17:36:54.903' AS DateTime), 3, 82)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (103, N'ccleaner kullan', CAST(N'2018-05-19 17:37:06.137' AS DateTime), 7, 82)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (104, N'virüs tarama yap', CAST(N'2018-05-19 17:37:23.517' AS DateTime), 5, 82)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (105, N'display:block !important', CAST(N'2018-05-19 17:39:20.833' AS DateTime), 4, 83)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (107, N'title="Bilgi"', CAST(N'2018-05-19 17:40:21.713' AS DateTime), 7, 84)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (108, N'aspx tarafında autofocus yaz', CAST(N'2018-05-19 17:41:55.783' AS DateTime), 2, 85)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (109, N'txt1.autofocus=true gibi bişiler vardır', CAST(N'2018-05-19 17:42:28.670' AS DateTime), 5, 85)
SET IDENTITY_INSERT [dbo].[tblYorumlar] OFF
ALTER TABLE [dbo].[tblKonular]  WITH CHECK ADD  CONSTRAINT [FK_tblKonular_tblKategoriler] FOREIGN KEY([Kategoriid])
REFERENCES [dbo].[tblKategoriler] ([Kategoriid])
GO
ALTER TABLE [dbo].[tblKonular] CHECK CONSTRAINT [FK_tblKonular_tblKategoriler]
GO
ALTER TABLE [dbo].[tblKonular]  WITH CHECK ADD  CONSTRAINT [FK_tblKonular_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblKonular] CHECK CONSTRAINT [FK_tblKonular_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblKonular] FOREIGN KEY([Konuid])
REFERENCES [dbo].[tblKonular] ([Konuid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblKonular]
GO
USE [master]
GO
ALTER DATABASE [1294_FurkanYasar] SET  READ_WRITE 
GO
