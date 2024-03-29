1)
INSERT INTO MZONTUL.DEPT2 
SELECT * FROM MZONTUL.DEPT WHERE FACULTY_CODE='EF';

2)
DROP SEQUENCE TRANSCRIPT_SEQ 
CREATE SEQUENCE TRANSCRIPT_SEQ START WITH 1 INCREMENT BY 1

3)
CREATE OR REPLACE TRIGGER TRANSCRIPT_ID
BEFORE INSERT ON TRANSCRIPT
FOR EACH ROW
BEGIN
  SELECT TRANSCRIPT_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

4)
CREATE OR REPLACE TRIGGER STUDENT_TRIG
BEFORE DELETE ON STUDENT
FOR EACH ROW
BEGIN    
  INSERT INTO STUDENT_BACKUP 
  VALUES(:OLD.STUDENT_ID,:OLD.NAME,:OLD.SURNAME,:OLD.BIRTH_DATE,:OLD.FAMILY_INCOME,:OLD.DEPT_CODE);
  
  /*INSERT INTO STUDENT_BACKUP SELECT * FROM STUDENT WHERE STUDENT_ID=:OLD.STUDENT_ID;*/

END;

DELETE FROM STUDENT WHERE STUDENT_ID='YM09002';

5)
CREATE OR REPLACE TRIGGER TRANSCRIPT_DEL
BEFORE DELETE ON TRANSCRIPT
FOR EACH ROW
BEGIN
  IF (:OLD.E_YEAR='2009-2010')THEN

    raise_application_error(-20000,'2009-2010 EDUCATION YEAR RECORDS CANNOT BE DELETED'); 

  END IF;

END;
DELETE FROM TRANSCRIPT WHERE ID=1;

6)
CREATE OR REPLACE TRIGGER TRANSCRIPT_AVG
BEFORE INSERT OR UPDATE ON TRANSCRIPT
FOR EACH ROW
DECLARE
  AVG2 NUMBER;
BEGIN
  AVG2:=:NEW.MIDTERM*0.4+:NEW.FINAL*0.6;
  :NEW.AVERAGE:=AVG2;
 /*SELECT :NEW.MIDTERM*0.4+:NEW.FINAL*0.6 INTO :NEW.AVERAGE FROM DUAL;*/
END;

7)
SELECT USER,SYSDATE,dbms_session.unique_session_id FROM DUAL;
select 
   to_number(substr(dbms_session.unique_session_id,1,4),'XXXX') mysid 
from dual; 
