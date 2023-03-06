USE sem4;
DROP PROCEDURE IF EXISTS convert_data;
/* Создайте функцию, которая принимает кол-во сек и форматирует их в 
кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '*/
DELIMITER //
CREATE FUNCTION convert_data(num INT)
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE minuts INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0; 
    DECLARE days INT DEFAULT 0;
	IF num<=60 THEN
		RETURN CONCAT(num,' ', 'секунд');
	ELSE 
		WHILE num >=60 DO
			SET minuts = num DIV 60;
            SET num = num - minuts*60;
        END WHILE;
        WHILE minuts >=60 DO
			SET hours = minuts DIV 60;
            SET minuts = minuts - hours*60;
        END WHILE;
        WHILE hours >=24 DO
			SET days = hours DIV 24;
            SET hours = hours - days*24;
        END WHILE;
        RETURN CONCAT(days,' ','дней',' ',hours,' ','часов',
			' ',minuts,' ','минут',' ',num,' ','секунд');
        END IF;
        END //
	DELIMITER ;
    
SELECT convert_data(123456);

/*2.	Выведите только четные числа от 1 до 10 включительно. 
(Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2) */

 DELIMITER $$
CREATE FUNCTION even_numbers(num1 INT, num2 INT)
RETURNS VARCHAR(600)
DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(600);
    IF num1 = num2 THEN
		RETURN('ошибка ввода');
	ELSE
    IF num1 MOD 2 <> 0 THEN
		SET num1=num1+1;
        SET result = CONCAT(num1);
	ELSE
		SET result = CONCAT(num1);
        END IF;
		WHILE num1 < num2 DO
            SET num1 = num1+2;
            SET result = CONCAT(result, ' ', num1);
        END WHILE;
        RETURN result;
        END IF;
        END $$
	DELIMITER ; 
    
    SELECT even_numbers(2, 50)
            
        
