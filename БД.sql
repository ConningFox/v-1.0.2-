create database [Restoran]
go

use [Restoran]
go

create table [dbo].[Authorization]
(
	[ID_Authorization] [int] not null identity(1,1),
	[Login] [varchar] (16) not null,
	[Password] [varchar] (16) not null
	constraint [UQ_Login] unique ([Login]),
	constraint [CH_Login_Min] check (len([Login]) >= 4),
	constraint [CH_Password_Min] check (len([Password]) >= 4),	
	constraint [CH_Login_Max] check (len([Login]) <= 16),
	constraint [CH_Password_Max] check (len([Password]) <= 16),
	constraint [PK_Authorization] primary key clustered ([ID_Authorization] ASC) on [PRIMARY]
)

create table [dbo].[Employee]
(
	[Authorization_ID] [int] not null,
	[Surname_Employee] [varchar] (25) not null,
	[Name_Employee] [varchar] (25) not null,
	[Middlename_Employee] [varchar] (25) not null
	constraint [PK_Employee] primary key clustered ([Authorization_ID] ASC) on [PRIMARY],
	constraint [FK_Authorization_Employee] foreign key ([Authorization_ID]) references [dbo].[Authorization] ([ID_Authorization]) 
		on update cascade
		on delete cascade
)

--Таблица
create table [dbo].[Order]
(
	[ID_Order] [int] not null identity(1,1),
	[payment method] [varchar] (25) not null,
	[table] [varchar] (25) not null,
	[set] [varchar] (25) not null,
	[qty. servings] [int] not null,
	[day] [varchar] (25) not null
	constraint [PK_Order] primary key clustered ([ID_Order] ASC) on [PRIMARY]
)