
GO
/****** Object:  Table [dbo].[Notification]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[Notificationkey] [int] IDENTITY(1,1) NOT NULL,
	[politicsName] [varchar](max) NOT NULL,
	[PoliticsKey] [int] NOT NULL,
	[UserKey] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Notificationkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Politics]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Politics](
	[PoliticsKey] [int] IDENTITY(1,1) NOT NULL,
	[PoliticsName] [varchar](max) NOT NULL,
	[PoliticsDescrip] [varchar](max) NULL,
 CONSTRAINT [PK_Politics] PRIMARY KEY CLUSTERED 
(
	[PoliticsKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Politics] FOREIGN KEY([PoliticsKey])
REFERENCES [dbo].[Politics] ([PoliticsKey])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Politics]
GO
