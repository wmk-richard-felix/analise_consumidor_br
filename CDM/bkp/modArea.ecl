IMPORT CDM;

EXPORT modArea := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('area');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;