select *
from CfgParametri;

SELECT *
FROM CfgParametri
WHERE Parametro IN (
                    'EasyBoxSkipSSL',
                    'EasyBoxUrl',
                    'EasyBoxCodiceAgenzia',
                    'EasyBoxMasterAccount',
                    'EasyBoxAmbito',
                    'EasyBoxPassword',
                    'EasyBoxEnvironmentCode',
                    'EasyBoxDivisaPagamento',
                    'EasyBoxTipologiaConto',
                    'EasyBoxTipologiaContoNR',
                    'EasyBoxFiliale',
                    'EasyBoxOrarioCutOff'
    );


SELECT *
FROM CfgParametri
WHERE Parametro like '%EasyBox%'