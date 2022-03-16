EXPORT macCreateUnique(sField) := FUNCTIONMACRO
    #EXPAND('dDeduped'+sField+' :=  DEDUP(SORT(dInput,'+sField+'), '+sField+');');
    #EXPAND('d'+sField+' := PROJECT(dDeduped'+sField+', TRANSFORM({UNSIGNED id, STRING desc}, SELF.id := COUNTER; SELF.desc := LEFT.'+sField+';));');
    
    RETURN OUTPUT(#EXPAND('d'+sField), ALL);
ENDMACRO;
