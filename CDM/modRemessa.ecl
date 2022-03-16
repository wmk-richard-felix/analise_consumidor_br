IMPORT CDM;

EXPORT modRemessa := MODULE

    EXPORT lLayout := RECORD
        STRING id_remessa;
        UNSIGNED data_remessa;
        STRING fonte;
        STRING arquivo_logico;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('remessa');
    EXPORT dData := DATASET(sSFFilename, lLayout, THOR);

END;