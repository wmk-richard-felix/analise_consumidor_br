IMPORT CDM, ML_Core, STD;

dReclamacoes := CDM.modReclamacao.dData;

lRec := RECORD
  UNSIGNED ano;
  UNSIGNED dias_resposta;
END;

ds := PROJECT(dReclamacoes(data_abertura > 20140101 AND data_abertura < data_finalizacao), TRANSFORM(lRec,
    SELF.ano := STD.Date.Year(LEFT.data_finalizacao);
    SELF.dias_resposta := STD.Date.DaysBetween(LEFT.data_abertura, LEFT.data_finalizacao);
));

ds;

ML_Core.Types.NumericField XF(ds L, INTEGER C) := TRANSFORM
  SELF.id := C;
  SELF.number := L.ano;
  SELF.wi := L.ano;
  SELF.value := L.dias_resposta;
END;

P := PROJECT(ds,XF(LEFT,COUNTER));


// AVG2(REAL L, REAL R) := AVE(L,R);
// DateStr(REAL jdate) := STD.Date.ToString(STD.Date.ToJulianDate(ROUND(jdate)),'%Y-%m-%d');

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


OUTPUT(SORT(dOut, ano), NAMED('Media_de_dias_resposta'));
