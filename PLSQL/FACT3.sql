DECLARE

    i NUMBER := 1;
    FACT NUMBER:=1;

BEGIN
    DELETE FROM MZONTUL.T1;

    FOR i IN 1..100 LOOP

        INSERT INTO MZONTUL.T1 VALUES(i,FACT);        
        FACT:=FACT*i;        
    END LOOP;
    COMMIT;
END;

