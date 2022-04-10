DECLARE

    i NUMBER := 1;
    FACT NUMBER:=1;

BEGIN
    DELETE FROM MZONTUL.T1;

    LOOP

        INSERT INTO MZONTUL.T1 VALUES(i,FACT);
        i := i+1;
        FACT:=FACT*i;
        EXIT WHEN i>100;
    END LOOP;
    COMMIT;
END;

