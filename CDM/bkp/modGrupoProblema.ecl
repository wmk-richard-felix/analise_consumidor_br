IMPORT CDM;

EXPORT modGrupoProblema := MODULE

    EXPORT lLayout := RECORD
        UNSIGNED id;
        UNSIGNED descricao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('grupo_problema');

    EXPORT dData := DATASET(sFile, lLayout, THOR);

END;