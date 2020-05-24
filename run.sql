BEGIN
    DBMS_OUTPUT.enable;
END;
/
SET SERVEROUTPUT ON;

DECLARE
    CURSOR map_cursor IS
SELECT author_name, name, rating FROM Map;
                                    
    v_author_name Map.author_name%TYPE;
    v_name Map.name%TYPE;
    v_rating Map.rating%TYPE;
    v_id Map.id%TYPE;

    CURSOR function_cursor IS
                                SELECT *
                                FROM Table(find_map_by_date(TO_DATE('2005-10-06','yyyy-mm-dd'), 'Герои Меча и Магии III: Возрождение Эрафии'));

BEGIN
    DBMS_OUTPUT.put_line('Testing a procedure');
    DBMS_OUTPUT.put_line('Following calls will cause an error');
    DBMS_OUTPUT.put_line('');
    update_map_and_author(4,2,'James Hanson');
    update_map_and_author(7,6,'Stian Olsen');
    
    DBMS_OUTPUT.put_line('----------------------------------------');
    DBMS_OUTPUT.put_line('Following call will be OK');
    DBMS_OUTPUT.put_line('');
    update_map_and_author(1,20,'James Hanson');
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('Let``s check:');
    DBMS_OUTPUT.put_line('----------------------------------------');
    
    
    FOR cur_record IN map_cursor
    LOOP 
        v_author_name := cur_record.author_name;
        v_name := cur_record.name;
        v_rating := cur_record.rating;
        DBMS_OUTPUT.put_line('Author_name: ' || v_author_name || '    name: "' ||
            v_name || '"    rating: ' || v_rating);
    END LOOP;
    
    DBMS_OUTPUT.put_line('');
    DBMS_OUTPUT.put_line('As you can see, a line was updated. We updated James Hanson map rating from 11 to 20.');
    DBMS_OUTPUT.put_line('----------------------------------------');
    DBMS_OUTPUT.put_line('Testing a function');
    DBMS_OUTPUT.put_line('Calling find_map_by_date(TO_DATE("2005-10-06","yyyy-mm-dd"), "Герои Меча и Магии III: Возрождение Эрафии")');
    DBMS_OUTPUT.put_line('');
    
    FOR cur_record IN function_cursor
    LOOP
        v_author_name := cur_record.author_name;
        v_name := cur_record.name;
        v_rating := cur_record.rating;
        DBMS_OUTPUT.put_line('author_name: ' || v_author_name || '    name: ' ||
            v_name || '    rating: "' || v_rating || '"');
    END LOOP;
    
END;