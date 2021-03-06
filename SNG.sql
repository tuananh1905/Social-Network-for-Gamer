﻿USE [SNG]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PurID] [int] NOT NULL,
	[content] [text] NOT NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Friend]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID1] [int] NOT NULL,
	[UserID2] [int] NOT NULL,
	[status] [int] NOT NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE())
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Game]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Game](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[image] [varbinary](max)  NULL,
	
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[PurID] [int] NULL,
	[PostID] [int] NULL,
	[image] [varbinary](max) NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Message]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NOT NULL,
	[ReceiveID] [int] NULL,
	[content] [text] NULL,
	[image] [varbinary](max) NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PostID] [int] NULL,
	[typeOfNotification] [varchar](10) NOT NULL,
	[content] [text] NOT NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] not null,
	[content] [text] NOT NULL,
	[like] [int] NOT NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE()), 
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[price] [int] NOT NULL,
	[nameProduct] [text] NOT NULL,
	[description] [text] NOT NULL,
	[status] [bit] NOT NULL,
	[time] [datetime] NOT NULL DEFAULT (GETDATE()),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[typeOfAccount] [int] NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](252) NULL,
	[displayname] [text] NULL,
	[avatar] [varbinary](max) NULL,
	[dob] [date] NULL,
	[gender] [varchar](50) NULL,
	[role] [bit] NOT NULL CONSTRAINT [DF_User_role]  DEFAULT ((0)),
	[QuestionID] [int] NULL,
	[answer] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_game]    Script Date: 5/26/2022 2:49:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_game](
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [typeOfAccount], [username], [password], [displayname], [avatar], [dob], [gender], [role], [QuestionID], [answer]) VALUES (1, 1, N'admin', N'123456', N'admin', NULL, NULL, N'1', 1, NULL, NULL)
INSERT [dbo].[User] ([ID], [typeOfAccount], [username], [password], [displayname], [avatar], [dob], [gender], [role], [QuestionID], [answer]) VALUES (2, 1, N'test', N'123456', N'Gian', NULL, NULL, N'0', 0, NULL, NULL)
INSERT [dbo].[User] ([ID], [typeOfAccount], [username], [password], [displayname], [avatar], [dob], [gender], [role], [QuestionID], [answer]) VALUES (3, 1, N'test123', N'123456', N'Viet', NULL, NULL, N'1', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Post] ADD  CONSTRAINT [DF_Post_like]  DEFAULT ((0)) FOR [like]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_status]  DEFAULT ((0)) FOR [status]
GO


