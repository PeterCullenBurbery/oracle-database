CREATE OR REPLACE PROCEDURE drop_table(p_table_name IN VARCHAR2) IS
    v_count INTEGER;
BEGIN
    -- Check if the table exists in the current schema
    SELECT COUNT(*) INTO v_count
    FROM user_tables
    WHERE table_name = UPPER(p_table_name);

    IF v_count > 0 THEN
        EXECUTE IMMEDIATE 'DROP TABLE "' || p_table_name || '" CASCADE CONSTRAINTS';
        DBMS_OUTPUT.PUT_LINE('Table "' || p_table_name || '" dropped.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table "' || p_table_name || '" does not exist.');
    END IF;
END;
/
