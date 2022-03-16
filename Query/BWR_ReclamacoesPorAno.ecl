IMPORT CDM, Visualizer, STD;

// Buscando dados na tabela reclamações
dReclamacoes := CDM.modReclamacao.dData;

// Separando as reclamações por ano
dReclamacoesPorAno := PROJECT(dReclamacoes, TRANSFORM({INTEGER2 ano},
  SELF.ano := STD.Date.Year(LEFT.data_finalizacao);
));

// Realizando a contagem das reclamações
dCountReclamacoes := SORT(TABLE(dReclamacoesPorAno(ano > 0), {ano, quantidade := COUNT(GROUP)}, ano), ano);

// Realizando o output das informações
OUTPUT(dCountReclamacoes, NAMED('Tabela_num_reclamacoes'));
OUTPUT(dCountReclamacoes, NAMED('Grafico__num_reclamacoes'));
viz := Visualizer.MultiD.Column('column',, 'Grafico__num_reclamacoes');