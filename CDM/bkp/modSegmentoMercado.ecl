IMPORT CDM;

EXPORT modSegmentoMercado := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('segmento_de_mercado');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;