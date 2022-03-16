IMPORT CDM;

EXPORT modGestor := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('gestor');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;