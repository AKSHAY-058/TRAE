-- Test Case 1: Limited Object List with Enforcement
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'TEST_PROFILE1',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [
        {"owner": "LARGE_SCHEMA1", "name": "employees"},
        {"owner": "LARGE_SCHEMA1", "name": "departments"},
        {"owner": "LARGE_SCHEMA1", "name": "salary_grades"}
      ],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('TEST_PROFILE1');
select ai list the tables in LARGE_SCHEMA1;

-- Test Case 2: Automated Mode with Department Tables
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'TEST_PROFILE2',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [
        {"owner": "LARGE_SCHEMA1", "name": "departments"},
        {"owner": "LARGE_SCHEMA1", "name": "department_budgets"}
      ],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "automated",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('TEST_PROFILE2');
select ai describe the department-related tables and their relationships;

-- Test Case 3: Mixed Domain Access
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'TEST_PROFILE3',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [
        {"owner": "LARGE_SCHEMA1", "name": "employees"},
        {"owner": "LARGE_SCHEMA1", "name": "customers"},
        {"owner": "LARGE_SCHEMA1", "name": "products"},
        {"owner": "LARGE_SCHEMA1", "name": "inventory_items"}
      ],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('TEST_PROFILE3');
select ai analyze the relationships between employees, customers, products, and inventory;

-- Test Case 4: Full Schema Access
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'TEST_PROFILE4',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [{"owner": "LARGE_SCHEMA1"}],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "false"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('TEST_PROFILE4');
select ai list all tables and their purposes in LARGE_SCHEMA1;

-- Test Case 5: Dynamic Object List Updates
exec DBMS_CLOUD_AI.set_profile('TEST_PROFILE1');
select ai list the tables in LARGE_SCHEMA1;

exec DBMS_CLOUD_AI.set_attribute('TEST_PROFILE1', 'object_list', 
  '[{"owner": "LARGE_SCHEMA1", "name": "employees"},
    {"owner": "LARGE_SCHEMA1", "name": "departments"},
    {"owner": "LARGE_SCHEMA1", "name": "salary_grades"},
    {"owner": "LARGE_SCHEMA1", "name": "job_history"}]');

select ai list the tables in LARGE_SCHEMA1;