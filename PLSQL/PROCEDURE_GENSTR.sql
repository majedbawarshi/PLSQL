CREATE OR REPLACE PROCEDURE MZONTUL.GENSTR(lenght IN  INT ,RESULT OUT NVARCHAR2)
IS 

S NVARCHAR2(300);
I INT;
NUM INT;
RAND NUMERIC(38,10);
BEGIN   
  S := '';
  I := 1;
  WHILE I<=lenght loop       
    SELECT DBMS_RANDOM.VALUE INTO rand FROM DUAL;
    select CAST(RAND *26+65 AS INT) INTO NUM FROM DUAL;
    S:=S||CHR(NUM);
    I:=I+1;
  END LOOP;    
  RESULT:=S;
END;
/
