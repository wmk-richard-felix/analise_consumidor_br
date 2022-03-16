IMPORT CDM;

EXPORT modAssunto := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('assunto');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;