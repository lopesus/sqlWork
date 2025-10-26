
      SELECT p."Id", p."AircraftTypeId", p."ContractTypeId", p."CreatedAt", p."CreatedBy", p."CurrencyId", p."CustomerId", p."DateFrom", p."DateTo", p."DeletedAt", p."DeletedBy", p."DestinationId", p."Frequency", p."GuaranteedSeatsF", p."GuaranteedSeatsP", p."GuaranteedSeatsY", p."IsDeleted", p."MasterContractId", p."Notes", p."OdFromId", p."OdToId", p."OperativeDay", p."RejectionReason", p."ReleaseSeatsF", p."ReleaseSeatsP", p."ReleaseSeatsY", p."RequestId", p."RoutingId", p."SeasonId", p."Status", p."UpdatedAt", p."UpdatedBy", p."Year", m0."Id", m0."BillingRole", m0."BrokerId", m0."ContractDate", m0."ContractNumber", m0."ContractTypeId", m0."CreatedAt", m0."CreatedBy", m0."CurrencyId", m0."CustomerId", m0."DeletedAt", m0."DeletedBy", m0."IsDeleted", m0."MainContractDate", m0."Notes", m0."PrintModelId", m0."RejectionReason", m0."SeasonId", m0."Status", m0."SupplierId", m0."Title", m0."UpdatedAt", m0."UpdatedBy", c0."Id", c0."CreatedAt", c0."CreatedBy", c0."DeletedAt", c0."DeletedBy", c0."Description", c0."IsDeleted", c0."Name", c0."UpdatedAt", c0."UpdatedBy", c2."Id", c2."Address", c2."City", c2."Code", c2."Country", c2."CreatedAt", c2."CreatedBy", c2."DeletedAt", c2."DeletedBy", c2."EmailAddress", c2."FaxNumber", c2."IsDeleted", c2."Name", c2."PhoneNumber", c2."PostalCode", c2."Role", c2."State", c2."UpdatedAt", c2."UpdatedBy", c2."VatCode", c4."Id", c4."Address", c4."City", c4."Code", c4."Country", c4."CreatedAt", c4."CreatedBy", c4."DeletedAt", c4."DeletedBy", c4."EmailAddress", c4."FaxNumber", c4."IsDeleted", c4."Name", c4."PhoneNumber", c4."PostalCode", c4."Role", c4."State", c4."UpdatedAt", c4."UpdatedBy", c4."VatCode", s0."Id", s0."CreatedAt", s0."CreatedBy", s0."DateFrom", s0."DateTo", s0."DeletedAt", s0."DeletedBy", s0."Description", s0."IsDeleted", s0."Name", s0."UpdatedAt", s0."UpdatedBy", p1."Id", p1."CreatedAt", p1."CreatedBy", p1."DeletedAt", p1."DeletedBy", p1."Description", p1."IsDeleted", p1."Name", p1."UpdatedAt", p1."UpdatedBy", c6."Id", c6."Address", c6."City", c6."Code", c6."Country", c6."CreatedAt", c6."CreatedBy", c6."DeletedAt", c6."DeletedBy", c6."EmailAddress", c6."FaxNumber", c6."IsDeleted", c6."Name", c6."PhoneNumber", c6."PostalCode", c6."Role", c6."State", c6."UpdatedAt", c6."UpdatedBy", c6."VatCode", c8."Id", c8."Address", c8."City", c8."Code", c8."Country", c8."CreatedAt", c8."CreatedBy", c8."DeletedAt", c8."DeletedBy", c8."EmailAddress", c8."FaxNumber", c8."IsDeleted", c8."Name", c8."PhoneNumber", c8."PostalCode", c8."Role", c8."State", c8."UpdatedAt", c8."UpdatedBy", c8."VatCode", a0."Id", a0."City", a0."CreatedAt", a0."CreatedBy", a0."DeletedAt", a0."DeletedBy", a0."IataCode", a0."IcaoCode", a0."IsDeleted", a0."Name", a0."UpdatedAt", a0."UpdatedBy", a2."Id", a2."City", a2."CreatedAt", a2."CreatedBy", a2."DeletedAt", a2."DeletedBy", a2."IataCode", a2."IcaoCode", a2."IsDeleted", a2."Name", a2."UpdatedAt", a2."UpdatedBy", s2."Id", s2."CreatedAt", s2."CreatedBy", s2."DateFrom", s2."DateTo", s2."DeletedAt", s2."DeletedBy", s2."Description", s2."IsDeleted", s2."Name", s2."UpdatedAt", s2."UpdatedBy", c10."Id", c10."CreatedAt", c10."CreatedBy", c10."DeletedAt", c10."DeletedBy", c10."Description", c10."IsDeleted", c10."Name", c10."UpdatedAt", c10."UpdatedBy"
      FROM "Proposals" AS p
      INNER JOIN (
          SELECT m."Id", m."BillingRole", m."BrokerId", m."ContractDate", m."ContractNumber", m."ContractTypeId", m."CreatedAt", m."CreatedBy", m."CurrencyId", m."CustomerId", m."DeletedAt", m."DeletedBy", m."IsDeleted", m."MainContractDate", m."Notes", m."PrintModelId", m."RejectionReason", m."SeasonId", m."Status", m."SupplierId", m."Title", m."UpdatedAt", m."UpdatedBy"
          FROM "MasterContracts" AS m
          WHERE NOT (m."IsDeleted")
      ) AS m0 ON p."MasterContractId" = m0."Id"
      INNER JOIN (
          SELECT c."Id", c."CreatedAt", c."CreatedBy", c."DeletedAt", c."DeletedBy", c."Description", c."IsDeleted", c."Name", c."UpdatedAt", c."UpdatedBy"
          FROM "ContractTypes" AS c
          WHERE NOT (c."IsDeleted")
      ) AS c0 ON m0."ContractTypeId" = c0."Id"
      INNER JOIN (
          SELECT c1."Id", c1."Address", c1."City", c1."Code", c1."Country", c1."CreatedAt", c1."CreatedBy", c1."DeletedAt", c1."DeletedBy", c1."EmailAddress", c1."FaxNumber", c1."IsDeleted", c1."Name", c1."PhoneNumber", c1."PostalCode", c1."Role", c1."State", c1."UpdatedAt", c1."UpdatedBy", c1."VatCode"
          FROM "Companies" AS c1
          WHERE NOT (c1."IsDeleted")
      ) AS c2 ON m0."SupplierId" = c2."Id"
      INNER JOIN (
          SELECT c3."Id", c3."Address", c3."City", c3."Code", c3."Country", c3."CreatedAt", c3."CreatedBy", c3."DeletedAt", c3."DeletedBy", c3."EmailAddress", c3."FaxNumber", c3."IsDeleted", c3."Name", c3."PhoneNumber", c3."PostalCode", c3."Role", c3."State", c3."UpdatedAt", c3."UpdatedBy", c3."VatCode"
          FROM "Companies" AS c3
          WHERE NOT (c3."IsDeleted")
      ) AS c4 ON m0."BrokerId" = c4."Id"
      INNER JOIN (
          SELECT s."Id", s."CreatedAt", s."CreatedBy", s."DateFrom", s."DateTo", s."DeletedAt", s."DeletedBy", s."Description", s."IsDeleted", s."Name", s."UpdatedAt", s."UpdatedBy"
          FROM "Seasons" AS s
          WHERE NOT (s."IsDeleted")
      ) AS s0 ON m0."SeasonId" = s0."Id"
      INNER JOIN (
          SELECT p0."Id", p0."CreatedAt", p0."CreatedBy", p0."DeletedAt", p0."DeletedBy", p0."Description", p0."IsDeleted", p0."Name", p0."UpdatedAt", p0."UpdatedBy"
          FROM "PrintModels" AS p0
          WHERE NOT (p0."IsDeleted")
      ) AS p1 ON m0."PrintModelId" = p1."Id"
      INNER JOIN (
          SELECT c5."Id", c5."Address", c5."City", c5."Code", c5."Country", c5."CreatedAt", c5."CreatedBy", c5."DeletedAt", c5."DeletedBy", c5."EmailAddress", c5."FaxNumber", c5."IsDeleted", c5."Name", c5."PhoneNumber", c5."PostalCode", c5."Role", c5."State", c5."UpdatedAt", c5."UpdatedBy", c5."VatCode"
          FROM "Companies" AS c5
          WHERE NOT (c5."IsDeleted")
      ) AS c6 ON m0."CustomerId" = c6."Id"
      INNER JOIN (
          SELECT c7."Id", c7."Address", c7."City", c7."Code", c7."Country", c7."CreatedAt", c7."CreatedBy", c7."DeletedAt", c7."DeletedBy", c7."EmailAddress", c7."FaxNumber", c7."IsDeleted", c7."Name", c7."PhoneNumber", c7."PostalCode", c7."Role", c7."State", c7."UpdatedAt", c7."UpdatedBy", c7."VatCode"
          FROM "Companies" AS c7
          WHERE NOT (c7."IsDeleted")
      ) AS c8 ON p."CustomerId" = c8."Id"
      INNER JOIN (
          SELECT a."Id", a."City", a."CreatedAt", a."CreatedBy", a."DeletedAt", a."DeletedBy", a."IataCode", a."IcaoCode", a."IsDeleted", a."Name", a."UpdatedAt", a."UpdatedBy"
          FROM "Airports" AS a
          WHERE NOT (a."IsDeleted")
      ) AS a0 ON p."OdFromId" = a0."Id"
      INNER JOIN (
          SELECT a1."Id", a1."City", a1."CreatedAt", a1."CreatedBy", a1."DeletedAt", a1."DeletedBy", a1."IataCode", a1."IcaoCode", a1."IsDeleted", a1."Name", a1."UpdatedAt", a1."UpdatedBy"
          FROM "Airports" AS a1
          WHERE NOT (a1."IsDeleted")
      ) AS a2 ON p."OdToId" = a2."Id"
      INNER JOIN (
          SELECT s1."Id", s1."CreatedAt", s1."CreatedBy", s1."DateFrom", s1."DateTo", s1."DeletedAt", s1."DeletedBy", s1."Description", s1."IsDeleted", s1."Name", s1."UpdatedAt", s1."UpdatedBy"
          FROM "Seasons" AS s1
          WHERE NOT (s1."IsDeleted")
      ) AS s2 ON p."SeasonId" = s2."Id"
      LEFT JOIN (
          SELECT c9."Id", c9."CreatedAt", c9."CreatedBy", c9."DeletedAt", c9."DeletedBy", c9."Description", c9."IsDeleted", c9."Name", c9."UpdatedAt", c9."UpdatedBy"
          FROM "ContractTypes" AS c9
          WHERE NOT (c9."IsDeleted")
      ) AS c10 ON p."ContractTypeId" = c10."Id"
      WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
      ORDER BY p."Id", m0."Id", c0."Id", c2."Id", c4."Id", s0."Id", p1."Id", c6."Id", c8."Id", a0."Id", a2."Id", s2."Id", c10."Id"
      LIMIT 1


      SELECT s9."Id", s9."CreatedAt", s9."CreatedBy", s9."DeletedAt", s9."DeletedBy", s9."IsDeleted", s9."Name", s9."Notes", s9."ProposalId", s9."RejectionReason", s9."Status", s9."UpdatedAt", s9."UpdatedBy", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."CreatedAt", s3."CreatedBy", s3."DeletedAt", s3."DeletedBy", s3."IsDeleted", s3."Name", s3."Notes", s3."ProposalId", s3."RejectionReason", s3."Status", s3."UpdatedAt", s3."UpdatedBy"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"


      SELECT s10."Id", s10."AverageProSeat", s10."BoardingPointId", s10."CreatedAt", s10."CreatedBy", s10."DateFrom", s10."DateTo", s10."DeletedAt", s10."DeletedBy", s10."DeplaningPointId", s10."Direction", s10."Frequency", s10."Invoice", s10."IsDeleted", s10."SeriesId", s10."UpdatedAt", s10."UpdatedBy", s10."Id0", s10."City", s10."CreatedAt0", s10."CreatedBy0", s10."DeletedAt0", s10."DeletedBy0", s10."IataCode", s10."IcaoCode", s10."IsDeleted0", s10."Name", s10."UpdatedAt0", s10."UpdatedBy0", s10."Id1", s10."City0", s10."CreatedAt1", s10."CreatedBy1", s10."DeletedAt1", s10."DeletedBy1", s10."IataCode0", s10."IcaoCode0", s10."IsDeleted1", s10."Name0", s10."UpdatedAt1", s10."UpdatedBy1", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT o."Id", o."AverageProSeat", o."BoardingPointId", o."CreatedAt", o."CreatedBy", o."DateFrom", o."DateTo", o."DeletedAt", o."DeletedBy", o."DeplaningPointId", o."Direction", o."Frequency", o."Invoice", o."IsDeleted", o."SeriesId", o."UpdatedAt", o."UpdatedBy", a4."Id" AS "Id0", a4."City", a4."CreatedAt" AS "CreatedAt0", a4."CreatedBy" AS "CreatedBy0", a4."DeletedAt" AS "DeletedAt0", a4."DeletedBy" AS "DeletedBy0", a4."IataCode", a4."IcaoCode", a4."IsDeleted" AS "IsDeleted0", a4."Name", a4."UpdatedAt" AS "UpdatedAt0", a4."UpdatedBy" AS "UpdatedBy0", a6."Id" AS "Id1", a6."City" AS "City0", a6."CreatedAt" AS "CreatedAt1", a6."CreatedBy" AS "CreatedBy1", a6."DeletedAt" AS "DeletedAt1", a6."DeletedBy" AS "DeletedBy1", a6."IataCode" AS "IataCode0", a6."IcaoCode" AS "IcaoCode0", a6."IsDeleted" AS "IsDeleted1", a6."Name" AS "Name0", a6."UpdatedAt" AS "UpdatedAt1", a6."UpdatedBy" AS "UpdatedBy1"
          FROM "OriginDestinations" AS o
          INNER JOIN (
              SELECT a3."Id", a3."City", a3."CreatedAt", a3."CreatedBy", a3."DeletedAt", a3."DeletedBy", a3."IataCode", a3."IcaoCode", a3."IsDeleted", a3."Name", a3."UpdatedAt", a3."UpdatedBy"
              FROM "Airports" AS a3
              WHERE NOT (a3."IsDeleted")
          ) AS a4 ON o."BoardingPointId" = a4."Id"
          INNER JOIN (
              SELECT a5."Id", a5."City", a5."CreatedAt", a5."CreatedBy", a5."DeletedAt", a5."DeletedBy", a5."IataCode", a5."IcaoCode", a5."IsDeleted", a5."Name", a5."UpdatedAt", a5."UpdatedBy"
              FROM "Airports" AS a5
              WHERE NOT (a5."IsDeleted")
          ) AS a6 ON o."DeplaningPointId" = a6."Id"
          WHERE NOT (o."IsDeleted")
      ) AS s10 ON s9."Id" = s10."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s10."Id", s10."Id0", s10."Id1"


      SELECT s11."Id", s11."CreatedAt", s11."CreatedBy", s11."DeletedAt", s11."DeletedBy", s11."EconomyFareBasisId", s11."EconomySeats", s11."FirstSeats", s11."FlightIntegrationId", s11."IsDeleted", s11."OperativeDay", s11."OriginDestinationId", s11."PremiumFareBasisId", s11."PremiumSeats", s11."ReleaseEconomySeats", s11."ReleaseFirstSeats", s11."ReleasePremiumSeats", s11."UpdatedAt", s11."UpdatedBy", s11."Id0", s11."CreatedAt0", s11."CreatedBy0", s11."DeletedAt0", s11."DeletedBy0", s11."EquipmentAcvCCompartmentSeats", s11."EquipmentAcvYCompartmentSeats", s11."EquipmentAircraftType", s11."EquipmentDesignators", s11."EquipmentServiceType", s11."FlightType", s11."IsDeleted0", s11."RotationCode", s11."Routing", s11."SegmentAircraftOwner", s11."SegmentAirline", s11."SegmentArrivalDateTime", s11."SegmentBoardingPoint", s11."SegmentCabinCrew", s11."SegmentCockpitCrew", s11."SegmentDepartureDateTime", s11."SegmentDeplaningPoint", s11."SegmentFlightIdentifier", s11."SegmentFlightNumber", s11."UpdatedAt0", s11."UpdatedBy0", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s10."Id", s10."Id0", s10."Id1"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT o."Id", o."SeriesId", a4."Id" AS "Id0", a6."Id" AS "Id1"
          FROM "OriginDestinations" AS o
          INNER JOIN (
              SELECT a3."Id"
              FROM "Airports" AS a3
              WHERE NOT (a3."IsDeleted")
          ) AS a4 ON o."BoardingPointId" = a4."Id"
          INNER JOIN (
              SELECT a5."Id"
              FROM "Airports" AS a5
              WHERE NOT (a5."IsDeleted")
          ) AS a6 ON o."DeplaningPointId" = a6."Id"
          WHERE NOT (o."IsDeleted")
      ) AS s10 ON s9."Id" = s10."SeriesId"
      INNER JOIN (
          SELECT f."Id", f."CreatedAt", f."CreatedBy", f."DeletedAt", f."DeletedBy", f."EconomyFareBasisId", f."EconomySeats", f."FirstSeats", f."FlightIntegrationId", f."IsDeleted", f."OperativeDay", f."OriginDestinationId", f."PremiumFareBasisId", f."PremiumSeats", f."ReleaseEconomySeats", f."ReleaseFirstSeats", f."ReleasePremiumSeats", f."UpdatedAt", f."UpdatedBy", f1."Id" AS "Id0", f1."CreatedAt" AS "CreatedAt0", f1."CreatedBy" AS "CreatedBy0", f1."DeletedAt" AS "DeletedAt0", f1."DeletedBy" AS "DeletedBy0", f1."EquipmentAcvCCompartmentSeats", f1."EquipmentAcvYCompartmentSeats", f1."EquipmentAircraftType", f1."EquipmentDesignators", f1."EquipmentServiceType", f1."FlightType", f1."IsDeleted" AS "IsDeleted0", f1."RotationCode", f1."Routing", f1."SegmentAircraftOwner", f1."SegmentAirline", f1."SegmentArrivalDateTime", f1."SegmentBoardingPoint", f1."SegmentCabinCrew", f1."SegmentCockpitCrew", f1."SegmentDepartureDateTime", f1."SegmentDeplaningPoint", f1."SegmentFlightIdentifier", f1."SegmentFlightNumber", f1."UpdatedAt" AS "UpdatedAt0", f1."UpdatedBy" AS "UpdatedBy0"
          FROM "Flights" AS f
          INNER JOIN (
              SELECT f0."Id", f0."CreatedAt", f0."CreatedBy", f0."DeletedAt", f0."DeletedBy", f0."EquipmentAcvCCompartmentSeats", f0."EquipmentAcvYCompartmentSeats", f0."EquipmentAircraftType", f0."EquipmentDesignators", f0."EquipmentServiceType", f0."FlightType", f0."IsDeleted", f0."RotationCode", f0."Routing", f0."SegmentAircraftOwner", f0."SegmentAirline", f0."SegmentArrivalDateTime", f0."SegmentBoardingPoint", f0."SegmentCabinCrew", f0."SegmentCockpitCrew", f0."SegmentDepartureDateTime", f0."SegmentDeplaningPoint", f0."SegmentFlightIdentifier", f0."SegmentFlightNumber", f0."UpdatedAt", f0."UpdatedBy"
              FROM "FlightIntegrations" AS f0
              WHERE NOT (f0."IsDeleted")
          ) AS f1 ON f."FlightIntegrationId" = f1."Id"
          WHERE NOT (f."IsDeleted")
      ) AS s11 ON s10."Id" = s11."OriginDestinationId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s10."Id", s10."Id0", s10."Id1"


      SELECT s12."Id", s12."CreatedAt", s12."CreatedBy", s12."DeletedAt", s12."DeletedBy", s12."IncidencePercentage", s12."IsDeleted", s12."MasterContractId", s12."SeriesId", s12."TypeId", s12."UpdatedAt", s12."UpdatedBy", s12."ValidityFrom", s12."ValidityTo", s12."Value", s12."ValueUnitOfMeasureId", s12."Id0", s12."Category", s12."Name", s12."Symbol", s12."Id1", s12."Applicability", s12."Calculation", s12."CreatedAt0", s12."CreatedBy0", s12."DataType", s12."DefaultIncidencePercentage", s12."DefaultValueId", s12."DeletedAt0", s12."DeletedBy0", s12."Description", s12."IsDeleted0", s12."IsEditable", s12."Name0", s12."UnitOfMeasureId", s12."UpdatedAt0", s12."UpdatedBy0", s12."Id2", s12."CreatedAt1", s12."CreatedBy1", s12."DeletedAt1", s12."DeletedBy1", s12."Description0", s12."IsDeleted1", s12."ParameterTypeId", s12."UpdatedAt1", s12."UpdatedBy1", s12."Value0", s12."Id3", s12."Category0", s12."Name1", s12."Symbol0", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT p2."Id", p2."CreatedAt", p2."CreatedBy", p2."DeletedAt", p2."DeletedBy", p2."IncidencePercentage", p2."IsDeleted", p2."MasterContractId", p2."SeriesId", p2."TypeId", p2."UpdatedAt", p2."UpdatedBy", p2."ValidityFrom", p2."ValidityTo", p2."Value", p2."ValueUnitOfMeasureId", u."Id" AS "Id0", u."Category", u."Name", u."Symbol", p4."Id" AS "Id1", p4."Applicability", p4."Calculation", p4."CreatedAt" AS "CreatedAt0", p4."CreatedBy" AS "CreatedBy0", p4."DataType", p4."DefaultIncidencePercentage", p4."DefaultValueId", p4."DeletedAt" AS "DeletedAt0", p4."DeletedBy" AS "DeletedBy0", p4."Description", p4."IsDeleted" AS "IsDeleted0", p4."IsEditable", p4."Name" AS "Name0", p4."UnitOfMeasureId", p4."UpdatedAt" AS "UpdatedAt0", p4."UpdatedBy" AS "UpdatedBy0", p6."Id" AS "Id2", p6."CreatedAt" AS "CreatedAt1", p6."CreatedBy" AS "CreatedBy1", p6."DeletedAt" AS "DeletedAt1", p6."DeletedBy" AS "DeletedBy1", p6."Description" AS "Description0", p6."IsDeleted" AS "IsDeleted1", p6."ParameterTypeId", p6."UpdatedAt" AS "UpdatedAt1", p6."UpdatedBy" AS "UpdatedBy1", p6."Value" AS "Value0", u0."Id" AS "Id3", u0."Category" AS "Category0", u0."Name" AS "Name1", u0."Symbol" AS "Symbol0"
          FROM "Parameters" AS p2
          LEFT JOIN "UnitOfMeasures" AS u ON p2."ValueUnitOfMeasureId" = u."Id"
          INNER JOIN (
              SELECT p3."Id", p3."Applicability", p3."Calculation", p3."CreatedAt", p3."CreatedBy", p3."DataType", p3."DefaultIncidencePercentage", p3."DefaultValueId", p3."DeletedAt", p3."DeletedBy", p3."Description", p3."IsDeleted", p3."IsEditable", p3."Name", p3."UnitOfMeasureId", p3."UpdatedAt", p3."UpdatedBy"
              FROM "ParameterTypes" AS p3
              WHERE NOT (p3."IsDeleted")
          ) AS p4 ON p2."TypeId" = p4."Id"
          LEFT JOIN (
              SELECT p5."Id", p5."CreatedAt", p5."CreatedBy", p5."DeletedAt", p5."DeletedBy", p5."Description", p5."IsDeleted", p5."ParameterTypeId", p5."UpdatedAt", p5."UpdatedBy", p5."Value"
              FROM "ParameterTypeValues" AS p5
              WHERE NOT (p5."IsDeleted")
          ) AS p6 ON p4."DefaultValueId" = p6."Id"
          LEFT JOIN "UnitOfMeasures" AS u0 ON p4."UnitOfMeasureId" = u0."Id"
          WHERE NOT (p2."IsDeleted")
      ) AS s12 ON s9."Id" = s12."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s12."Id", s12."Id0", s12."Id1", s12."Id2", s12."Id3"

      SELECT p7."ParameterTypeId", p7."AircraftTypeId", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s12."Id", s12."Id0", s12."Id1", s12."Id2", s12."Id3"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT p2."Id", p2."SeriesId", u."Id" AS "Id0", p4."Id" AS "Id1", p6."Id" AS "Id2", u0."Id" AS "Id3"
          FROM "Parameters" AS p2
          LEFT JOIN "UnitOfMeasures" AS u ON p2."ValueUnitOfMeasureId" = u."Id"
          INNER JOIN (
              SELECT p3."Id", p3."DefaultValueId", p3."UnitOfMeasureId"
              FROM "ParameterTypes" AS p3
              WHERE NOT (p3."IsDeleted")
          ) AS p4 ON p2."TypeId" = p4."Id"
          LEFT JOIN (
              SELECT p5."Id"
              FROM "ParameterTypeValues" AS p5
              WHERE NOT (p5."IsDeleted")
          ) AS p6 ON p4."DefaultValueId" = p6."Id"
          LEFT JOIN "UnitOfMeasures" AS u0 ON p4."UnitOfMeasureId" = u0."Id"
          WHERE NOT (p2."IsDeleted")
      ) AS s12 ON s9."Id" = s12."SeriesId"
      INNER JOIN "ParameterTypeAircraftTypes" AS p7 ON s12."Id1" = p7."ParameterTypeId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s12."Id", s12."Id0", s12."Id1", s12."Id2", s12."Id3"


      SELECT p9."Id", p9."CreatedAt", p9."CreatedBy", p9."DeletedAt", p9."DeletedBy", p9."Description", p9."IsDeleted", p9."ParameterTypeId", p9."UpdatedAt", p9."UpdatedBy", p9."Value", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s12."Id", s12."Id0", s12."Id1", s12."Id2", s12."Id3"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT p2."Id", p2."SeriesId", u."Id" AS "Id0", p4."Id" AS "Id1", p6."Id" AS "Id2", u0."Id" AS "Id3"
          FROM "Parameters" AS p2
          LEFT JOIN "UnitOfMeasures" AS u ON p2."ValueUnitOfMeasureId" = u."Id"
          INNER JOIN (
              SELECT p3."Id", p3."DefaultValueId", p3."UnitOfMeasureId"
              FROM "ParameterTypes" AS p3
              WHERE NOT (p3."IsDeleted")
          ) AS p4 ON p2."TypeId" = p4."Id"
          LEFT JOIN (
              SELECT p5."Id"
              FROM "ParameterTypeValues" AS p5
              WHERE NOT (p5."IsDeleted")
          ) AS p6 ON p4."DefaultValueId" = p6."Id"
          LEFT JOIN "UnitOfMeasures" AS u0 ON p4."UnitOfMeasureId" = u0."Id"
          WHERE NOT (p2."IsDeleted")
      ) AS s12 ON s9."Id" = s12."SeriesId"
      INNER JOIN (
          SELECT p8."Id", p8."CreatedAt", p8."CreatedBy", p8."DeletedAt", p8."DeletedBy", p8."Description", p8."IsDeleted", p8."ParameterTypeId", p8."UpdatedAt", p8."UpdatedBy", p8."Value"
          FROM "ParameterTypeValues" AS p8
          WHERE NOT (p8."IsDeleted")
      ) AS p9 ON s12."Id1" = p9."ParameterTypeId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s12."Id", s12."Id0", s12."Id1", s12."Id2", s12."Id3"


      SELECT t0."Id", t0."AirportId", t0."Code", t0."CreatedAt", t0."CreatedBy", t0."CurrencyId", t0."DeletedAt", t0."DeletedBy", t0."Direction", t0."Fbc", t0."FlightDateFrom", t0."FlightDateTo", t0."Fp", t0."Included", t0."IsDeleted", t0."Name", t0."Nation", t0."Percent", t0."Ptc", t0."SaleDateFrom", t0."SeriesId", t0."StopOver", t0."TaxCarrier", t0."TaxPoint", t0."UpdatedAt", t0."UpdatedBy", t0."Value", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT t."Id", t."AirportId", t."Code", t."CreatedAt", t."CreatedBy", t."CurrencyId", t."DeletedAt", t."DeletedBy", t."Direction", t."Fbc", t."FlightDateFrom", t."FlightDateTo", t."Fp", t."Included", t."IsDeleted", t."Name", t."Nation", t."Percent", t."Ptc", t."SaleDateFrom", t."SeriesId", t."StopOver", t."TaxCarrier", t."TaxPoint", t."UpdatedAt", t."UpdatedBy", t."Value"
          FROM "Taxes" AS t
          WHERE NOT (t."IsDeleted")
      ) AS t0 ON s9."Id" = t0."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"


      SELECT s13."Id", s13."Allowance", s13."Commission", s13."CreatedAt", s13."CreatedBy", s13."CurrencyId", s13."DeletedAt", s13."DeletedBy", s13."IsDeleted", s13."MasterContractId", s13."Price", s13."SeriesId", s13."TypeId", s13."UpdatedAt", s13."UpdatedBy", s13."ValidityFrom", s13."ValidityTo", s13."Id0", s13."AtpcoSubCode", s13."CommercialName", s13."CreatedAt0", s13."CreatedBy0", s13."DeletedAt0", s13."DeletedBy0", s13."DescriptionOne", s13."DescriptionTwo", s13."IataCode", s13."IsDeleted0", s13."ReasonForIssuanceCodeId", s13."UpdatedAt0", s13."UpdatedBy0", s13."Id1", s13."Code", s13."CreatedAt1", s13."CreatedBy1", s13."DeletedAt1", s13."DeletedBy1", s13."Description", s13."IsDeleted1", s13."UpdatedAt1", s13."UpdatedBy1", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT s4."Id", s4."Allowance", s4."Commission", s4."CreatedAt", s4."CreatedBy", s4."CurrencyId", s4."DeletedAt", s4."DeletedBy", s4."IsDeleted", s4."MasterContractId", s4."Price", s4."SeriesId", s4."TypeId", s4."UpdatedAt", s4."UpdatedBy", s4."ValidityFrom", s4."ValidityTo", s6."Id" AS "Id0", s6."AtpcoSubCode", s6."CommercialName", s6."CreatedAt" AS "CreatedAt0", s6."CreatedBy" AS "CreatedBy0", s6."DeletedAt" AS "DeletedAt0", s6."DeletedBy" AS "DeletedBy0", s6."DescriptionOne", s6."DescriptionTwo", s6."IataCode", s6."IsDeleted" AS "IsDeleted0", s6."ReasonForIssuanceCodeId", s6."UpdatedAt" AS "UpdatedAt0", s6."UpdatedBy" AS "UpdatedBy0", r0."Id" AS "Id1", r0."Code", r0."CreatedAt" AS "CreatedAt1", r0."CreatedBy" AS "CreatedBy1", r0."DeletedAt" AS "DeletedAt1", r0."DeletedBy" AS "DeletedBy1", r0."Description", r0."IsDeleted" AS "IsDeleted1", r0."UpdatedAt" AS "UpdatedAt1", r0."UpdatedBy" AS "UpdatedBy1"
          FROM "SpecialServices" AS s4
          INNER JOIN (
              SELECT s5."Id", s5."AtpcoSubCode", s5."CommercialName", s5."CreatedAt", s5."CreatedBy", s5."DeletedAt", s5."DeletedBy", s5."DescriptionOne", s5."DescriptionTwo", s5."IataCode", s5."IsDeleted", s5."ReasonForIssuanceCodeId", s5."UpdatedAt", s5."UpdatedBy"
              FROM "SpecialTypes" AS s5
              WHERE NOT (s5."IsDeleted")
          ) AS s6 ON s4."TypeId" = s6."Id"
          INNER JOIN (
              SELECT r."Id", r."Code", r."CreatedAt", r."CreatedBy", r."DeletedAt", r."DeletedBy", r."Description", r."IsDeleted", r."UpdatedAt", r."UpdatedBy"
              FROM "ReasonForIssuanceCodes" AS r
              WHERE NOT (r."IsDeleted")
          ) AS r0 ON s6."ReasonForIssuanceCodeId" = r0."Id"
          WHERE NOT (s4."IsDeleted")
      ) AS s13 ON s9."Id" = s13."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s13."Id", s13."Id0", s13."Id1"


      SELECT s7."SpecialServiceId", s7."AircraftTypeId", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s13."Id", s13."Id0", s13."Id1"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT s4."Id", s4."SeriesId", s6."Id" AS "Id0", r0."Id" AS "Id1"
          FROM "SpecialServices" AS s4
          INNER JOIN (
              SELECT s5."Id", s5."ReasonForIssuanceCodeId"
              FROM "SpecialTypes" AS s5
              WHERE NOT (s5."IsDeleted")
          ) AS s6 ON s4."TypeId" = s6."Id"
          INNER JOIN (
              SELECT r."Id"
              FROM "ReasonForIssuanceCodes" AS r
              WHERE NOT (r."IsDeleted")
          ) AS r0 ON s6."ReasonForIssuanceCodeId" = r0."Id"
          WHERE NOT (s4."IsDeleted")
      ) AS s13 ON s9."Id" = s13."SeriesId"
      INNER JOIN "SpecialServiceAircraftTypes" AS s7 ON s13."Id" = s7."SpecialServiceId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id", s13."Id", s13."Id0", s13."Id1"


      SELECT s14."Id", s14."CreatedAt", s14."CreatedBy", s14."DeletedAt", s14."DeletedBy", s14."IncentiveCommission", s14."IncentiveCommissionUnitOfMeasureId", s14."IsDeleted", s14."MasterContractId", s14."Name", s14."PenaltyCommission", s14."PenaltyCommissionUnitOfMeasureId", s14."Target", s14."TargetUnitOfMeasureId", s14."Type", s14."UpdatedAt", s14."UpdatedBy", s14."ValidityFrom", s14."ValidityTo", s14."Id0", s14."Category", s14."Name0", s14."Symbol", s14."Id1", s14."Category0", s14."Name1", s14."Symbol0", s14."Id2", s14."Category1", s14."Name2", s14."Symbol1", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT m3."Id", m3."CreatedAt", m3."CreatedBy", m3."DeletedAt", m3."DeletedBy", m3."IncentiveCommission", m3."IncentiveCommissionUnitOfMeasureId", m3."IsDeleted", m3."MasterContractId", m3."Name", m3."PenaltyCommission", m3."PenaltyCommissionUnitOfMeasureId", m3."Target", m3."TargetUnitOfMeasureId", m3."Type", m3."UpdatedAt", m3."UpdatedBy", m3."ValidityFrom", m3."ValidityTo", u1."Id" AS "Id0", u1."Category", u1."Name" AS "Name0", u1."Symbol", u2."Id" AS "Id1", u2."Category" AS "Category0", u2."Name" AS "Name1", u2."Symbol" AS "Symbol0", u3."Id" AS "Id2", u3."Category" AS "Category1", u3."Name" AS "Name2", u3."Symbol" AS "Symbol1", m1."SeriesId"
          FROM "MaterializationSeries" AS m1
          INNER JOIN (
              SELECT m2."Id", m2."CreatedAt", m2."CreatedBy", m2."DeletedAt", m2."DeletedBy", m2."IncentiveCommission", m2."IncentiveCommissionUnitOfMeasureId", m2."IsDeleted", m2."MasterContractId", m2."Name", m2."PenaltyCommission", m2."PenaltyCommissionUnitOfMeasureId", m2."Target", m2."TargetUnitOfMeasureId", m2."Type", m2."UpdatedAt", m2."UpdatedBy", m2."ValidityFrom", m2."ValidityTo"
              FROM "Materializations" AS m2
              WHERE NOT (m2."IsDeleted")
          ) AS m3 ON m1."MaterializationId" = m3."Id"
          INNER JOIN "UnitOfMeasures" AS u1 ON m3."TargetUnitOfMeasureId" = u1."Id"
          INNER JOIN "UnitOfMeasures" AS u2 ON m3."PenaltyCommissionUnitOfMeasureId" = u2."Id"
          INNER JOIN "UnitOfMeasures" AS u3 ON m3."IncentiveCommissionUnitOfMeasureId" = u3."Id"
      ) AS s14 ON s9."Id" = s14."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"


      SELECT s15."Id", s15."CreatedAt", s15."CreatedBy", s15."DeletedAt", s15."DeletedBy", s15."EconomyCommission", s15."EconomyCommissionUnitOfMeasureId", s15."IsDeleted", s15."MasterContractId", s15."Name", s15."Notes", s15."PremiumCommission", s15."PremiumCommissionUnitOfMeasureId", s15."Target", s15."TargetType", s15."TargetUnitOfMeasureId", s15."UpdatedAt", s15."UpdatedBy", s15."ValidityFrom", s15."ValidityTo", s15."Id0", s15."Category", s15."Name0", s15."Symbol", s15."Id1", s15."Category0", s15."Name1", s15."Symbol0", s15."Id2", s15."Category1", s15."Name2", s15."Symbol1", s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"
      FROM (
          SELECT p."Id", m0."Id" AS "Id0", c0."Id" AS "Id1", c2."Id" AS "Id2", c4."Id" AS "Id3", s0."Id" AS "Id4", p1."Id" AS "Id5", c6."Id" AS "Id6", c8."Id" AS "Id7", a0."Id" AS "Id8", a2."Id" AS "Id9", s2."Id" AS "Id10", c10."Id" AS "Id11"
          FROM "Proposals" AS p
          INNER JOIN (
              SELECT m."Id", m."BrokerId", m."ContractTypeId", m."CustomerId", m."PrintModelId", m."SeasonId", m."SupplierId"
              FROM "MasterContracts" AS m
              WHERE NOT (m."IsDeleted")
          ) AS m0 ON p."MasterContractId" = m0."Id"
          INNER JOIN (
              SELECT c."Id"
              FROM "ContractTypes" AS c
              WHERE NOT (c."IsDeleted")
          ) AS c0 ON m0."ContractTypeId" = c0."Id"
          INNER JOIN (
              SELECT c1."Id"
              FROM "Companies" AS c1
              WHERE NOT (c1."IsDeleted")
          ) AS c2 ON m0."SupplierId" = c2."Id"
          INNER JOIN (
              SELECT c3."Id"
              FROM "Companies" AS c3
              WHERE NOT (c3."IsDeleted")
          ) AS c4 ON m0."BrokerId" = c4."Id"
          INNER JOIN (
              SELECT s."Id"
              FROM "Seasons" AS s
              WHERE NOT (s."IsDeleted")
          ) AS s0 ON m0."SeasonId" = s0."Id"
          INNER JOIN (
              SELECT p0."Id"
              FROM "PrintModels" AS p0
              WHERE NOT (p0."IsDeleted")
          ) AS p1 ON m0."PrintModelId" = p1."Id"
          INNER JOIN (
              SELECT c5."Id"
              FROM "Companies" AS c5
              WHERE NOT (c5."IsDeleted")
          ) AS c6 ON m0."CustomerId" = c6."Id"
          INNER JOIN (
              SELECT c7."Id"
              FROM "Companies" AS c7
              WHERE NOT (c7."IsDeleted")
          ) AS c8 ON p."CustomerId" = c8."Id"
          INNER JOIN (
              SELECT a."Id"
              FROM "Airports" AS a
              WHERE NOT (a."IsDeleted")
          ) AS a0 ON p."OdFromId" = a0."Id"
          INNER JOIN (
              SELECT a1."Id"
              FROM "Airports" AS a1
              WHERE NOT (a1."IsDeleted")
          ) AS a2 ON p."OdToId" = a2."Id"
          INNER JOIN (
              SELECT s1."Id"
              FROM "Seasons" AS s1
              WHERE NOT (s1."IsDeleted")
          ) AS s2 ON p."SeasonId" = s2."Id"
          LEFT JOIN (
              SELECT c9."Id"
              FROM "ContractTypes" AS c9
              WHERE NOT (c9."IsDeleted")
          ) AS c10 ON p."ContractTypeId" = c10."Id"
          WHERE NOT (p."IsDeleted") AND p."Id" = @__id_0
          LIMIT 1
      ) AS s8
      INNER JOIN (
          SELECT s3."Id", s3."ProposalId"
          FROM "Series" AS s3
          WHERE NOT (s3."IsDeleted")
      ) AS s9 ON s8."Id" = s9."ProposalId"
      INNER JOIN (
          SELECT i1."Id", i1."CreatedAt", i1."CreatedBy", i1."DeletedAt", i1."DeletedBy", i1."EconomyCommission", i1."EconomyCommissionUnitOfMeasureId", i1."IsDeleted", i1."MasterContractId", i1."Name", i1."Notes", i1."PremiumCommission", i1."PremiumCommissionUnitOfMeasureId", i1."Target", i1."TargetType", i1."TargetUnitOfMeasureId", i1."UpdatedAt", i1."UpdatedBy", i1."ValidityFrom", i1."ValidityTo", u4."Id" AS "Id0", u4."Category", u4."Name" AS "Name0", u4."Symbol", u5."Id" AS "Id1", u5."Category" AS "Category0", u5."Name" AS "Name1", u5."Symbol" AS "Symbol0", u6."Id" AS "Id2", u6."Category" AS "Category1", u6."Name" AS "Name2", u6."Symbol" AS "Symbol1", i."SeriesId"
          FROM "IncentiveSeries" AS i
          INNER JOIN (
              SELECT i0."Id", i0."CreatedAt", i0."CreatedBy", i0."DeletedAt", i0."DeletedBy", i0."EconomyCommission", i0."EconomyCommissionUnitOfMeasureId", i0."IsDeleted", i0."MasterContractId", i0."Name", i0."Notes", i0."PremiumCommission", i0."PremiumCommissionUnitOfMeasureId", i0."Target", i0."TargetType", i0."TargetUnitOfMeasureId", i0."UpdatedAt", i0."UpdatedBy", i0."ValidityFrom", i0."ValidityTo"
              FROM "Incentives" AS i0
              WHERE NOT (i0."IsDeleted")
          ) AS i1 ON i."IncentiveId" = i1."Id"
          INNER JOIN "UnitOfMeasures" AS u4 ON i1."TargetUnitOfMeasureId" = u4."Id"
          INNER JOIN "UnitOfMeasures" AS u5 ON i1."PremiumCommissionUnitOfMeasureId" = u5."Id"
          INNER JOIN "UnitOfMeasures" AS u6 ON i1."EconomyCommissionUnitOfMeasureId" = u6."Id"
      ) AS s15 ON s9."Id" = s15."SeriesId"
      ORDER BY s8."Id", s8."Id0", s8."Id1", s8."Id2", s8."Id3", s8."Id4", s8."Id5", s8."Id6", s8."Id7", s8."Id8", s8."Id9", s8."Id10", s8."Id11", s9."Id"

info: Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker[103]
      Executed action method neos_be.Controllers.ProposalsController.Get (neos_be), returned result Microsoft.AspNetCore.Mvc.OkObjectResult in 1061.0461ms.
info: Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor[1]
      Executing OkObjectResult, writing value of type 'neos_be.Common.Models.DTOs.Proposal'.
info: Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker[105]
      Executed action neos_be.Controllers.ProposalsController.Get (neos_be) in 1296.76ms
info: Microsoft.AspNetCore.Routing.EndpointMiddleware[1]
      Executed endpoint 'neos_be.Controllers.ProposalsController.Get (neos_be)'
info: Microsoft.AspNetCore.HttpLogging.HttpLoggingMiddleware[2]
      Response:
      StatusCode: 200
      Content-Type: application/json; charset=utf-8
      Date: Fri, 25 Jul 2025 07:15:31 GMT
      Server: Kestrel
      Transfer-Encoding: chunked
      api-supported-versions: [Redacted]
info: Microsoft.AspNetCore.Hosting.Diagnostics[2]
      Request finished HTTP/1.1 GET http://localhost:5241/api/v1/proposals/1 - 200 - application/json;+charset=utf-8 1501.3148ms