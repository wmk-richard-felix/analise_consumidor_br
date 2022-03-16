IMPORT CDM, ETL, STD, Visualizer;

d2018 := CDM.modReclamacao.dData(STD.Date.Year(data_finalizacao) = 2018);
d2019 := CDM.modReclamacao.dData(STD.Date.Year(data_finalizacao) = 2019);
d2020 := CDM.modReclamacao.dData(STD.Date.Year(data_finalizacao) = 2020);
d2021 := CDM.modReclamacao.dData(STD.Date.Year(data_finalizacao) = 2021);

// 2018

d20Mais2018 := SORT(CHOOSEN(SORT(
      TABLE(
        d2018, {assunto, quantidade := COUNT(GROUP)}, assunto
), -quantidade), 10), quantidade);

OUTPUT(d20Mais2018, NAMED('Grafico_assuntos_reclamacoes_2018'));
viz2018 := Visualizer.MultiD.Column('column',, 'Grafico_assuntos_reclamacoes_2018');

// 2019

d20Mais2019 := SORT(CHOOSEN(SORT(
      TABLE(
        d2019, {assunto, quantidade := COUNT(GROUP)}, assunto
), -quantidade), 10), quantidade);

OUTPUT(d20Mais2019, NAMED('Grafico_assuntos_reclamacoes_2019'));
viz2019 := Visualizer.MultiD.Column('column',, 'Grafico_assuntos_reclamacoes_2019');

// 2020

d20Mais2020 := SORT(CHOOSEN(SORT(
      TABLE(
        d2020, {assunto, quantidade := COUNT(GROUP)}, assunto
), -quantidade), 10), quantidade);

OUTPUT(d20Mais2020, NAMED('Grafico_assuntos_reclamacoes_2020'));
viz2020 := Visualizer.MultiD.Column('column',, 'Grafico_assuntos_reclamacoes_2020');

// 2021

d20Mais2021 := SORT(CHOOSEN(SORT(
      TABLE(
        d2021, {assunto, quantidade := COUNT(GROUP)}, assunto
), -quantidade), 10), quantidade);

OUTPUT(d20Mais2021, NAMED('Grafico_assuntos_reclamacoes_2021'));
viz2021 := Visualizer.MultiD.Column('column',, 'Grafico_assuntos_reclamacoes_2021');
