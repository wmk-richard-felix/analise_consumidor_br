IMPORT CDM;

EXPORT modCanalOrigem := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('canal_de_origem');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;