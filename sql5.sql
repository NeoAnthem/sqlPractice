delimiter // 
CREATE PROCEDURE simple_loop()
    BEGIN
        DECLARE i INT DEFAULT 0;
        my_loop: LOOP
            SET i = i + 1;
            IF i > 5 THEN
                LEAVE my_loop;
            END IF;
            -- Perform some action here
            SELECT CONCAT('Current value of i: ', i);
        END LOOP my_loop;
    END;
//
delimiter ;

delimiter //
CREATE PROCEDURE while_loop_example()
    BEGIN
        DECLARE counter INT DEFAULT 0;
        WHILE counter < 3 DO
            SET counter = counter + 1;
            -- Perform some action here
            SELECT CONCAT('Counter value: ', counter);
        END WHILE;
    END;
//
delimiter ;

delimiter //
CREATE PROCEDURE repeat_loop_example()
    BEGIN
        DECLARE x INT DEFAULT 0;
        REPEAT
            SET x = x + 1;
            -- Perform some action here
            SELECT CONCAT('X value: ', x);
        UNTIL x >= 2
        END REPEAT;
    END;
//
delimiter ;

-- The main types of loops in MySQL are:
-- 1. LOOP: This is a simple loop that executes a block of statements 
-- repeatedly until explicitly terminated by a LEAVE statement. Within a 
-- stored function, Return can also exit the loop and the function. 
-- Without a termination condition, it becomes an infinite loop.

-- 2. WHILE Loop: This loop repeatedly executes a block of statements 
-- as long as a specified condition evaluates to true. The condition 
-- is checked at the beginning of each iteration. 

-- 3. REPEAT Loop: This loop repeatedly executes a block of statements 
-- until a specified condition becomes true. The condition is checked 
-- at the end of each iteration, meaning the loop body is executed at 
-- least once.
    
delimiter //
          CREATE PROCEDURE while_loop_example()
            BEGIN
                DECLARE counter INT DEFAULT 11;
                WHILE counter < 3 DO
                    
                    -- Perform some action here
                    SELECT CONCAT('while_loop_example Counter value: ', counter) as while_counter;
                    SET counter = counter + 1;
                END WHILE;
            END //
delimiter ;

call while_loop_example();

delimiter //
      CREATE PROCEDURE repeat_loop_example()
        BEGIN
            DECLARE x INT DEFAULT 11;
            REPEAT
                
                -- Perform some action here
                SELECT CONCAT('repeat_loop_example X value: ', x) as repeat_counter;
                SET x = x + 1;
            UNTIL x > 2
            
            END REPEAT;
        END //
delimiter ;

call repeat_loop_example();

delimiter //
          CREATE PROCEDURE while_loop_example()
            BEGIN
                DECLARE counter INT DEFAULT 0;
                WHILE counter < 3 DO
                    
                    -- Perform some action here
                    SELECT CONCAT('while_loop_example Counter value: ', counter) as while_counter;
                    SET counter = counter + 1;
                END WHILE;
            END //
delimiter ;

call while_loop_example();

delimiter //
      CREATE PROCEDURE repeat_loop_example()
        BEGIN
            DECLARE x INT DEFAULT 0;
            REPEAT
                
                -- Perform some action here
                SELECT CONCAT('repeat_loop_example X value: ', x) as repeat_counter;
                SET x = x + 1;
            UNTIL x > 2
            
            END REPEAT;
        END //
delimiter ;

call repeat_loop_example();

