IMPORT CDM;

EXPORT modAvaliacao := MODULE

    EXPORT lLayout := RECORD
        STRING cont_remessa;
        UNSIGNED data_remessa;
        UNSIGNED id_unico;
        UNSIGNED nota;
        STRING status_avaliacao;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('avaliacao_final');

    EXPORT dData := DATASET(sSFFilename, lLayout, THOR);

END;