IMPORT CDM, ETL, std;

// dInput := DATASET('~data::input::basecompleta2020-11', ETL.modLayouts.lRaw2020, CSV(HEADING(SINGLE), SEPARATOR(';')));
dInput := CDM.modReclamacao.dData(STD.Date.Year(data_finalizacao) = 2020);
// ETL.CreateUniques.macCreateUnique('gestor');
// ETL.CreateUniques.macCreateUnique('canal_de_origem');
// ETL.CreateUniques.macCreateUnique('segmento_de_mercado');
// ETL.CreateUniques.macCreateUnique('area');
ETL.CreateUniques.macCreateUnique('assunto');
// ETL.CreateUniques.macCreateUnique('grupo_problema');
// ETL.CreateUniques.macCreateUnique('problema');
// ETL.CreateUniques.macCreateUnique('situacao');
// ETL.CreateUniques.macCreateUnique('avaliacao_reclamacao');
