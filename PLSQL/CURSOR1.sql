DECLARE
  R MZONTUL.STUDENT%ROWTYPE;
  /*STUDENT_ID MZONTUL.STUDENT.STUDENT_ID%TYPE;
    NAME MZONTUL.STUDENT.NAME%TYPE;
    ...
  */
  CURSOR C1 IS
  SELECT * FROM MZONTUL.STUDENT S
  WHERE S.BIRTH_DATE<'01.01.1990'
  FOR UPDATE;
BEGIN
  DELETE FROM MZONTUL.STUDENT_BACKUP;
  OPEN C1;
  LOOP
    FETCH C1 INTO R;
    /* FETCH C1 INTO STUDENT_ID,NAME,...*/
    EXIT WHEN C1%NOTFOUND;
    DELETE FROM MZONTUL.STUDENT WHERE CURRENT OF C1;
    INSERT INTO MZONTUL.STUDENT_BACKUP(STUDENT_ID,NAME,SURNAME) VALUES (R.STUDENT_ID,R.NAME,R.SURNAME);
  END LOOP;
  CLOSE C1;  
  COMMIT;
END;