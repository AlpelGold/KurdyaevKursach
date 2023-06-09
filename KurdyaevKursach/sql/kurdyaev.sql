USE [master]
GO
/****** Object:  Database [kurdyaev]    Script Date: 20.03.2023 23:08:42 ******/
CREATE DATABASE [kurdyaev]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kurdyaev', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kurdyaev.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kurdyaev_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\kurdyaev_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kurdyaev] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kurdyaev].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kurdyaev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kurdyaev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kurdyaev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kurdyaev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kurdyaev] SET ARITHABORT OFF 
GO
ALTER DATABASE [kurdyaev] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kurdyaev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kurdyaev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kurdyaev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kurdyaev] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kurdyaev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kurdyaev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kurdyaev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kurdyaev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kurdyaev] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kurdyaev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kurdyaev] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kurdyaev] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kurdyaev] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kurdyaev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kurdyaev] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kurdyaev] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kurdyaev] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kurdyaev] SET  MULTI_USER 
GO
ALTER DATABASE [kurdyaev] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kurdyaev] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kurdyaev] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kurdyaev] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kurdyaev] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kurdyaev] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [kurdyaev] SET QUERY_STORE = OFF
GO
USE [kurdyaev]
GO
/****** Object:  Table [dbo].[User]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](80) NOT NULL,
	[UserPassword] [nvarchar](80) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UserView]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserView]
AS
SELECT dbo.[User].UserId, dbo.[User].UserName, dbo.[User].UserPassword, dbo.Role.RoleName
FROM   dbo.[User] INNER JOIN
             dbo.Role ON dbo.[User].RoleId = dbo.Role.RoleId
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](80) NOT NULL,
	[EmployeeSecondName] [nvarchar](80) NULL,
	[EmployeeLastName] [nvarchar](80) NOT NULL,
	[EmployeeLanguage] [nvarchar](30) NOT NULL,
	[EmployeeCountry] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExcurionBuro]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExcurionBuro](
	[ExcurionBuroId] [int] IDENTITY(1,1) NOT NULL,
	[ExcurionBuroName] [nvarchar](80) NOT NULL,
	[ExcurionBuroCountry] [nvarchar](30) NOT NULL,
	[ExcurionBuroExcursions] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ExcurionBuro] PRIMARY KEY CLUSTERED 
(
	[ExcurionBuroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excursion]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursion](
	[ExcursionId] [int] IDENTITY(1,1) NOT NULL,
	[ExcursionName] [nvarchar](80) NOT NULL,
	[ExcursionPrice] [decimal](18, 0) NOT NULL,
	[ExcursionPlace] [nvarchar](50) NOT NULL,
	[ExcursionBuroId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ExcursionDate] [date] NOT NULL,
 CONSTRAINT [PK_Excursion] PRIMARY KEY CLUSTERED 
(
	[ExcursionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ExcursionView]    Script Date: 20.03.2023 23:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExcursionView]
AS
SELECT dbo.Excursion.ExcursionId, dbo.Excursion.ExcursionName, dbo.Excursion.ExcursionPrice, dbo.Excursion.ExcursionPlace, dbo.ExcurionBuro.ExcurionBuroName, dbo.Employee.EmployeeName, dbo.Employee.EmployeeLastName, dbo.Excursion.ExcursionDate
FROM   dbo.Excursion INNER JOIN
             dbo.ExcurionBuro ON dbo.Excursion.ExcursionBuroId = dbo.ExcurionBuro.ExcurionBuroId INNER JOIN
             dbo.Employee ON dbo.Excursion.EmployeeId = dbo.Employee.EmployeeId
GO
ALTER TABLE [dbo].[Excursion]  WITH CHECK ADD  CONSTRAINT [FK_Excursion_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Excursion] CHECK CONSTRAINT [FK_Excursion_Employee]
GO
ALTER TABLE [dbo].[Excursion]  WITH CHECK ADD  CONSTRAINT [FK_Excursion_ExcurionBuro] FOREIGN KEY([ExcursionBuroId])
REFERENCES [dbo].[ExcurionBuro] ([ExcurionBuroId])
GO
ALTER TABLE [dbo].[Excursion] CHECK CONSTRAINT [FK_Excursion_ExcurionBuro]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Excursion"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 288
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ExcurionBuro"
            Begin Extent = 
               Top = 9
               Left = 345
               Bottom = 206
               Right = 634
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 9
               Left = 691
               Bottom = 206
               Right = 979
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ExcursionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ExcursionView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "User"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 9
               Left = 342
               Bottom = 152
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserView'
GO
USE [master]
GO
ALTER DATABASE [kurdyaev] SET  READ_WRITE 
GO
