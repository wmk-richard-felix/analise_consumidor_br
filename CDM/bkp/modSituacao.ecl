IMPORT CDM;

EXPORT modSituacao := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('situacao');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;