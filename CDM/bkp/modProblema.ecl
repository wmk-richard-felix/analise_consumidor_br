IMPORT CDM;

EXPORT modProblema := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('problema');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;