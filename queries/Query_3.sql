use RMS_Sviluppo
go

create table dbo.tbl_CS_Rows
(
    IDDocument            varchar(36)                   not null
        constraint FK_tbl_CS_Rows_tbl_CS
            references dbo.tbl_CS,
    IDRow                 varchar(36)
        constraint DF_tbl_CS_Rows_IDRow default newid() not null,
    InternalID            int,
    RowRevision           varchar(10)                   not null,
    RowType               varchar(10)                   not null
        constraint FK_tbl_CS_Rows_tbl_RowType
            references dbo.tbl_RowType,
    Text                  nvarchar(max),
    IDParent              varchar(36),
    Modified              bit                           not null,
    OriginalID            varchar(36),
    SectionFullName       varchar(250),
    SectionLevel          int,
    SectionCodePresent    bit,
    SectionCode           varchar(50),
    AttachFullPath        varchar(max),
    AttachFileName        varchar(250),
    TabReqStructure       varchar(max),
    TabReqKey             varchar(250),
    cCalderoneExtractions varchar(max),
    cCalderoneSao         varchar(max),
    Position              int,
    TextModified          bit,
    PictureWidthPoint     int,
    PictureHeightPoint    int,
    AttachEmbaddedImage   varchar(100),
    OpenXMLData           varchar(max),
    IdUserIns             varchar(36),
    IdUserLastMod         varchar(36),
    DateIns               datetime,
    DateLastMod           datetime,
    MinRequirementClass   varchar(255),
    ProposedText          nvarchar(max),
    Prio_1_0              varchar(2),
    Prio_1_1              varchar(2),
    Prio_2_0              varchar(2),
    Prio_3_0              varchar(2),
    Title                 varchar(500),
    KeepTableInOnePage    bit,
    RepeatTableHeader     bit,
    TableHeaderRowsNumber int,
    HiperlinkText         nvarchar(max),
    OriginalRowIdentifier varchar(20),
    NewPageBefore         bit
        constraint DF_tbl_CS_Rows_NewPageBefore default 0,
    IsLandscapePage       bit
        constraint DF_tbl_CS_Rows_IsLandscapePage default 0,
    InternalPosition      int,
    FitTableWidthToPage   bit,
    FlTitleOnTop          bit,
    GroupCode             varchar(50),
    GroupingClause        bit,
    QVScribeRank          int,
    IsIogp                bit,
    IogpDocumentKey       varchar(50),
    IogpRowStatus         varchar(50),
    IogpStdDocId          varchar(36),
    constraint PK_tbl_CS_Rows
        primary key (IDDocument, IDRow),
    constraint FK_tbl_CS_Rows_tbl_CS_Rows
        foreign key (IDDocument, IDRow) references dbo.tbl_CS_Rows
)
go

