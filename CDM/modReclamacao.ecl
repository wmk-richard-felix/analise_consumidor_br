IMPORT CDM;

EXPORT modReclamacao := MODULE

    EXPORT lLayout := RECORD
        STRING cont_remessa;
        UNSIGNED data_remessa;
        UNSIGNED id_unico;
        STRING gestor;
        STRING canal_de_origem;
        STRING regiao;
        STRING uf;
        STRING cidade;
        STRING sexo;
        STRING faixa_etaria;
        STRING assunto;
        STRING grupo_problema;
        STRING problema;
        STRING como_comprou_contratou;
        STRING procurou_empresa;
        UTF8 situacao;
        UNSIGNED ano_abertura;
        UNSIGNED mes_abertura;
        UNSIGNED data_abertura;
        UNSIGNED hora_abertura;
        UNSIGNED data_resposta;
        UNSIGNED hora_resposta;
        UNSIGNED data_analise;
        UNSIGNED hora_analise;
        UNSIGNED data_recusa;
        UNSIGNED hora_recusa;
        UNSIGNED data_finalizacao;
        UNSIGNED hora_finalizacao;
        UNSIGNED prazo_resposta;
        STRING tempo_de_resposta;
    END;

    EXPORT sSFFilename := CDM.modFunctions.fGetSFFilename('reclamacao');

    EXPORT dData := DATASET(sSFFilename, lLayout, THOR);

END;