IMPORT ETL, STD;
sInput := '~data::input::basecompleta2021-05';

// 4, 5, 6, 

sIdRemessa := '202104';

dData := DATASET(sInput, ETL.modLayouts.lRaw2021_ge, CSV);

dInput := PROJECT(dData, TRANSFORM(ETL.modLayouts.lInput,
    SELF.cont_remessa := INTFORMAT(COUNTER, 7, 1);
    SELF.data_remessa := STD.Date.Today();
    SELF.id_unico := (UNSIGNED) (sIdRemessa + SELF.cont_remessa);
    SELF := LEFT;
));

dInput