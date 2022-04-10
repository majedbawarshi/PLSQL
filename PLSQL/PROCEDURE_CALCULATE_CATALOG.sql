CREATE OR REPLACE PROCEDURE MZONTUL.CALCULATE_CATALOG(E_YEAR IN NVARCHAR2,TERM IN SMALLINT, LECTURE_CODE IN NVARCHAR2)
IS  
 
 CURSOR C1 IS
  SELECT T.STUDENT_ID,T.AVERAGE
  FROM MZONTUL.TRANSCRIPT T WHERE T.E_YEAR=E_YEAR AND T.TERM=TERM AND T.LECTURE_CODE=LECTURE_CODE
  FOR UPDATE;
  
 STUDENT_CODE NVARCHAR2(10);
 AVERAGE NUMBER;
 GRADE NVARCHAR2(3);
BEGIN
 OPEN C1;
 DBMS_OUTPUT.PUT_LINE(LECTURE_CODE);

  
 LOOP 
  FETCH C1 INTO STUDENT_CODE,AVERAGE;
  EXIT WHEN C1%NOTFOUND;

  IF AVERAGE>=90 THEN
   GRADE:='AA';
  ELSIF AVERAGE>=85 THEN
   GRADE:='BA';
  ELSIF AVERAGE>=80 THEN
   GRADE:='BB';
  ELSIF AVERAGE>=75 THEN
   GRADE:='CB';
  ELSIF AVERAGE>=70 THEN
   GRADE:='CC';
  ELSIF AVERAGE>=60 THEN
   GRADE:='DC';
  ELSIF AVERAGE>=50 THEN
   GRADE:='DD';
  ELSIF AVERAGE>=40 THEN
   GRADE:='FD';
  ELSE
   GRADE:='FF';
 END IF;

    
    DBMS_OUTPUT.PUT_LINE(GRADE);

    UPDATE MZONTUL.TRANSCRIPT T
    SET T.GRADE=GRADE
    /*WHERE CURRENT OF C1;*/    
    WHERE T.E_YEAR=E_YEAR AND T.TERM=TERM AND T.LECTURE_CODE=LECTURE_CODE AND
          T.STUDENT_ID=STUDENT_CODE;
    COMMIT;
END LOOP;
CLOSE C1;

END;
/
BEGIN
  MZONTUL.CALCULATE_CATALOG('2009-2010',1,'SENG101');
END;