IMPORT Common;

EXPORT modFunctions := MODULE

    EXPORT fGetSFFilename(STRING sCDMTable) := FUNCTION
        RETURN Common.modConstants.sSystemScope + Common.modConstants.sCDMScope + sCDMTable;
    END;

END;