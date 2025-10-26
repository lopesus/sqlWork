use RMS_Sviluppo
go

CREATE VIEW [dbo].[v_CS]
AS
SELECT tbl_CS.IDDocument
	,tbl_CS.EniCode
	,tbl_CS.Revision
	,tbl_CS.Title
	,tbl_CS.Note
	,tbl_CS.OwnershipRationale
	,tbl_CS.Abstract
	,tbl_CS.IDActivity
	,ISNULL(tbl_Activity.[Description], '') AS Activity
	,tbl_CS.IDDiscipline
	,ISNULL(tbl_Discipline.[Description], '') AS Discipline
	,tbl_CS.IDType
	,ISNULL(tbl_Type.[Description], '') AS [Type]
	,tbl_CS.IDStatus
	,ISNULL(tbl_DocStatus.[Description], '') AS DocStatus
	,ISNULL(tbl_DocStatus.StatusGroupFilter, '') AS StatusGroupFilter
	,tbl_CS.IDLanguage
	,ISNULL(Tbl_Anag_Languages.[Description], '') AS [Language]
	,tbl_CS.StandardGroup
	,ISNULL(tbl_Anag_STDGroup.[Description], '') AS [StandardGroupDescription]
	,tbl_CS.IssueDate
	,tbl_CS.RevMajor
	,tbl_CS.RevMinor
	,tbl_CS.IsAmendment
	,tbl_CS.AmendmentDescription
	,tbl_CS.MaxTocHeadingLevel
	,tbl_CS.IDBu
	,ISNULL(tbl_Anag_BU.[Description], '') AS [Bu]
	,tbl_CS.IDUnit
	,ISNULL(tbl_Anag_Unit.[Description], '') AS [Unit]
	,tbl_CS.DocumentOwner
	,tbl_CS.SpaceBeforeTitle
	,tbl_CS.SpaceAfterAbstract
	,tbl_CS.PageLeftMarginInCentimeters
	,tbl_CS.PageRightMarginInCentimeters
	,tbl_CS.SubstitutedBy
	,tbl_CS.OpiNr
	,tbl_CS.IntStandardCoverage
	,tbl_CS.Standard1
	,tbl_CS.Standard2
	,tbl_CS.Standard3
	,tbl_CS.DisciplineNote
	,tbl_CS.AdminNote
	,tbl_CS.IDForecastAction
	,tbl_CS.ForecastFirstIssue
	,tbl_CS.ForecastFinalIssue
	,tbl_CS.ForecastIssueReason
	,ISNULL(tbl_CS.ForecastProgress, 0) AS ForecastProgress
	,EniReferenceStandard
	,AdoptionStatus
	,v_CS_DocumentCode_Formatter.DocumentFormattedCode
	,v_CS_DocumentCode_Formatter.ShortCode
	,v_CS_DocumentCode_Formatter.DocumentFormattedCodeNOrev
	,tbl_CS.DocType
	,tbl_Anag_DocType.[Description] AS DocTypeDesc
	,tbl_Anag_DocType.SpecificationType
	,tbl_CS.DateIns
	,tbl_CS.DateLastMod
	,tbl_CS.DataFromTaok
	,tbl_CS.IdUserIns
	,tbl_CS.IdUserLastMod
	,tbl_DocStatus.ExcelDocList
	,tbl_CS.IdValidityStatusPS
	,tbl_CS.CompanyApprover
	,tbl_CS.ContractorApprover
	,tbl_CS.LCIActivityCode
	,tbl_CS.JobNumber
	,tbl_CS.ContractorDocumentId
	,tbl_CS.ContractNumber
	,tbl_CS.DocumentScale
	,tbl_CS.PlantArea
	,tbl_CS.Facility
	,tbl_CS.SubFacility
	,tbl_CS.FunctionalUnit
	,tbl_CS.PrintHoldRecordsComments
	,tbl_CS.FirstLoad
	,isnull(tbl_CS.QvsAvg,0) as QvsAvg
	,UnitOwnerText
	,FirstPage
	,CASE WHEN tbl_CS.DocType = 'CS' THEN tbl_Type.DocumentTitle
ELSE '' END as DocumentGroupDescription
	, tbl_CS.ReferenceMSG
FROM tbl_CS
LEFT JOIN tbl_Activity ON tbl_CS.IDActivity = tbl_Activity.IDActivity
LEFT JOIN tbl_Discipline ON tbl_CS.IDDiscipline = tbl_Discipline.IDDiscipline
LEFT JOIN tbl_Type ON tbl_CS.IDType = tbl_Type.IDType
LEFT JOIN tbl_DocStatus ON tbl_CS.IDStatus = tbl_DocStatus.IDStatus
LEFT JOIN Tbl_Anag_Languages ON tbl_CS.IDLanguage = Tbl_Anag_Languages.Code
LEFT JOIN tbl_Anag_STDGroup ON tbl_CS.StandardGroup = tbl_Anag_STDGroup.Code
LEFT JOIN tbl_Anag_BU ON tbl_CS.IDBu = tbl_Anag_BU.Code
LEFT JOIN tbl_Anag_Unit ON tbl_CS.IDUnit = tbl_Anag_Unit.Code
LEFT JOIN tbl_Anag_DocType ON tbl_CS.DocType = tbl_Anag_DocType.Code
inner join v_CS_DocumentCode_Formatter on v_CS_DocumentCode_Formatter.IDDocument = tbl_cs.IDDocument
go

