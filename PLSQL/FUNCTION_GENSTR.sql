CREATE OR REPLACE FUNCTION MZONTUL.GENSTR3(lenght IN  INT)
RETURN NVARCHAR2 IS 
S NVARCHAR2(300); I INT; NUM INT;RAND NUMERIC(38,10);RAND2 NUMERIC(38,10);
BEGIN   
  S := '';
  I := 1;
  WHILE I<=lenght loop  
    SELECT ROUND(DBMS_RANDOM.VALUE(1,2)) INTO RAND2 FROM DUAL;
    IF RAND2=1 THEN
      SELECT DBMS_RANDOM.VALUE INTO rand FROM DUAL;
      select CAST(RAND *26+65 AS INT) INTO NUM FROM DUAL;
    ELSE
      SELECT DBMS_RANDOM.VALUE INTO rand FROM DUAL;
      select CAST(RAND *10+48 AS INT) INTO NUM FROM DUAL;
    END IF;
    S:=S||CHR(NUM);
    I:=I+1;
  END LOOP;    
  RETURN S;
END;


 
DECLARE S VARCHAR2(100);  
BEGIN
 SELECT MZONTUL.GENSTR3(20)INTO S FROM DUAL;
 DBMS_OUTPUT.PUT_LINE(S);
END;