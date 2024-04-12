---------------------------------------------------------PACKAGE MERCHANDISE---------------------------------
set serveroutput on;
CREATE OR REPLACE PACKAGE merchandise_mgmt AS
    PROCEDURE INSERT_MERCHANDISE(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    );

    PROCEDURE UpdateMerchandise(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    );

    PROCEDURE delete_merchandise(
        p_item_no        VARCHAR2
    );

END merchandise_mgmt;
/

CREATE OR REPLACE PACKAGE BODY merchandise_mgmt AS
    invalid_item_no EXCEPTION;
    invalid_club_id EXCEPTION;
    null_value_found EXCEPTION;
    duplicate_primary_key EXCEPTION;
    invalid_foreign_key EXCEPTION;
    out_of_range_exception EXCEPTION;

    PROCEDURE INSERT_MERCHANDISE(
        p_item_no        VARCHAR2,
        p_club_id        VARCHAR2,
        p_item_name      VARCHAR2,
        p_buyer_name     VARCHAR2,
        p_category       VARCHAR2,
        p_price          NUMBER
    ) AS
        v_count NUMBER;
    BEGIN
        -- Check for null values
        IF p_item_no IS NULL OR p_club_id IS NULL OR p_item_name IS NULL OR 
           p_buyer_name IS NULL OR p_category IS NULL OR p_price IS NULL THEN
            RAISE null_value_found;
        END IF;
        
        -- Check for data type
        -- No need to check as PL/SQL handles data type implicitly
        
        -- Check for min and max range for p_price
        IF p_price < 0 THEN
            RAISE out_of_range_exception;
        END IF;

        -- Check for duplicate primary key
        BEGIN
            INSERT INTO merchandise (item_no, club_id, item_name, buyer_name, category, price)
            VALUES (p_item_no, p_club_id, p_item_name, p_buyer_name, p_category, p_price);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                RAISE duplicate_primary_key;
        END;
        
        -- Check for invalid foreign key (assuming club_id is a foreign key)
        BEGIN
            SELECT COUNT(*) INTO v_count FROM club WHERE club_id = p_club_id;
            IF v_count = 0 THEN
                RAISE invalid_foreign_key;
            END IF;
        END;

    EXCEPTION
        WHEN null_value_found THEN
            DBMS_OUTPUT.PUT_LINE('Error: One or more required fields are null.');
        WHEN out_of_range_exception THEN
            DBMS_OUTPUT.PUT_LINE('Error: Price must be greater than or equal to 0.');
        WHEN duplicate_primary_key THEN
            DBMS_OUTPUT.PUT_LINE('Error: Duplicate primary key found.');
        WHEN invalid_foreign_key THEN
            DBMS_OUTPUT.PUT_LINE('Error: Invalid foreign key constraint.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END INSERT_MERCHANDISE;

    PROCEDURE UpdateMerchandise(
    p_item_no        VARCHAR2,
    p_club_id        VARCHAR2,
    p_item_name      VARCHAR2,
    p_buyer_name     VARCHAR2,
    p_category       VARCHAR2,
    p_price          NUMBER
) AS
    v_count NUMBER;
BEGIN
    -- Check for null values
    IF p_item_no IS NULL OR p_club_id IS NULL OR p_item_name IS NULL OR 
       p_buyer_name IS NULL OR p_category IS NULL OR p_price IS NULL THEN
        RAISE null_value_found;
    END IF;

    -- Check for data type (no need to check explicitly in PL/SQL)
    
    -- Check for min and max range for p_price
    IF p_price < 0 THEN
        RAISE out_of_range_exception;
    END IF;

    -- Check for duplicate primary key
    BEGIN
        -- Assuming item_no is the primary key
        SELECT COUNT(*) INTO v_count FROM merchandise WHERE item_no = p_item_no;
        IF v_count = 0 THEN
            RAISE invalid_item_no;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE invalid_item_no;
    END;

    -- Check for invalid foreign key (assuming club_id is a foreign key)
    BEGIN
        SELECT COUNT(*) INTO v_count FROM club WHERE club_id = p_club_id;
        IF v_count = 0 THEN
            RAISE invalid_foreign_key;
        END IF;
    END;

    -- Update merchandise
    UPDATE merchandise
    SET club_id = p_club_id,
        item_name = p_item_name,
        buyer_name = p_buyer_name,
        category = p_category,
        price = p_price
    WHERE item_no = p_item_no;

EXCEPTION
    WHEN null_value_found THEN
        DBMS_OUTPUT.PUT_LINE('Error: One or more required fields are null.');
    WHEN out_of_range_exception THEN
        DBMS_OUTPUT.PUT_LINE('Error: Price must be greater than or equal to 0.');
    WHEN invalid_item_no THEN
        DBMS_OUTPUT.PUT_LINE('Error: Merchandise with item number ' || p_item_no || ' not found.');
    WHEN invalid_foreign_key THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid foreign key constraint.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END UpdateMerchandise;

    PROCEDURE delete_merchandise(
        p_item_no        VARCHAR2
    ) AS
    BEGIN
        -- Check for null values
        IF p_item_no IS NULL THEN
            RAISE null_value_found;
        END IF;

        -- Delete merchandise
        DELETE FROM merchandise WHERE item_no = p_item_no;

        -- Check if any row was deleted
        IF SQL%ROWCOUNT = 0 THEN
            RAISE invalid_item_no;
        END IF;

    EXCEPTION
        WHEN null_value_found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Item number must be provided.');
        WHEN invalid_item_no THEN
            DBMS_OUTPUT.PUT_LINE('Error: Merchandise with item number ' || p_item_no || ' not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
    END delete_merchandise;

END merchandise_mgmt;
/

-------------------------------------------------------------------ending package merchandise-----------------------------------------------------------


-------------------------------TESTING PACKAGE MERCHSNDISE MANAGEMENT ----------------------------------------------------------------------

SET SERVEROUTPUT ON;

--  Inserting a merchandise with valid data
BEGIN
    merchandise_mgmt.INSERT_MERCHANDISE(
        p_item_no    => 'item001',
        p_club_id    => 'CLB001',
        p_item_name  => 'Test Item',
        p_buyer_name => 'Test Buyer',
        p_category   => 'Test Category',
        p_price      => 50.00
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(' Inserting a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(' Inserting a merchandise with valid data - FAILED. Error: ' || LTRIM(SUBSTR(SQLERRM, INSTR(SQLERRM, ':') + 1)));
END;
/



--  Updating a merchandise with valid data
BEGIN
    merchandise_mgmt.UpdateMerchandise(
        p_item_no    => 'item001',
        p_club_id    => 'CLB001',
        p_item_name  => 'Updated Item Name',
        p_buyer_name => 'Updated Buyer Name',
        p_category   => 'Updated Category',
        p_price      => 60.00
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(' Updating a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(' Updating a merchandise with valid data - FAILED. Error: ' || LTRIM(SUBSTR(SQLERRM, INSTR(SQLERRM, ':') + 1)));
END;
/

--  Deleting a merchandise with valid data
BEGIN
    merchandise_mgmt.delete_merchandise(
        p_item_no    => 'item001'
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(' Deleting a merchandise with valid data - PASSED');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(' Deleting a merchandise with valid data - FAILED. Error: ' || LTRIM(SUBSTR(SQLERRM, INSTR(SQLERRM, ':') + 1)));
END;
/






-------------------------------END -----   TESTING PACKAGE MERCHSNDISE MANAGEMENT ----------------------------------------------------------------------
