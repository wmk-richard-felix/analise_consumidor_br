IMPORT CDM, ETL, STD;

EXPORT modFunctions := MODULE
  EXPORT macCallETL(sIdRemessa, sInput, lEspRawInput) := FUNCTIONMACRO
    IMPORT ETL;

    dRawInput := DATASET(sInput, lEspRawInput, CSV(HEADING(SINGLE), SEPARATOR(';')));

    dPreInput := PROJECT(dRawInput, TRANSFORM(ETL.modLayouts.lRawInput,
        SELF := LEFT;
    ));

    dInput := PROJECT(dRawInput, TRANSFORM(ETL.modLayouts.lInput,
        SELF.cont_remessa := INTFORMAT(COUNTER, 7, 1);
        SELF.data_remessa := STD.Date.Today();
        SELF.id_unico := (UNSIGNED) (sIdRemessa + SELF.cont_remessa);
        SELF := LEFT;
    ));

    RETURN ETL.modFunctions.macPopulaTabelas(dInput, (STRING) STD.Date.Today(), sInput, sIdRemessa);

  ENDMACRO;

  EXPORT fStringToDate(STRING sDate) := FUNCTION
    sOut := IF(
      STD.Str.Contains(sDate, '-', TRUE), 
      sDate[1..4] + sDate[6..7] + sDate[9..10],
      sDate[7..10] + sDate[4..5] + sDate[1..2]
    );
    RETURN (UNSIGNED8) sOut;
  END;

  EXPORT fRemoveEspeciais(STRING sIn01) := FUNCTION

    sOut1 := STD.Str.FindReplace(sIn01, 'ç', 'c');
    sOut2 := STD.Str.FindReplace(sOut1, 'á', 'a');
    sOut3 := STD.Str.FindReplace(sOut2, 'ã', 'a');
    sOut4 := STD.Str.FindReplace(sOut3, 'ó', 'o');
    sOut5 := STD.Str.FindReplace(sOut4, 'é', 'e');
    sOut6 := STD.Str.FindReplace(sOut5, 'í', 'i');
    sOut7 := STD.Str.FindReplace(sOut6, 'õ', 'o');
    sOut8 := STD.Str.FindReplace(sOut7, 'â', 'a');
    sOut9 := STD.Str.FindReplace(sOut8, 'Ã³', 'o');
    sOut10 := STD.Str.FindReplace(sOut9, 'Ã©', 'e');
    sOut11 := STD.Str.FindReplace(sOut10, 'Ã¡', 'a');
    sOut12 := STD.Str.FindReplace(sOut11, 'Ã§', 'c');
    sOut13 := STD.Str.FindReplace(sOut12, 'Ã£', 'a');
    sOut14 := STD.Str.FindReplace(sOut13, 'Ã', 'O');
    sOut15 := STD.Str.FindReplace(sOut14, 'Ãµ', 'o');
    sOut16 := STD.Str.FindReplace(sOut15, 'Ãª', 'e');
    sOut17 := STD.Str.FindReplace(sOut16, 'Ó', 'O');
    sOut18 := STD.Str.FindReplace(sOut17, 'ú', 'u');
    sOut19 := STD.Str.FindReplace(sOut18, 'Ãº', 'u');
    sOut20 := STD.Str.FindReplace(sOut19, 'Ã´', 'o');
    sOut21 := STD.Str.FindReplace(sOut20, 'Ãµ', 'o');
    sOut22 := STD.Str.FindReplace(sOut21, 'ú', 'u');
    sOut23 := STD.Str.FindReplace(sOut22, 'ô', 'o');
    sOut24 := STD.Str.FindReplace(sOut23, 'Ã´', 'o');
    sOut25 := STD.Str.FindReplace(sOut24, 'Ã©', 'e');
    sOut26 := STD.Str.FindReplace(sOut25, 'Ãº', 'u');
    
    sOut99 := STD.Str.FindReplace(sOut26, 'Ã', 'i');
    

    RETURN sOut99;

  END;

  EXPORT macPopulaTabelas(dInput, sDataRemessa, sArqLogico, sRemessa) := FUNCTIONMACRO 

    dReclamacao := PROJECT(dInput, TRANSFORM(CDM.modReclamacao.lLayout,
        SELF.data_abertura      := ETL.modFunctions.fStringToDate(LEFT.data_abertura);
        SELF.hora_abertura      := (UNSIGNED) STD.Str.FindReplace(LEFT.hora_abertura, ':', '');
        SELF.data_resposta      := ETL.modFunctions.fStringToDate(LEFT.data_resposta);
        SELF.hora_resposta      := (UNSIGNED) STD.Str.FindReplace(LEFT.hora_resposta, ':', '');
        SELF.data_analise       := ETL.modFunctions.fStringToDate(LEFT.data_analise);
        SELF.hora_analise       := (UNSIGNED) STD.Str.FindReplace(LEFT.hora_analise, ':', '');
        SELF.data_recusa        := ETL.modFunctions.fStringToDate(LEFT.data_recusa);
        SELF.hora_recusa        := (UNSIGNED) STD.Str.FindReplace(LEFT.hora_recusa, ':', '');
        SELF.data_finalizacao   := ETL.modFunctions.fStringToDate(LEFT.data_finalizacao);
        SELF.hora_finalizacao   := (UNSIGNED) STD.Str.FindReplace(LEFT.hora_finalizacao, ':', '');
        SELF.prazo_resposta     := ETL.modFunctions.fStringToDate(LEFT.prazo_resposta);
        SELF.ano_abertura       := (UNSIGNED) LEFT.ano_abertura;
        SELF.mes_abertura       := (UNSIGNED) LEFT.mes_abertura;
        
        SELF.gestor             := ETL.modFunctions.fRemoveEspeciais(LEFT.gestor);
        SELF.canal_de_origem    := ETL.modFunctions.fRemoveEspeciais(LEFT.canal_de_origem);
        SELF.cidade             := ETL.modFunctions.fRemoveEspeciais(LEFT.cidade);
        SELF.assunto            := ETL.modFunctions.fRemoveEspeciais(LEFT.assunto);
        SELF.grupo_problema     := ETL.modFunctions.fRemoveEspeciais(LEFT.grupo_problema);
        SELF.problema           := ETL.modFunctions.fRemoveEspeciais(LEFT.problema);
        SELF.situacao           := ETL.modFunctions.fRemoveEspeciais(LEFT.situacao);
        SELF.como_comprou_contratou := ETL.modFunctions.fRemoveEspeciais(LEFT.como_comprou_contratou);
        SELF := LEFT;
    ));

    dEmpresa := PROJECT(dInput, TRANSFORM(CDM.modEmpresa.lLayout,
        SELF := LEFT;
    ));

    dAvaliacaoFinal := PROJECT(dInput, TRANSFORM(CDM.modAvaliacao.lLayout,
        SELF.nota := (UNSIGNED) LEFT.nota_do_consumidor;
        SELF.status_avaliacao := LEFT.avaliacao_reclamacao;
        SELF := LEFT;
    ));

    dRemessa := DATASET([
        {
          sRemessa,
          sDataRemessa,
          'Consumidor.gov',
          sArqLogico
    }], CDM.modRemessa.lLayout);

    sAvaliacaoLF := CDM.modAvaliacao.sSFFilename + '_' + sRemessa;
    sEmpresaLF := CDM.modEmpresa.sSFFilename + '_' + sRemessa;
    sReclamacaoLF := CDM.modReclamacao.sSFFilename + '_' + sRemessa;
    sRemessaLF := CDM.modRemessa.sSFFilename + '_' + sRemessa;

    aReclamacao := SEQUENTIAL(
      OUTPUT(dReclamacao,, sReclamacaoLF, THOR, OVERWRITE);
      STD.File.CreateSuperFile(CDM.modReclamacao.sSFFilename, allowExist := TRUE);
      STD.File.StartSuperFileTransaction();
      STD.File.AddSuperFile(CDM.modReclamacao.sSFFilename, sReclamacaoLF),
      STD.File.FinishSuperFileTransaction();
    );

    aEmpresa := SEQUENTIAL(
      OUTPUT(dEmpresa,, sEmpresaLF, THOR, OVERWRITE);
      STD.File.CreateSuperFile(CDM.modEmpresa.sSFFilename, allowExist := TRUE);
      STD.File.StartSuperFileTransaction();
      STD.File.AddSuperFile(CDM.modEmpresa.sSFFilename, sEmpresaLF),
      STD.File.FinishSuperFileTransaction();
    );

    aAvaliacao := SEQUENTIAL(
      OUTPUT(dAvaliacaoFinal,, sAvaliacaoLF, THOR, OVERWRITE);
      STD.File.CreateSuperFile(CDM.modAvaliacao.sSFFilename, allowExist := TRUE);
      STD.File.StartSuperFileTransaction();
      STD.File.AddSuperFile(CDM.modAvaliacao.sSFFilename, sAvaliacaoLF),
      STD.File.FinishSuperFileTransaction();
    );

    aRemessa := SEQUENTIAL(
      OUTPUT(dRemessa,, sRemessaLF, THOR, OVERWRITE);
      STD.File.CreateSuperFile(CDM.modRemessa.sSFFilename, allowExist := TRUE);
      STD.File.StartSuperFileTransaction();
      STD.File.AddSuperFile(CDM.modRemessa.sSFFilename, sRemessaLF),
      STD.File.FinishSuperFileTransaction();
    );

    RETURN SEQUENTIAL(
      aReclamacao;
      aEmpresa;
      aAvaliacao;
      aRemessa;
    );

  ENDMACRO;

END;