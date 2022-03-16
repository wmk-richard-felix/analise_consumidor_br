IMPORT CDM, ETL, STD, Visualizer;

dEmpresas := CDM.modEmpresa.dData;
dReclamacoes := CDM.modReclamacao.dData;

lJoin := RECORD
  UNICODE nome_fantasia;
  UNSIGNED ano_abertura;
END;

dReclamacaoEmpresa := JOIN(dEmpresas, dReclamacoes, LEFT.id_unico = RIGHT.id_unico, TRANSFORM(lJoin,
    SELF.ano_abertura := STD.Date.Year(RIGHT.data_finalizacao);
    SELF.nome_fantasia := (UNICODE)  ETL.modFunctions.fRemoveEspeciais(LEFT.nome_fantasia);
    SELF := LEFT;
));

dTablePerYear := SORT(SORT(
      TABLE(
        dReclamacaoEmpresa, {ano_abertura, nome_fantasia, quantidade := COUNT(GROUP)}, ano_abertura, nome_fantasia
), -quantidade), -quantidade);

d2019 := TABLE(CHOOSEN(dTablePerYear(ano_abertura = 2019),5), {nome_fantasia, quantidade});
d2020 := TABLE(CHOOSEN(dTablePerYear(ano_abertura = 2020),5), {nome_fantasia, quantidade});
d2021 := TABLE(CHOOSEN(dTablePerYear(ano_abertura = 2021),5), {nome_fantasia, quantidade});

OUTPUT(SORT(d2019, quantidade), NAMED('Empresas_2019'));
viz2019 := Visualizer.MultiD.Bar('column',, 'Empresas_2019');

OUTPUT(SORT(d2020, quantidade), NAMED('Empresas_2020'));
viz2020 := Visualizer.MultiD.Bar('column',, 'Empresas_2020');

OUTPUT(SORT(d2021, quantidade), NAMED('Empresas_2021'));
viz2021 := Visualizer.MultiD.Bar('column',, 'Empresas_2021');