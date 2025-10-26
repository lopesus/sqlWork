use Wallet
go

create table dbo.AwCodaInvio
(
    IdCodaInvio     int identity
        constraint PK_AwCodaInvio
            primary key on AW_DATA,
    IdCodaInvioTipo smallint      not null
        constraint FK_AwCodaInvio_AwCodaInvioTipo
            references dbo.AwCodaInvioTipo,
    OperazioneID    int
        constraint FK_AwCodaInvio_OpMaster
            references dbo.OpMaster,
    IdCittadino     int
        constraint FK_AwCodaInvio_AwCittadino
            references dbo.AwCittadino,
    EsercizioID     int,
    DataEvento      datetime      not null,
    DataUltimoInvio datetime,
    IdServer        int           not null,
    IsAutomatica    bit           not null,
    RetryOnFail     bit default 0 not null,
    UserInsert      int           not null,
    DateInsert      datetime      not null,
    DataAvvio       datetime
)
go

create index FK_AwCodaInvio_AwCittadino
    on dbo.AwCodaInvio (IdCittadino)
    on AW_DATA
go

create index FK_AwCodaInvio_AwCodaInvioTipo
    on dbo.AwCodaInvio (IdCodaInvioTipo)
    on AW_DATA
go

create index FK_AwCodaInvio_OpMaster
    on dbo.AwCodaInvio (OperazioneID)
    on AW_DATA
go

select top 10 *
from AwCodaInvio;
select *
from AwCodaInvioTipo;