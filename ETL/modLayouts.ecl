EXPORT modLayouts := MODULE

  EXPORT lRawInput := RECORD
    STRING gestor := '';
    STRING canal_de_origem := '';
    STRING regiao := '';
    STRING uf := '';
    STRING cidade := '';
    STRING sexo := '';
    STRING faixa_etaria := '';
    STRING ano_abertura := '';
    STRING mes_abertura := '';
    STRING data_abertura := '';
    STRING hora_abertura := '';
    STRING data_resposta := '';
    STRING hora_resposta := '';
    STRING data_analise := '';
    STRING hora_analise := '';
    STRING data_recusa := '';
    STRING hora_recusa := '';
    STRING data_finalizacao := '';
    STRING hora_finalizacao := '';
    STRING prazo_resposta := '';
    STRING prazo_analise_gestor := '';
    STRING tempo_de_resposta := '';
    STRING nome_fantasia := '';
    STRING segmento_de_mercado := '';
    STRING area := '';
    STRING assunto := '';
    STRING grupo_problema := '';
    STRING problema := '';
    STRING como_comprou_contratou := '';
    STRING procurou_empresa := '';
    STRING respondida := '';
    STRING situacao := '';
    STRING avaliacao_reclamacao := '';
    STRING nota_do_consumidor := '';
    STRING analise_da_recusa := '';
    STRING edicao_de_conteudo := '';
    STRING interacao_do_gestor := '';
    STRING total := '';
  END;


  EXPORT lRaw2019 := RECORD
    STRING regiao;
    STRING uf;
    STRING cidade;
    STRING sexo;
    STRING faixa_etaria;
    STRING data_finalizacao;
    STRING tempo_resposta;
    STRING nome_fantasia;
    STRING segmento_de_mercado;
    STRING area;
    STRING assunto;
    STRING grupo_problema;
    STRING problema;
    STRING como_comprou;
    STRING contratou;
    STRING procurou_empresa;
    STRING respondida;
    STRING situacao;
    STRING avaliacao_reclamacao;
    STRING nota_do_consumidor;
    STRING total;
  END;

  EXPORT lRaw2020 := RECORD
    STRING gestor;
    STRING canal_de_origem;
    STRING regiao;
    STRING uf;
    STRING cidade;
    STRING sexo;
    STRING faixa_etaria;
    STRING ano_abertura;
    STRING mes_abertura;
    STRING data_abertura;
    STRING data_resposta;
    STRING data_analise;
    STRING data_recusa;
    STRING data_finalizacao;
    STRING prazo_resposta;
    STRING prazo_analise_gestor;
    STRING tempo_resposta;
    STRING nome_fantasia;
    STRING area;
    STRING assunto;
    STRING grupo_problema;
    STRING problema;
    STRING como_comprou_contratou;
    STRING procurou_empresa;
    STRING respondida;
    STRING situacao;
    STRING avaliacao_reclamacao;
    STRING nota_do_consumidor;
    STRING analise_da_recusa;
  END;

  EXPORT lRaw2021 := RECORD
    STRING gestor;
    STRING canal_de_origem;
    STRING regiao;
    STRING uf;
    STRING cidade;
    STRING sexo;
    STRING faixa_etaria;
    STRING ano_abertura;
    STRING mes_abertura;
    STRING data_abertura;
    STRING data_resposta;
    STRING data_analise;
    STRING data_recusa;
    STRING data_finalizacao;
    STRING prazo_resposta;
    STRING prazo_analise_gestor;
    STRING tempo_resposta;
    STRING nome_fantasia;
    STRING segmento_de_mercado;
    STRING area;
    STRING assunto;
    STRING grupo_problema;
    STRING problema;
    STRING como_comprou_contratou;
    STRING procurou_empresa;
    STRING respondida;
    STRING situacao;
    STRING avaliacao_reclamacao;
    STRING nota_do_consumidor;
    STRING analise_da_recusa;
  END;

  
  EXPORT lRaw2021_ge := RECORD
    STRING gestor;
    STRING canal_de_origem;
    STRING regiao;
    STRING uf;
    STRING cidade;
    STRING sexo;
    STRING faixa_etaria;
    STRING ano_abertura;
    STRING mes_abertura;
    STRING data_abertura;
    STRING data_resposta;
    STRING data_analise;
    STRING data_recusa;
    STRING data_finalizacao;
    STRING prazo_resposta;
    STRING prazo_analise_gestor;
    STRING tempo_resposta;
    STRING grupo_economico;
    STRING nome_fantasia;
    STRING segmento_de_mercado;
    STRING area;
    STRING assunto;
    STRING grupo_problema;
    STRING problema;
    STRING como_comprou_contratou;
    STRING procurou_empresa;
    STRING respondida;
    STRING situacao;
    STRING avaliacao_reclamacao;
    STRING nota_do_consumidor;
    STRING analise_da_recusa;
  END;

  EXPORT lInput := RECORD
    STRING cont_remessa;
    UNSIGNED data_remessa;
    UNSIGNED id_unico;
    lRawInput;
  END;



END;