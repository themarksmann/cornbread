CREATE TABLE [tblChardoc] (
	[DOCUMENT_ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ACCESSION_NUMBER] [varchar] (12) NOT NULL ,
	[TITLE] [varchar] (1000) NULL CONSTRAINT [DF_tblChardoc_TITLE] DEFAULT ('Not Available'),
	[AUTHOR] [varchar] (255) NULL CONSTRAINT [DF_tblChardoc_AUTHOR] DEFAULT ('Not Available'),
	[DOCUMENT_NUMBER] [varchar] (500) NULL CONSTRAINT [DF_tblChardoc_DOCUMENT_NUMBER] DEFAULT ('Not Available'),
	[DOCUMENT_DATE] [varchar] (255) NULL CONSTRAINT [DF_tblChardoc] DEFAULT ('Not Available'),
	[DOCUMENT_YEAR] [int] NULL ,
	[COMPANY_SOURCE] [varchar] (255) NULL CONSTRAINT [DF_tblChardoc_COMPANY_SOURCE] DEFAULT ('Not Available'),
	[LOCATION] [varchar] (255) NULL CONSTRAINT [DF_tblChardoc_LOCATION] DEFAULT ('Not Available'),
	[DOCUMENT_TYPE] [varchar] (255) NULL CONSTRAINT [DF_tblChardoc_DOCUMENT_TYPE] DEFAULT ('Not Available'),
	[ABSTRACT] [text] NULL CONSTRAINT [DF_tblChardoc_ABSTRACT] DEFAULT ('Not Available'),
	[DESCRIPTORS] [text] NULL CONSTRAINT [DF_tblChardoc_DESCRIPTORS] DEFAULT ('Not Available'),
	[DATE_ENTERED] [timestamp] NULL ,
	[ENTERED_BY] [varchar] (25) NULL CONSTRAINT [DF_tblChardoc_ENTERED_BY] DEFAULT (suser_sname()),
	CONSTRAINT [PK_tblChardoc] PRIMARY KEY  NONCLUSTERED 
	(
		[DOCUMENT_ID]
	) WITH  FILLFACTOR = 90  ON [PRIMARY] 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


