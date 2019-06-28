DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `easter_day`(dt DATETIME) RETURNS date
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'Returns date of easter day for given year'
BEGIN
    DECLARE p_year    SMALLINT DEFAULT YEAR(dt);
    DECLARE a    SMALLINT DEFAULT p_year % 19;
    DECLARE b    SMALLINT DEFAULT p_year DIV 100;
    DECLARE c    SMALLINT DEFAULT p_year % 100;
    DECLARE e    SMALLINT DEFAULT b % 4;
    DECLARE h    SMALLINT DEFAULT (19*a + b - (b DIV 4) - ((b - ((b + 8) DIV 25) + 1) DIV 3) + 15) % 30;
    DECLARE L    SMALLINT DEFAULT (32 + 2*e + 2*(c DIV 4) - h - (c % 4)) % 7;
    DECLARE v100 SMALLINT DEFAULT h + L - 7*((a + 11*h + 22*L) DIV 451) + 114;

    RETURN STR_TO_DATE(
                CONCAT(
                    p_year
                ,   '-'
                ,    v100 DIV 31
                ,   '-'
                ,   (v100 % 31) + 1
                )
            ,   '%Y-%c-%e'
            );
END//
DELIMITER ;
