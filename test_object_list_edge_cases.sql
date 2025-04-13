-- Test Case 1: Entire Schema Access
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'SCHEMA_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [{"owner": "LARGE_SCHEMA1"}],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('SCHEMA_PROFILE');
select ai list all tables in LARGE_SCHEMA1;

-- Test Case 2: Cross-Schema Access
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'CROSS_SCHEMA_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [
        {"owner": "LARGE_SCHEMA1", "name": "employees"},
        {"owner": "LARGE_SCHEMA2", "name": "departments"},
        {"owner": "LARGE_SCHEMA3", "name": "projects"}
      ],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('CROSS_SCHEMA_PROFILE');
select ai describe the relationships between employees, departments, and projects across schemas;

-- Test Case 3: NULL Object List
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'NULL_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": null,
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('NULL_PROFILE');
select ai list the accessible tables;

-- Test Case 4: Empty Object List
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'EMPTY_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('EMPTY_PROFILE');
select ai list the accessible tables;

-- Test Case 5: Invalid Table Names
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'INVALID_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [
        {"owner": "LARGE_SCHEMA1", "name": "nonexistent_table"},
        {"owner": "INVALID_SCHEMA", "name": "employees"},
        {"owner": "LARGE_SCHEMA1", "name": "invalid_table_name!@#"}
      ],
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('INVALID_PROFILE');
select ai list the accessible tables;

-- Test Case 6: No Object List Specified
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'NO_LIST_PROFILE',
    '{
      "provider": "oci",
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "model": "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list": "true"
    }');
END;
/

exec DBMS_CLOUD_AI.set_profile('NO_LIST_PROFILE');
select ai list the accessible tables;