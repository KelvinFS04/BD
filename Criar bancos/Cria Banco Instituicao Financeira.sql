CREATE DATABASE [InstituicaoFinanceira]
GO
USE [InstituicaoFinanceira]
GO
/****** Object:  Table [dbo].[contaCorrente]    Script Date: 25/04/2016 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contaCorrente](
	[contaCorrente] [varchar](20) NOT NULL,
	[correntista] [varchar](100) NULL,
	[dataAbertura] [smalldatetime] NULL,
	[saldoAtual] [decimal](10, 2) NULL,
 CONSTRAINT [PK_contaCorrente] PRIMARY KEY CLUSTERED 
(
	[contaCorrente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[controleAberturas]    Script Date: 25/04/2016 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[controleAberturas](
	[data] [smalldatetime] NOT NULL,
	[qtdContasAberta] [int] NULL,
	[valorDepositos] [decimal](10, 2) NULL,
 CONSTRAINT [PK_controleAberturas] PRIMARY KEY CLUSTERED 
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[limites]    Script Date: 25/04/2016 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[limites](
	[contaCorrente] [varchar](20) NOT NULL,
	[data] [smalldatetime] NOT NULL,
	[valor] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[contaCorrente] ASC,
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[movimentacao]    Script Date: 25/04/2016 22:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[movimentacao](
	[transacao] [int] IDENTITY(1,1) NOT NULL,
	[contaCorrente] [varchar](20) NULL,
	[valor] [decimal](10, 2) NULL,
	[tipo] [varchar](1) NOT NULL,
	[data] [smalldatetime] NULL,
 CONSTRAINT [PK_movimentacao] PRIMARY KEY CLUSTERED 
(
	[transacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[limites]  WITH CHECK ADD  CONSTRAINT [FK_limites_contaCorrente] FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[contaCorrente] ([contaCorrente])
GO
ALTER TABLE [dbo].[limites] CHECK CONSTRAINT [FK_limites_contaCorrente]
GO
ALTER TABLE [dbo].[movimentacao]  WITH CHECK ADD  CONSTRAINT [FK_movimentacao_contaCorrente] FOREIGN KEY([contaCorrente])
REFERENCES [dbo].[contaCorrente] ([contaCorrente])
GO
ALTER TABLE [dbo].[movimentacao] CHECK CONSTRAINT [FK_movimentacao_contaCorrente]
GO
