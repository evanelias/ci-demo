DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `query_runtime`() RETURNS double
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Return current query runtime'
BEGIN
  return TIMESTAMPDIFF(MICROSECOND, NOW(), SYSDATE()) / 1000000.0;
END//
DELIMITER ;
