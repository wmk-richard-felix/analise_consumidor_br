IMPORT CDM, ETL;

dInput := DATASET('~data::input::dadosgovbr2014', ETL.modLayouts.lInput, CSV(HEADING(SINGLE), SEPARATOR(';')));

ETL.Tests.macCreateUnique('gestor');
ETL.Tests.macCreateUnique('canal_de_origem');
ETL.Tests.macCreateUnique('segmento_de_mercado');
ETL.Tests.macCreateUnique('area');
ETL.Tests.macCreateUnique('assunto');
ETL.Tests.macCreateUnique('grupo_problema');
ETL.Tests.macCreateUnique('problema');
ETL.Tests.macCreateUnique('situacao');
ETL.Tests.macCreateUnique('avaliacao_reclamacao');

