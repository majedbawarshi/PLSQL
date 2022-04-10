/*
write a stored procedure to increment theoretical hours and credits of lectures in a given
faculty by a given value
*/
CREATE OR REPLACE PROCEDURE MZONTUL.INCREMENT_CREDIT(FACULTY_CODE IN NVARCHAR2,V IN NUMBER)IS
BEGIN
  UPDATE (SELECT F.*,L.*
             FROM MZONTUL.DEPT D INNER JOIN MZONTUL.FACULTY F 
                  ON D.FACULTY_CODE=F.FACULTY_CODE
                  INNER JOIN MZONTUL.LECTURE L 
                  ON D.DEPT_CODE=L.DEPT_CODE) T  
  SET T.T_HOUR=T.T_HOUR+V,
      T.CREDIT=ROUND(T.T_HOUR+V+P_HOUR*0.5,1)
  WHERE T.FACULTY_CODE=FACULTY_CODE;
  COMMIT;
END;
/*CALL */
BEGIN
 MZONTUL.INCREMENT_CREDIT('EF',1);
END;