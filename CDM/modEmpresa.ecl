IMPORT CDM;

EXPORT modEmpresa := MODULE

    EXPORT lLayout := RECORD
        STRING cont_remessa;
        UNSIGNED data_remessa;
        UNSIGNED id_unico;
        STRING nome_fantasia;
        STRING segmento_de_mercado;
        STRING area;
    END;
    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('empresa');
    EXPORT dData := DATASET(sSFFilename, lLayout, THOR);

END;

