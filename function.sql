--Получает 2 значения : map_date и game. 
-- возвращает таблицу с перечислением карт созданных для данной игры в данную дату 
-- таблица имеет столбцы : author_name , name , rating

CREATE OR REPLACE TYPE map_row AS OBJECT (
 author_name VARCHAR(256),
 name VARCHAR(256),
 rating INT
);
/
CREATE OR REPLACE TYPE map_table IS TABLE OF map_row;
/
CREATE OR REPLACE FUNCTION find_map_by_date(
    par_date Map.map_date%TYPE,
    par_game Game.game%TYPE
    )
    RETURN map_table
    PIPELINED
    IS
    CURSOR map_cursor IS
                        SELECT author_name,	name, rating
                        FROM Map 
                        WHERE Map.game = par_game and Map.map_date = par_date;
    BEGIN
        FOR map_record IN map_cursor
        LOOP
        PIPE ROW(map_row(
                    map_record.author_name,
                    map_record.name,
                    map_record.rating
                    ));
        END LOOP;
    END find_map_by_date;

