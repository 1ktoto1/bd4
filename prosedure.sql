BEGIN
    DBMS_OUTPUT.enable;
END;
/
SET SERVEROUTPUT ON;


CREATE OR REPLACE PROCEDURE update_map_and_author(
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