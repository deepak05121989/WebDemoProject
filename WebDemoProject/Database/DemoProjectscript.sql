USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 1/20/2024 11:30:48 AM ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB', N'ON'
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 1/20/2024 11:30:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 1/20/2024 11:30:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[Pass] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Mobile] [bigint] NULL,
	[Address] [varchar](max) NULL,
	[PinCode] [int] NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 1/20/2024 11:30:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_login] 
	@UserId varchar(100),
	@Pass varchar(100)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select UserId,role from login where UserId=@UserId and Pass=@Pass
END
GO
/****** Object:  StoredProcedure [dbo].[usp_register]    Script Date: 1/20/2024 11:30:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_register]
@Fname		varchar(100),
@Lname		varchar(100),
@UserId		varchar(100),
@Pass		varchar(100),
@EmailId	varchar(100),
@Mobile		bigint,
@Address	varchar(100),
@PinCode	bigint,
@State		varchar(100),
@City		varchar(100),
@Gender		varchar(100),
@Age		int,
@role		varchar(50)='customer'

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT off;
	if exists(select 1 from Login where UserId=@UserId)
	BEGIN
	select 2;
	END
	else
	BEGIN
    insert into register([Fname], [Lname], [UserId], [Pass], [EmailId], [Mobile], [Address], [PinCode], [State], [City], [Gender], [Age]) values(@Fname, @Lname, @UserId, @Pass, @EmailId, @Mobile, @Address, @PinCode, @State, @City, @Gender, @Age)
	insert into login([UserId], [Pass],[role]) values(@UserId,@Pass,@role)
	select 1;
	END
END
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
