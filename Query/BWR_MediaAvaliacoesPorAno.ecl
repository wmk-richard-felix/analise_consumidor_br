IMPORT CDM, ML_Core, STD;

dReclamacoes := CDM.modReclamacao.dData;
dAvaliacoes := CDM.modAvaliacao.dData(
  nota > 0);

lJoin := RECORD
  UNSIGNED ano;
  CDM.modAvaliacao.lLayout;
END;

dJoin := JOIN(dAvaliacoes, dReclamacoes, LEFT.id_unico = RIGHT.id_unico, TRANSFORM(lJoin,
  SELF.ano := STD.Date.Year(RIGHT.data_finalizacao);
  SELF := LEFT; x
));

dJoin(nota = 0);

ML_Core.Types.NumericField XF(dJoin L, INTEGER C) := TRANSFORM
  SELF.id := C;
  SELF.number := L.ano;
  SELF.wi := L.ano;
  SELF.value := L.nota;
END;

P := PROJECT(dJoin,XF(LEFT,COUNTER));

Simples := ML_Core.FieldAggregates(P).Simple;

lOut := RECORD
  UNSIGNED ano;
  UNSIGNED minval;
  UNSIGNED maxval;
  UNSIGNED media;
END;

dOut := PROJECT(Simples(wi > 0), TRANSFORM(lOut,
    SELF.ano := LEFT.wi;
    SELF.media := LEFT.mean;
    SELF := LEFT;
));


OUTPUT(SORT(dOut, ano), NAMED('Media_de_Notas'));
