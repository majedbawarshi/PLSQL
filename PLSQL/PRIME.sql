DECLARE
    i  NUMBER; 
    j  NUMBER;
    PRIME  NUMBER;
BEGIN
    DELETE FROM MZONTUL.T1;
    INSERT INTO MZONTUL.T1 VALUES(1,0);/*NOT PRIME */
    INSERT INTO MZONTUL.T1 VALUES(2,1);/*PRIME*/

    FOR i IN 3..100 LOOP    
        PRIME:=1;/*ASSUME AS PRIME*/
        FOR j IN 2..i-1 LOOP      
           IF MOD(i,j)=0 THEN           
              PRIME:=0; /*NOT PRIME*/  
              EXIT;      
           END IF;
        END LOOP;
        IF PRIME=0 THEN
          INSERT INTO MZONTUL.T1 VALUES(i,0);
        ELSE
          INSERT INTO MZONTUL.T1 VALUES(i,1);   
        END IF;            
    END LOOP;
    COMMIT;
END;

