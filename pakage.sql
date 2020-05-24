CREATE OR REPLACE PACKAGE MAP_pkg 	IS
	
	TYPE map_row IS RECORD(
		author_name Map.author_name%TYPE,
		name Map.name%TYPE,
		rating Map.rating%TYPE
		);

	TYPE map_table IS TABLE OF map_row;

	PROCEDURE update_map_and_author(
    par_map_id Map.id%TYPE,
    par_rating Map.rating%TYPE,
    par_author Author.name%TYPE
    );

    FUNCTION find_map_by_date(
    par_date Map.map_date%TYPE,
    par_game Game.game%TYPE
    )
    RETURN map_table
    PIPELINED;

END MAP_pkg;


/


CREATE OR REPLACE PACKAGE BODY MAP_pkg IS

	PROCEDURE update_map_and_author(
    par_map_id Map.id%TYPE,
    par_rating Map.rating%TYPE,
    par_author Author.name%TYPE
    )
    AS
        var_map_id Map.id%TYPE;
        var_author Author.name%TYPE;
    BEGIN

        SELECT id INTO var_map_id FROM map WHERE id = par_map_id;
        SELECT name INTO var_author FROM Author WHERE name = par_author;
        UPDATE map SET rating = par_rating WHERE par_map_id = id ;

        DBMS_OUTPUT.put_line('Success');
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.put_line('Error');
            DBMS_OUTPUT.put_line('map or author was not found');
        
    END;


    FUNCTION find_map_by_date(
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
        	PIPE ROW(map_record);
        END LOOP;
    END find_map_by_date;
END MAP_pkg;
