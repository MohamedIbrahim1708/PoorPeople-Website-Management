USE [RamadanFinal]
GO
/****** Object:  UserDefinedFunction [dbo].[GetUserID]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[GetUserID](@username nvarchar(50))
returns int
As
BEGIN
DECLARE @id int
Select @id=UID from Users where username = @username
return @id
END
GO
/****** Object:  Table [dbo].[Poors]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poors](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PoorName] [nvarchar](50) NULL,
	[VolID] [int] NULL,
	[NoOfChild] [int] NULL,
	[NoOfBags] [int] NULL,
	[UID] [int] NULL,
 CONSTRAINT [PK_Poors] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteers](
	[VolID] [int] IDENTITY(1,1) NOT NULL,
	[VolName] [nvarchar](50) NULL,
	[VolNationalID] [nchar](14) NULL,
	[BirthDate] [date] NULL,
	[NoOfBags] [int] NULL,
	[UID] [int] NULL,
 CONSTRAINT [PK_Volunteers] PRIMARY KEY CLUSTERED 
(
	[VolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetVolData_Poor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetVolData_Poor]()
RETURNS TABLE 
AS
RETURN(SELECT Volunteers.VolID,VolName,Volunteers.NoOfBags as VolNoOfBags ,PoorName,Poors.NoOfBags as poorNoOfBags FROM Volunteers
INNER JOIN Poors ON Volunteers.VolID = Poors.VolID)
GO
/****** Object:  UserDefinedFunction [dbo].[GetNoOfPoors_TotalNoOfBags]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetNoOfPoors_TotalNoOfBags]()
RETURNS TABLE
AS
RETURN (SELECT count(PID) AS NoOfPoors,SUM(NoOfBags) AS NoOfPags FROM Poors)
GO
/****** Object:  UserDefinedFunction [dbo].[GetPoorData_Vol]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetPoorData_Vol]()
RETURNS TABLE
AS
RETURN(SELECT PID,PoorName,NoOfChild,Poors.NoOfBags as PoorNoOfBags,VolName,Volunteers.NoOfBags as VolNoOfBags
FROM Poors INNER JOIN Volunteers ON Volunteers.VolID = Poors.VolID)
GO
/****** Object:  Table [dbo].[Trash]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trash](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TableName] [nvarchar](15) NULL,
 CONSTRAINT [PK_Trash] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Poors] ON 

INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (1, N'أحمد علي عبد السلام', 2, 6, 3, 2)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (2, N'محمد أحمد خالد', 2, 3, 0, 1)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (14, N'هاله', 10, 6, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (15, N'yasmeen', 7, 8, 4, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (16, N'Alaa', 17, 6, 3, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (18, N'Mohsen', 2, 16, 8, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (19, N'Manar', 3, 12, 6, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (31, N'Ahmed', 2, 8, 4, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (32, N'Ali', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (34, N'Mona', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (35, N'ramadan', 3, 3, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (36, N'gehad', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (37, N'gege', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (38, N'dd', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (39, N'h', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (40, NULL, 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (41, NULL, 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (42, NULL, 3, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (43, N'dd', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (44, N'ff', 3, 10, 5, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (45, N'nana', 2, 5, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (46, N'mamamm', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (47, N'fff', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (48, N'ss', 3, 10, 5, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (49, N'rawan', 2, 10, 5, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (50, N'mahy', 3, 3, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (52, N'ghader', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (54, N'hh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (55, N'jiji', 2, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (56, N'ramadan', 2, 5, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (57, N'mo', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (58, N'gehad', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (59, N'jj', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (60, N'hh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (61, N'hh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (62, N'yyy', 3, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (63, N'ff', 3, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (64, N'gggg', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (65, N'hhhh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (67, N'jamela', 2, 4, 2, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (68, N'ff', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (69, N'k', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (70, N'reem', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (73, N'gh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (74, N'f', 3, 2, 1, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (75, N'samy', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (76, N'gamal', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (77, N'hh', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (78, N'ggggg', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (79, N'f', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (80, N'mohammed', 2, 1, 0, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (81, N'Mohamed Ibrahim', 34, 12, 6, 3)
INSERT [dbo].[Poors] ([PID], [PoorName], [VolID], [NoOfChild], [NoOfBags], [UID]) VALUES (82, N'qqqq', 31, 4, 2, 3)
SET IDENTITY_INSERT [dbo].[Poors] OFF
GO
SET IDENTITY_INSERT [dbo].[Trash] ON 

INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (1, N'AMR', N'Poors')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (2, N'Manar Hamdy', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (3, N'jj', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (4, N'ddd', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (5, N'jjjj', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (6, N'Marwa Taha', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (7, N'AMR', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (8, N'gg', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (9, NULL, N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (10, NULL, N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (11, N'kkkk', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (12, N'ghader', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (13, N'mo', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (14, N'Laila', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (15, N'yahya', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (16, N'rr', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (17, N'ramy', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (18, N'manar', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (19, N'j', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (20, N'manar', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (21, N'hala', N'Volunteer')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (22, N'LLLLL', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (23, N'عبد الناصر إبراهيم سامح', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (24, N'رندا عطاء ايوب', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (25, N'ahmed', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (26, N'dddd', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (27, N'khaled', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (28, N'جمالات عطية محمدين', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (29, N'ياسمين', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (30, N'', N'Poor')
INSERT [dbo].[Trash] ([ID], [Name], [TableName]) VALUES (31, N'rgerg', N'Volunteer')
SET IDENTITY_INSERT [dbo].[Trash] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (1, N'yahya', N'123', 1)
INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (2, N'khaled', N'456', 1)
INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (3, N'ahmed', N'789', 2)
INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (5, N'yasmeen', N'98741230', 2)
INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (6, N'Aya', N'258', 1)
INSERT [dbo].[Users] ([UID], [Username], [Password], [Role]) VALUES (7, N'manar', N'963', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Volunteers] ON 

INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (2, N'AMR', N'21604956324563', CAST(N'1995-04-16' AS Date), 7, 1)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (3, N'ahmed', N'20405996235684', CAST(N'1999-05-04' AS Date), 4, 2)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (7, N'Youmna', N'29909012372635', CAST(N'2020-05-01' AS Date), 8, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (8, N'yaousef', N'58785454544545', CAST(N'2020-05-01' AS Date), 10, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (10, N'hala', N'15489654852145', CAST(N'2020-05-01' AS Date), 12, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (11, N'khaled', N'85754952854562', CAST(N'2020-05-01' AS Date), 12, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (12, N'manar hamdy', N'77777777777777', CAST(N'2020-05-01' AS Date), 12, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (14, N'haala', N'44444444444444', CAST(N'2020-05-01' AS Date), 12, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (16, N'yyyyyy', N'44444444444444', CAST(N'2020-05-01' AS Date), 12, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (17, N'mohamed', N'44444444444444', CAST(N'2020-05-01' AS Date), 9, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (23, N'mahy', N'30001302400256', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (24, N'Ghada Hamdy', N'30001302400645', CAST(N'2020-04-29' AS Date), 5, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (25, N'ghadeer hamdy', N'29708012402882', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (26, N'g', N'1231212       ', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (29, N'j', N'55            ', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (31, N'gg', N'30001302400645', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (32, N'jhh', N'22245454545454', CAST(N'2020-04-29' AS Date), 1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (34, N'Manar Hamdy', N'30012252200056', CAST(N'2000-01-30' AS Date), -1, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (35, N'Amr Boghdady', N'30012252200056', CAST(N'2000-12-25' AS Date), 8, 3)
INSERT [dbo].[Volunteers] ([VolID], [VolName], [VolNationalID], [BirthDate], [NoOfBags], [UID]) VALUES (36, N'Ahmed', N'30012252200056', CAST(N'2022-06-07' AS Date), 5, 2)
SET IDENTITY_INSERT [dbo].[Volunteers] OFF
GO
ALTER TABLE [dbo].[Poors]  WITH CHECK ADD  CONSTRAINT [FK_Poors_Users] FOREIGN KEY([UID])
REFERENCES [dbo].[Users] ([UID])
GO
ALTER TABLE [dbo].[Poors] CHECK CONSTRAINT [FK_Poors_Users]
GO
ALTER TABLE [dbo].[Poors]  WITH CHECK ADD  CONSTRAINT [FK_Poors_Volunteers] FOREIGN KEY([VolID])
REFERENCES [dbo].[Volunteers] ([VolID])
GO
ALTER TABLE [dbo].[Poors] CHECK CONSTRAINT [FK_Poors_Volunteers]
GO
ALTER TABLE [dbo].[Volunteers]  WITH CHECK ADD  CONSTRAINT [FK_Volunteers_Users] FOREIGN KEY([UID])
REFERENCES [dbo].[Users] ([UID])
GO
ALTER TABLE [dbo].[Volunteers] CHECK CONSTRAINT [FK_Volunteers_Users]
GO
/****** Object:  StoredProcedure [dbo].[AddPoor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddPoor]
    @Poorname nvarchar(50),
	@VolID int,
	@NoOfChild int
AS
BEGIN
	INSERT INTO Poors(PoorName,VolID,NoOfChild)
	VALUES(@Poorname,@VolID,@NoOfChild);
END
GO
/****** Object:  StoredProcedure [dbo].[AddVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddVolunteer] 
	@VolName nvarchar(50),
	@VolNationalID nchar(14),
	@BirthDate date,
	@NoOfBags int
AS 
BEGIN
	INSERT INTO Volunteers(VolName, VolNationalID,
						   BirthDate, NoOfBags)
	VALUES(@VolName, @VolNationalID,
	       @BirthDate, @NoOfBags);
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePoor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePoor]
    @PID int
AS
BEGIN
	DELETE FROM Poors WHERE PID=@PID;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteVolunteer]
	@ID int
AS
BEGIN
	DELETE FROM Volunteers 
	WHERE VolID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[GetNoOfBagsForSpecificVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNoOfBagsForSpecificVolunteer]
	@name varchar(50)
AS
BEGIN
SELECT NoOfBags FROM Volunteers WHERE VolName=@name
END
GO
/****** Object:  StoredProcedure [dbo].[GetTrashData]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTrashData]
AS
BEGIN
SELECT * FROM Trash
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersData]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersData]
AS
BEGIN
SELECT Username , Password , Role FROM Users
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTUSER_POOR]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTUSER_POOR]
	@Name nvarchar(50)
AS
BEGIN
INSERT INTO Poors(UID)
VALUES((SELECT UID FROM Users WHERE Username =@Name))
END
GO
/****** Object:  StoredProcedure [dbo].[SearchPoor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------ 12)Search poor -------
CREATE PROCEDURE [dbo].[SearchPoor]
     @PoorName nvarchar(50) 
AS
BEGIN 
	SELECT PID , PoorName, NoOfChild, NoOfBags,
	(SELECT VolName FROM Volunteers
	 WHERE Volunteers.VolID=Poors.VolID) VolName,
	(SELECT Username FROM Users 
	WHERE Poors.UID=Users.UID) as UserName
	FROM Poors WHERE poorName LIKE @PoorName +'%%';
END
GO
/****** Object:  StoredProcedure [dbo].[SearchTrash]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchTrash]
	@TrashName nvarchar(50)
AS
BEGIN
SELECT * FROM Trash WHERE Name LIKE @TrashName +'%%';
END
GO
/****** Object:  StoredProcedure [dbo].[SearchVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchVolunteer]
	@Name nvarchar(50)
AS
BEGIN
	SELECT VolID, VolName, VolNationalID, BirthDate,
		   NoOfBags, (SELECT UserName
		              FROM Users 
					  WHERE Users.UID = Volunteers.UID) as UserName
	FROM Volunteers
	WHERE VolName like @Name+'%%';
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPoors]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllPoors]
AS
BEGIN
	SELECT PID , PoorName, NoOfChild, NoOfBags,
	(SELECT VolName FROM Volunteers
	 WHERE Volunteers.VolID=Poors.VolID) VolName,
	(SELECT Username FROM Users 
	WHERE Poors.UID=Users.UID) as UserName
	FROM Poors;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllVolunteer]
AS
BEGIN
	SELECT VolID, VolName, VolNationalID, BirthDate,
		   NoOfBags, (SELECT UserName
		              FROM Users 
					  WHERE Users.UID = Volunteers.UID)
	FROM Volunteers;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllVolunteers]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllVolunteers]
AS
BEGIN
	SELECT VolID, VolName, VolNationalID, BirthDate,
		   NoOfBags, (SELECT UserName
		              FROM Users 
					  WHERE Users.UID = Volunteers.UID) as username
	FROM Volunteers;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectPoor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- 11)Select Poor by ID -------
CREATE PROCEDURE [dbo].[SelectPoor]
     @ID int
AS
BEGIN
	SELECT * FROM Poors WHERE PID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SelectVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectVolunteer]
	@ID int,
	@UID int
AS
BEGIN
	SELECT VolID, VolName, VolNationalID, BirthDate,
		   NoOfBags, (SELECT UserName
		              FROM Users 
					  WHERE Users.UID = @UID)
	FROM Volunteers
	WHERE VolID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePoor]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePoor]
     @PoorName nvarchar(50),
	 @NoOfChild int,
	 @PID int
AS
BEGIN
	UPDATE Poors
	SET PoorName = @PoorName,
	    NoOfChild = @NoOfChild
	WHERE PID = @PID
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateVolunteer]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateVolunteer]
	@VolName nvarchar(50),
	@NoOfBags int,
	@ID int
AS
BEGIN

	UPDATE Volunteers 
	SET VolName = @VolName,
	    NoOfBags = @NoOfBags
	where VolID = @ID;
END
GO
/****** Object:  Trigger [dbo].[AddNoOfBags]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AddNoOfBags]
ON [dbo].[Poors] FOR insert, update
AS
UPDATE Poors
SET NoOfBags = ((SELECT NoOfChild 
				FROM inserted)/2)
WHERE PID=(SELECT PID FROM inserted);
GO
ALTER TABLE [dbo].[Poors] ENABLE TRIGGER [AddNoOfBags]
GO
/****** Object:  Trigger [dbo].[AddPoorTrash]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AddPoorTrash]
ON [dbo].[Poors] FOR Delete
AS
INSERT INTO Trash(Name,TableName)
VALUES((SELECT PoorName From deleted),N'Poor')
GO
ALTER TABLE [dbo].[Poors] ENABLE TRIGGER [AddPoorTrash]
GO
/****** Object:  Trigger [dbo].[AddUserID]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AddUserID]
ON [dbo].[Poors] FOR INSERT
AS
declare @ID int;
SELECT @ID=UID FROM Users WHERE Username=N'ahmed';

UPDATE Poors
SET UID = @ID
WHERE PID=(SELECT PID FROM inserted);
GO
ALTER TABLE [dbo].[Poors] ENABLE TRIGGER [AddUserID]
GO
/****** Object:  Trigger [dbo].[UpdateNoOfBags_Vol]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateNoOfBags_Vol]
ON [dbo].[Poors] FOR INSERT
AS
declare @no int;
declare @total int;

UPDATE Volunteers
SET NoOfBags =(NoOfBags-((select NoOfChild from inserted)/2))
WHERE Volunteers.VolID=(SELECT VolID FROM inserted)
GO
ALTER TABLE [dbo].[Poors] ENABLE TRIGGER [UpdateNoOfBags_Vol]
GO
/****** Object:  Trigger [dbo].[UpdateNoOfBags_Vol_Update]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UpdateNoOfBags_Vol_Update]
ON [dbo].[Poors] FOR update
AS
declare @no int;
declare @total int;

UPDATE Volunteers
SET
NoOfBags =(NoOfBags-((select NoOfChild from inserted)/2)+(select NoOfBags from inserted))
WHERE Volunteers.VolID=(SELECT VolID FROM inserted)
GO
ALTER TABLE [dbo].[Poors] ENABLE TRIGGER [UpdateNoOfBags_Vol_Update]
GO
/****** Object:  Trigger [dbo].[AddUserIDVOL]    Script Date: 1/2/2022 9:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[AddUserIDVOL]
ON [dbo].[Volunteers] FOR INSERT
AS
declare @ID int;
SELECT @ID=UID FROM Users WHERE Username=N'khaled';

UPDATE Volunteers
SET UID = @ID
WHERE VolID=(SELECT VolID FROM inserted);
GO
ALTER TABLE [dbo].[Volunteers] ENABLE TRIGGER [AddUserIDVOL]
GO
/****** Object:  Trigger [dbo].[AddVolunteerTrash]    Script Date: 1/2/2022 9:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[AddVolunteerTrash]
ON [dbo].[Volunteers] FOR Delete
AS
INSERT INTO Trash(Name,TableName)
VALUES((SELECT VolName From deleted),N'Volunteer')
GO
ALTER TABLE [dbo].[Volunteers] ENABLE TRIGGER [AddVolunteerTrash]
GO
