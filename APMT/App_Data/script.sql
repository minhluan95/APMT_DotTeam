USE [CP_SPM]
GO
/****** Object:  StoredProcedure [dbo].[sp_deletetask]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_deletetask]

@process_id int
as
begin
	
	delete APMT_Activity_to_Activity where Process_id=@process_id
end
GO
/****** Object:  Table [dbo].[APMT_Action]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APMT_Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [varchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[ControllerName] [varchar](100) NULL,
 CONSTRAINT [PK_APMT_Action_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APMT_Activity]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Process_Id] [int] NULL,
	[Weigth] [int] NULL,
	[Type_id] [int] NULL,
	[activity_key] [int] NOT NULL,
	[Category] [nvarchar](50) NULL,
 CONSTRAINT [PK_APMT_Activity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Activity_to_Activity]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Activity_to_Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromAc] [int] NULL,
	[ToAC] [int] NULL,
	[Process_ID] [int] NULL,
 CONSTRAINT [PK_APMT_Activity_to_Activity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Activity_Type]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Activity_Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_APMT_Activity_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Company]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Admin_id] [int] NULL,
	[Allowed] [bit] NULL,
	[Register_at] [date] NULL,
	[Update_at] [date] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Company_User]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Company_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_id] [int] NULL,
	[User_id] [int] NULL,
	[Allowed] [int] NULL,
	[isAdministrator] [bit] NULL,
	[isCreator] [bit] NULL,
	[isMember] [bit] NULL,
 CONSTRAINT [PK_APMT_Company_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Controller]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APMT_Controller](
	[ControllerName] [varchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_APMT_Controller] PRIMARY KEY CLUSTERED 
(
	[ControllerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APMT_Language]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APMT_Language](
	[ID] [varchar](2) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_APMT_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APMT_Permission]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Permission](
	[ActionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_APMT_Permission] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Process]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Process](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[JsonContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Creator_Id] [int] NULL,
	[Allowed] [bit] NULL,
 CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Process_Role]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Process_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Process_Id] [int] NULL,
 CONSTRAINT [PK_APMT_Process_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_ProductAdmin]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APMT_ProductAdmin](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](256) NULL,
	[FullName] [nvarchar](64) NULL,
	[Email] [varchar](256) NULL,
	[Avatar] [nvarchar](500) NULL,
	[Allowed] [int] NULL,
 CONSTRAINT [PK_ProductAdmin] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[APMT_Project]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Project](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Manager_Id] [int] NULL,
	[Company_Id] [int] NULL,
	[Allowed] [bit] NULL,
	[StartDay] [datetime] NULL,
	[EndDay] [datetime] NULL,
 CONSTRAINT [PK_APMT_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Project_User]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Project_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Project_id] [int] NULL,
	[User_company_id] [int] NULL,
	[Allowed] [int] NULL,
 CONSTRAINT [PK_APMT_Project_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_Task]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APMT_Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[JsonContent] [nvarchar](max) NULL,
	[Weight] [int] NULL,
	[Predecessor] [int] NULL,
	[Activity_Id] [int] NULL,
 CONSTRAINT [PK_APMT_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APMT_User]    Script Date: 3/31/2017 1:57:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APMT_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Avatar] [nvarchar](500) NULL,
	[Allowed] [int] NOT NULL,
	[Create_at] [date] NOT NULL,
	[Update_at] [date] NOT NULL,
	[IsProAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[APMT_Action] ON 

INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (87, N'APMT_ActionController_Create', N'Thêm mới Actions', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (88, N'APMT_ActionController_Delete', N'Xóa Action', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (89, N'APMT_ActionController_DeleteConfirmed', N'Xác Nhận Xóa', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (90, N'APMT_ActionController_Details', N'Xem chi tiết action', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (91, N'APMT_ActionController_Edit', N'Chỉnh sửa action', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (92, N'APMT_ActionController_Index', N'Xem danh sách Actions', N'APMT_ActionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (93, N'APMT_ControllerController_Create', N'Thêm mới controller', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (94, N'APMT_ControllerController_Delete', N'Xóa controller', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (95, N'APMT_ControllerController_DeleteConfirmed', N'Xác nhận xóa', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (96, N'APMT_ControllerController_Details', N'Xem chi tiết controller', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (97, N'APMT_ControllerController_Edit', N'Chỉnh sửa controller', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (98, N'APMT_ControllerController_Index', N'Xem danh sách controller', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (99, N'APMT_ControllerController_UpdateController', N'Chưa có mô tả', N'APMT_ControllerController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (100, N'APMT_PermissionController_Create', N'Thêm mới permission', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (101, N'APMT_PermissionController_Delete', N'Xóa Permission', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (102, N'APMT_PermissionController_DeleteConfirmed', N'Chưa có mô tả', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (103, N'APMT_PermissionController_Details', N'Xem chi tiết permission', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (104, N'APMT_PermissionController_Edit', N'Chỉnh sửa permission', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (105, N'APMT_PermissionController_getPermission', N'Chưa có mô tả', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (106, N'APMT_PermissionController_Index', N'Xem danh sách', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (107, N'APMT_PermissionController_updatePermission', N'Chưa có mô tả', N'APMT_PermissionController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (108, N'APMT_ProductAdminController_Create', N'Thêm mới product admin', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (109, N'APMT_ProductAdminController_Delete', N'Xóa product admin', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (110, N'APMT_ProductAdminController_DeleteConfirmed', N'Xác nhận xóa', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (111, N'APMT_ProductAdminController_Details', N'Xem chi tiết product admin', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (112, N'APMT_ProductAdminController_Edit', N'Chỉnh sửa product admin', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (113, N'APMT_ProductAdminController_Index', N'Danh sách product admin', N'APMT_ProductAdminController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (114, N'BaseController_ChangeCulture', N'Chưa có mô tả', N'BaseController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (115, N'HomeController_Alive', N'Lưu sessions', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (116, N'HomeController_Index', N'Dashboard', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (117, N'HomeController_Login', N'Chưa có mô tả', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (118, N'HomeController_Logout', N'Chưa có mô tả', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (119, N'HomeController_NotificationAuthorize', N'Chưa có mô tả', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (120, N'HomeController_Profile', N'User profile', N'HomeController')
INSERT [dbo].[APMT_Action] ([ID], [ActionName], [Description], [ControllerName]) VALUES (121, N'APMT_ClientController_Index', N'Chưa có mô tả', N'APMT_ClientController')
SET IDENTITY_INSERT [dbo].[APMT_Action] OFF
SET IDENTITY_INSERT [dbo].[APMT_Activity] ON 

INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (36, N'Start', N'', 17, 0, 1, -1, N'Start')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (37, N'Elicitation', N'Get requirement from customer', 17, 25, 2, 1, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (38, N'Analysis', N'Analysis requirement and give a solution', 17, 25, 2, 2, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (39, N'End', N'', 17, 0, 1, -2, N'End')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (41, N'Specification', N'Documentation requirement', 17, 25, 1, -6, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (46, N'Validation', N'Validate requirement with customer', 17, 25, 1, -3, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (56, N'ABS', N'', 5, 0, 1, -2, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (57, N'Start', N'', 5, 0, 1, -3, N'Start')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (58, N'End', N'', 5, 0, 1, -5, N'End')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (59, N'Step', N'', 5, 0, 1, -4, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (64, N'Start', N'', 15, 0, 1, -8, N'Start')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (65, N'End', N'', 15, 0, 1, -5, N'End')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (66, N'Demo', N'demo', 15, 100, 1, -3, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (67, N'Start', N'', 2, 0, 1, -1, N'Start')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (68, N'Elicitation', N'', 2, 0, 1, 1, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (69, N'Analysis', N'', 2, 0, 1, 2, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (70, N'End', N'', 2, 0, 1, -2, N'End')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (71, N'Validation', N'', 2, 0, 1, -3, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (72, N'Specification', N'', 2, 0, 1, -6, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (73, N'???', N'', 2, 0, 1, -4, N'Decision')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (74, N'Step', N'', 2, 0, 1, -8, N'Activity')
INSERT [dbo].[APMT_Activity] ([ID], [Name], [Description], [Process_Id], [Weigth], [Type_id], [activity_key], [Category]) VALUES (75, N'End', N'', 2, 0, 1, -5, N'End')
SET IDENTITY_INSERT [dbo].[APMT_Activity] OFF
SET IDENTITY_INSERT [dbo].[APMT_Activity_to_Activity] ON 

INSERT [dbo].[APMT_Activity_to_Activity] ([ID], [FromAc], [ToAC], [Process_ID]) VALUES (1, NULL, NULL, NULL)
INSERT [dbo].[APMT_Activity_to_Activity] ([ID], [FromAc], [ToAC], [Process_ID]) VALUES (2, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[APMT_Activity_to_Activity] OFF
SET IDENTITY_INSERT [dbo].[APMT_Activity_Type] ON 

INSERT [dbo].[APMT_Activity_Type] ([ID], [Name]) VALUES (1, N'Task')
INSERT [dbo].[APMT_Activity_Type] ([ID], [Name]) VALUES (2, N'Parent Process')
SET IDENTITY_INSERT [dbo].[APMT_Activity_Type] OFF
SET IDENTITY_INSERT [dbo].[APMT_Company] ON 

INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (1, N'Q''s Company', 1, 0, CAST(0x973C0B00 AS Date), CAST(0xA13C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (2, N'DOT Company', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA03C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (3, N'GOB Company', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA13C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (4, N'ABC ', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA13C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (5, N'Ngon Restaurant', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA13C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (6, N'Coffee House', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA13C0B00 AS Date))
INSERT [dbo].[APMT_Company] ([ID], [Name], [Admin_id], [Allowed], [Register_at], [Update_at]) VALUES (7, N'ABC Barkery', 1, 0, CAST(0x993C0B00 AS Date), CAST(0xA13C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[APMT_Company] OFF
SET IDENTITY_INSERT [dbo].[APMT_Company_User] ON 

INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (7, 1, 1, 1, 0, 1, 1)
INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (19, 1, 7, 1, 1, 1, 1)
INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (59, 1, 2, 1, 1, 0, 1)
INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (62, 1, 3, 1, 0, 0, 1)
INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (63, 1, 23, 1, 0, 0, 1)
INSERT [dbo].[APMT_Company_User] ([ID], [Company_id], [User_id], [Allowed], [isAdministrator], [isCreator], [isMember]) VALUES (64, 1, 4, 1, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[APMT_Company_User] OFF
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'APMT_ActionController', N'Action in Controller')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'APMT_ClientController', N'Don''t have description')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'APMT_ControllerController', N'List Controller')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'APMT_PermissionController', N'Permission')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'APMT_ProductAdminController', N'User Management')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'BaseController', N'Don''t have description')
INSERT [dbo].[APMT_Controller] ([ControllerName], [Description]) VALUES (N'HomeController', N'Dashboard')
INSERT [dbo].[APMT_Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'English', 0)
INSERT [dbo].[APMT_Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Việt Nam', 1)
INSERT [dbo].[APMT_Permission] ([ActionId], [UserId], [Description]) VALUES (91, 1, NULL)
INSERT [dbo].[APMT_Permission] ([ActionId], [UserId], [Description]) VALUES (113, 2, NULL)
INSERT [dbo].[APMT_Permission] ([ActionId], [UserId], [Description]) VALUES (121, 1, NULL)
SET IDENTITY_INSERT [dbo].[APMT_Process] ON 

INSERT [dbo].[APMT_Process] ([ID], [Name], [JsonContent], [Description], [Creator_Id], [Allowed]) VALUES (2, N'Testing', N'{ "class": "go.GraphLinksModel",
  "linkFromPortIdProperty": "fromPort",
  "linkToPortIdProperty": "toPort",
  "nodeDataArray": [ 
{"key":-1, "category":"Start", "loc":"175 0", "text":"Start"},
{"key":1, "category":"Activity", "loc":"175 100", "text":"Elicitation"},
{"key":2, "category":"Activity", "loc":"175 190", "text":"Analysis"},
{"key":-2, "category":"End", "loc":"180 420", "text":"End"},
{"category":"Activity", "text":"Validation", "key":-3, "loc":"190 330"},
{"category":"Activity", "text":"Specification", "key":-6, "loc":"190 270"},
{"category":"Decision", "text":"???", "figure":"Diamond", "key":-4, "loc":"330 330"},
{"category":"Activity", "text":"Step", "key":-8, "loc":"450 330"},
{"category":"End", "text":"End", "key":-5, "loc":"540 330"}
 ],
  "linkDataArray": [ 
{"from":1, "to":2, "fromPort":"B", "toPort":"T", "points":[ 175.00000000000009,116.30000000000001,175.00000000000009,126.30000000000001,175.00000000000009,145,174.99999999999991,145,174.99999999999991,163.7,174.99999999999991,173.7 ]},
{"from":-1, "to":1, "fromPort":"B", "toPort":"T", "points":[ 175,25.209302325581397,175,35.2093023255814,175,54.4546511627907,175.00000000000009,54.4546511627907,175.00000000000009,73.7,175.00000000000009,83.7 ]},
{"from":2, "to":1, "fromPort":"L", "toPort":"L", "points":[ 136.49999999999991,190,126.49999999999991,190,121.50000000000009,190,121.50000000000009,145,121.50000000000009,100,131.50000000000009,100 ]},
{"from":2, "to":-6, "fromPort":"B", "toPort":"T", "points":[ 175,206.29999999999998,175,216.29999999999998,175,230,190,230,190,243.7,190,253.7 ]},
{"from":-6, "to":-3, "fromPort":"B", "toPort":"L", "points":[ 190,286.3,190,296.3,190,301,136.9044418334962,301,136.9044418334962,330,146.9044418334962,330 ]},
{"from":-4, "to":-2, "fromPort":"B", "toPort":"T", "points":[330,362.09999999999997,330,372.09999999999997,330,380.62558139534883,180,380.62558139534883,180,389.1511627906977,180,399.1511627906977]},
{"from":-6, "to":1, "fromPort":"R", "toPort":"R", "points":[ 244,270,254,270,254,100,241.25,100,228.5,100,218.5,100 ]},
{"from":-3, "to":-4, "fromPort":"R", "toPort":"L", "points":[233.0955581665039,330,243.0955581665039,330,259.79777908325195,330,259.79777908325195,330,276.5,330,286.5,330]},
{"from":-4, "to":-8, "fromPort":"R", "toPort":"L", "points":[373.5,330,383.5,330,399.5,330,399.5,330,415.5,330,425.5,330]},
{"from":-8, "to":-5, "fromPort":"R", "toPort":"L", "points":[474.5,330,484.5,330,496.8255813953488,330,496.8255813953488,330,509.15116279069764,330,519.1511627906976,330]}
 ]}', N'This is description', 19, 1)
INSERT [dbo].[APMT_Process] ([ID], [Name], [JsonContent], [Description], [Creator_Id], [Allowed]) VALUES (5, N'Customer support process', N'{ "class": "go.GraphLinksModel",
  "modelData": {"position":"-8.337209302325562 -447.3372093023256"},
  "nodeDataArray": [ 
{"text":"ABC", "key":-2, "loc":"250 -450"},
{"category":"Start", "text":"Start", "key":-3, "loc":"100 -400"},
{"category":"End", "text":"End", "key":-5, "loc":"350 -400"},
{"category":"Activity", "text":"Step", "key":-4, "loc":"350 -480"}
 ],
  "linkDataArray": [ 
{"from":-3, "to":-2, "points":[125.20930232558139,-400,135.2093023255814,-400,175.10465116279082,-400,175.10465116279082,-449.99999999999994,215.00000000000023,-449.99999999999994,225.00000000000023,-449.99999999999994]},
{"from":-2, "points":[275.0000000000002,-449.99999999999994,285.0000000000002,-449.99999999999994,285.0000000000002,-449.99999999999994,285.0000000000002,-483,325.34375,-483,335.34375,-483]},
{"from":-4, "to":-5, "points":[350,-463.7,350,-453.7,350,-442.27441860465115,350,-442.27441860465115,350,-430.8488372093023,350,-420.8488372093023]}
 ]}', N'This is description for this project', 19, 1)
INSERT [dbo].[APMT_Process] ([ID], [Name], [JsonContent], [Description], [Creator_Id], [Allowed]) VALUES (14, N'Architecture process', N'{ "class": "go.GraphLinksModel",
  "modelData": {"position":"-277 42.02325581395348"},
  "nodeDataArray": [ 
{"text":"Start", "figure":"Circle", "fill":"#00AD5F", "key":-1, "loc":"-160 90"},
{"text":"Step", "key":-2, "loc":"-40 90"},
{"text":"Step", "key":-3, "loc":"80 90"},
{"text":"End", "figure":"Circle", "fill":"#CE0620", "key":-5, "loc":"240 80"}
 ],
  "linkDataArray": [ 
{"from":-1, "to":-2, "points":[-122.66279069767442,90,-112.66279069767442,90,-93.83139534883722,90,-93.83139534883722,90,-75,90,-65,90]},
{"from":-2, "to":-3, "points":[-15,90,-5,90,20,90,20,90,45,90,55,90]},
{"from":-3, "to":-5, "points":[105,90,115,90,156.01162790697674,90,156.01162790697674,80,197.02325581395348,80,207.02325581395348,80]}
 ]}', N'This is description', 19, 1)
INSERT [dbo].[APMT_Process] ([ID], [Name], [JsonContent], [Description], [Creator_Id], [Allowed]) VALUES (15, N'New Process', N'{ "class": "go.GraphLinksModel",
  "modelData": {"position":"-5 117.66279069767441"},
  "nodeDataArray": [ 
{"category":"Start", "text":"Start", "key":-8, "loc":"130 160"},
{"category":"End", "text":"End", "key":-5, "loc":"350 160"},
{"category":"Activity", "text":"Demo", "key":-3, "loc":"250 160"}
 ],
  "linkDataArray": [ 
{"from":-8, "to":-3, "points":[155.2093023255814,160,165.2093023255814,160,188.1046511627907,160,188.1046511627907,160,211,160,221,160]},
{"from":-3, "to":-5, "points":[279,160,289,160,304.0755813953489,160,304.0755813953489,160,319.1511627906977,160,329.1511627906977,160]}
 ]}', N'new process', 19, 1)
INSERT [dbo].[APMT_Process] ([ID], [Name], [JsonContent], [Description], [Creator_Id], [Allowed]) VALUES (17, N'New Process', N'{ "class": "go.GraphLinksModel",
  "linkFromPortIdProperty": "fromPort",
  "linkToPortIdProperty": "toPort",
  "nodeDataArray": [ 
{"key":-1, "category":"Start", "loc":"175 0", "text":"Start"},
{"key":1, "category":"Activity", "loc":"175 100", "text":"Elicitation"},
{"key":2, "category":"Activity", "loc":"175 190", "text":"Analysis"},
{"key":-2, "category":"End", "loc":"180 420", "text":"End"},
{"category":"Activity", "text":"Validation", "key":-3, "loc":"190 330"},
{"category":"Activity", "text":"Specification", "key":-6, "loc":"190 270"}
 ],
  "linkDataArray": [ 
{"from":1, "to":2, "fromPort":"B", "toPort":"T", "points":[ 175.00000000000009,116.30000000000001,175.00000000000009,126.30000000000001,175.00000000000009,145,174.99999999999991,145,174.99999999999991,163.7,174.99999999999991,173.7 ]},
{"from":-1, "to":1, "fromPort":"B", "toPort":"T", "points":[ 175,25.209302325581397,175,35.2093023255814,175,54.4546511627907,175.00000000000009,54.4546511627907,175.00000000000009,73.7,175.00000000000009,83.7 ]},
{"from":2, "to":1, "fromPort":"L", "toPort":"L", "points":[ 136.49999999999991,190,126.49999999999991,190,121.50000000000009,190,121.50000000000009,145,121.50000000000009,100,131.50000000000009,100 ]},
{"from":2, "to":-6, "fromPort":"B", "toPort":"T", "points":[ 175,206.29999999999998,175,216.29999999999998,175,230,190,230,190,243.7,190,253.7 ]},
{"from":-6, "to":-3, "fromPort":"B", "toPort":"L", "points":[ 190,286.3,190,296.3,190,301,136.9044418334962,301,136.9044418334962,330,146.9044418334962,330 ]},
{"from":-6, "to":1, "fromPort":"R", "toPort":"R", "points":[ 244,270,254,270,254,100,241.25,100,228.5,100,218.5,100 ]},
{"from":-3, "to":-2, "fromPort":"B", "toPort":"T", "points":[190,346.3,190,356.3,190,372.72558139534885,180,372.72558139534885,180,389.1511627906977,180,399.1511627906977]}
 ]}', N'New process', 19, 1)
SET IDENTITY_INSERT [dbo].[APMT_Process] OFF
SET IDENTITY_INSERT [dbo].[APMT_ProductAdmin] ON 

INSERT [dbo].[APMT_ProductAdmin] ([UserId], [Password], [FullName], [Email], [Avatar], [Allowed]) VALUES (1, N'123456', N'Le Cong Thang', N'abc@gmail.com', N'avatar.png', 1)
INSERT [dbo].[APMT_ProductAdmin] ([UserId], [Password], [FullName], [Email], [Avatar], [Allowed]) VALUES (2, N'123456', N'user', N'admin@gmail.com', N'avatar.png', 1)
INSERT [dbo].[APMT_ProductAdmin] ([UserId], [Password], [FullName], [Email], [Avatar], [Allowed]) VALUES (3, N'123', N'Thắng', N'abv@gmail.com', N'avatar.png', 1)
INSERT [dbo].[APMT_ProductAdmin] ([UserId], [Password], [FullName], [Email], [Avatar], [Allowed]) VALUES (4, N'123', N'Kim Quang', N'kimquang@gmail.com', N'avatar.png', 1)
SET IDENTITY_INSERT [dbo].[APMT_ProductAdmin] OFF
SET IDENTITY_INSERT [dbo].[APMT_Project] ON 

INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (50, N'APMT 19', N'tớt nghiếp', 19, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (51, N'APMT 7', N'tớt nghiếp', 7, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (52, N'APMT 62', N'tớt nghiếp', 62, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (53, N'APMT 63', N'tớt nghiếp', 63, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (54, N'APMT 64', N'tớt nghiếp', 64, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
INSERT [dbo].[APMT_Project] ([ID], [Name], [Description], [Manager_Id], [Company_Id], [Allowed], [StartDay], [EndDay]) VALUES (55, N'APMT 59', N'tớt nghiếp', 59, 1, 1, CAST(0x0000A72900000000 AS DateTime), CAST(0x0000A74500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[APMT_Project] OFF
SET IDENTITY_INSERT [dbo].[APMT_Project_User] ON 

INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (4, 50, 62, 1)
INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (5, 50, 63, 1)
INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (6, 51, 7, 1)
INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (7, 52, 19, 1)
INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (9, 53, 59, 1)
INSERT [dbo].[APMT_Project_User] ([ID], [Project_id], [User_company_id], [Allowed]) VALUES (10, 50, 64, 1)
SET IDENTITY_INSERT [dbo].[APMT_Project_User] OFF
SET IDENTITY_INSERT [dbo].[APMT_Task] ON 

INSERT [dbo].[APMT_Task] ([ID], [Name], [Description], [JsonContent], [Weight], [Predecessor], [Activity_Id]) VALUES (12, N'New task', N'new task', NULL, 10, 1, 46)
INSERT [dbo].[APMT_Task] ([ID], [Name], [Description], [JsonContent], [Weight], [Predecessor], [Activity_Id]) VALUES (13, N'ewew', N'ưe', NULL, 21, 2, 46)
SET IDENTITY_INSERT [dbo].[APMT_Task] OFF
SET IDENTITY_INSERT [dbo].[APMT_User] ON 

INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (1, N'kimquang1995@gmail.com', N'Du Kim Quang', N'123123', N'quang-1.jpg', 1, CAST(0x973C0B00 AS Date), CAST(0x973C0B00 AS Date), 0)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (2, N'luan@gmail.com', N'Cu Minh Luan', N'123123', N'luffy-1.png', 1, CAST(0x973C0B00 AS Date), CAST(0x973C0B00 AS Date), 0)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (3, N'quan@gmail.com', N'Le Minh Quan', N'123123', N'natsun-1.jpg', 1, CAST(0x973C0B00 AS Date), CAST(0x973C0B00 AS Date), 0)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (4, N'nghia@gmail.com', N'Nguyen Trong Nghia', N'123123', N'naruto-1.png', 1, CAST(0x973C0B00 AS Date), CAST(0x973C0B00 AS Date), 1)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (5, N'minh@gmail.com', N'Luu Quan Minh', N'123123', N'sasuke-1.jpg', 0, CAST(0x973C0B00 AS Date), CAST(0x973C0B00 AS Date), 1)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (7, N'lecongthang454@gmail.com', N'Lê Công Thắng', N'123', N'person-flat.png', 1, CAST(0x993C0B00 AS Date), CAST(0x9E3C0B00 AS Date), 1)
INSERT [dbo].[APMT_User] ([ID], [Email], [Fullname], [Password], [Avatar], [Allowed], [Create_at], [Update_at], [IsProAdmin]) VALUES (23, N'maiphuochung24@gmail.com', N'Mai Phước Hưng', N'123456', NULL, 1, CAST(0x9C3C0B00 AS Date), CAST(0x9C3C0B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[APMT_User] OFF
ALTER TABLE [dbo].[APMT_Language] ADD  CONSTRAINT [DF_APMT_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[APMT_Action]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Action_APMT_Controller] FOREIGN KEY([ControllerName])
REFERENCES [dbo].[APMT_Controller] ([ControllerName])
GO
ALTER TABLE [dbo].[APMT_Action] CHECK CONSTRAINT [FK_APMT_Action_APMT_Controller]
GO
ALTER TABLE [dbo].[APMT_Activity]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Activity_APMT_Activity_Type] FOREIGN KEY([Type_id])
REFERENCES [dbo].[APMT_Activity_Type] ([ID])
GO
ALTER TABLE [dbo].[APMT_Activity] CHECK CONSTRAINT [FK_APMT_Activity_APMT_Activity_Type]
GO
ALTER TABLE [dbo].[APMT_Activity]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Activity_APMT_Process1] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[APMT_Process] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[APMT_Activity] CHECK CONSTRAINT [FK_APMT_Activity_APMT_Process1]
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Activity] FOREIGN KEY([FromAc])
REFERENCES [dbo].[APMT_Activity] ([ID])
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity] CHECK CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Activity]
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Activity1] FOREIGN KEY([ToAC])
REFERENCES [dbo].[APMT_Activity] ([ID])
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity] CHECK CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Activity1]
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Process] FOREIGN KEY([Process_ID])
REFERENCES [dbo].[APMT_Process] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[APMT_Activity_to_Activity] CHECK CONSTRAINT [FK_APMT_Activity_to_Activity_APMT_Process]
GO
ALTER TABLE [dbo].[APMT_Company_User]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Company_User_APMT_Company] FOREIGN KEY([Company_id])
REFERENCES [dbo].[APMT_Company] ([ID])
GO
ALTER TABLE [dbo].[APMT_Company_User] CHECK CONSTRAINT [FK_APMT_Company_User_APMT_Company]
GO
ALTER TABLE [dbo].[APMT_Company_User]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Company_User_APMT_User] FOREIGN KEY([User_id])
REFERENCES [dbo].[APMT_User] ([ID])
GO
ALTER TABLE [dbo].[APMT_Company_User] CHECK CONSTRAINT [FK_APMT_Company_User_APMT_User]
GO
ALTER TABLE [dbo].[APMT_Permission]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Permission_APMT_Action] FOREIGN KEY([ActionId])
REFERENCES [dbo].[APMT_Action] ([ID])
GO
ALTER TABLE [dbo].[APMT_Permission] CHECK CONSTRAINT [FK_APMT_Permission_APMT_Action]
GO
ALTER TABLE [dbo].[APMT_Permission]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Permission_APMT_ProductAdmin] FOREIGN KEY([UserId])
REFERENCES [dbo].[APMT_ProductAdmin] ([UserId])
GO
ALTER TABLE [dbo].[APMT_Permission] CHECK CONSTRAINT [FK_APMT_Permission_APMT_ProductAdmin]
GO
ALTER TABLE [dbo].[APMT_Process]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Process_APMT_Company_User] FOREIGN KEY([Creator_Id])
REFERENCES [dbo].[APMT_Company_User] ([ID])
GO
ALTER TABLE [dbo].[APMT_Process] CHECK CONSTRAINT [FK_APMT_Process_APMT_Company_User]
GO
ALTER TABLE [dbo].[APMT_Process_Role]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Process_Role_APMT_Process] FOREIGN KEY([Process_Id])
REFERENCES [dbo].[APMT_Process] ([ID])
GO
ALTER TABLE [dbo].[APMT_Process_Role] CHECK CONSTRAINT [FK_APMT_Process_Role_APMT_Process]
GO
ALTER TABLE [dbo].[APMT_Project]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Project_APMT_Company] FOREIGN KEY([Company_Id])
REFERENCES [dbo].[APMT_Company] ([ID])
GO
ALTER TABLE [dbo].[APMT_Project] CHECK CONSTRAINT [FK_APMT_Project_APMT_Company]
GO
ALTER TABLE [dbo].[APMT_Project]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Project_APMT_Company_User] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[APMT_Company_User] ([ID])
GO
ALTER TABLE [dbo].[APMT_Project] CHECK CONSTRAINT [FK_APMT_Project_APMT_Company_User]
GO
ALTER TABLE [dbo].[APMT_Project_User]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Project_User_APMT_Company_User] FOREIGN KEY([User_company_id])
REFERENCES [dbo].[APMT_Company_User] ([ID])
GO
ALTER TABLE [dbo].[APMT_Project_User] CHECK CONSTRAINT [FK_APMT_Project_User_APMT_Company_User]
GO
ALTER TABLE [dbo].[APMT_Task]  WITH CHECK ADD  CONSTRAINT [FK_APMT_Task_APMT_Activity] FOREIGN KEY([Activity_Id])
REFERENCES [dbo].[APMT_Activity] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[APMT_Task] CHECK CONSTRAINT [FK_APMT_Task_APMT_Activity]
GO
