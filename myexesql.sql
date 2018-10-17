CREATE DEFINER=`root`@`%` PROCEDURE `myexecsql`(
in mesql VARCHAR(4000),
in tmptbname VARCHAR(4000)
)
BEGIN
 IF (tmptbname='') THEN
 BEGIN
 SET @p=mesql;
 PREPARE p_sql FROM @p;
 EXECUTE  p_sql;
 deallocate prepare p_sql;
 END;
 ELSE
 BEGIN
 SET @p1=CONCAT('DROP TEMPORARY TABLE IF EXISTS ',tmptbname);
 PREPARE p_sql FROM @p1;
 EXECUTE  p_sql;
 deallocate prepare p_sql;
 SET @p2=CONCAT('CREATE TEMPORARY TABLE ',tmptbname,' ',mesql);
 PREPARE p_sql FROM @p2;
 EXECUTE  p_sql;
 deallocate prepare p_sql;
 END;
 END if;
END