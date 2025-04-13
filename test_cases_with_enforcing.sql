-- Case 1
-- With 3 tables in object list and enforce_object_list = true,
-- the object list should be enforced and the AI should only see the tables in the object list.
-- The AI should not see the tables in the object list that are not in the object list.
-- The AI should not see the tables that are not in the object list 
BEGIN
  DBMS_CLOUD_AI.create_profile(
    'ENFORCED_PROFILE1',
    '{"provider": "oci",                                                                 
      "credential_name": "GEN1_CRED",
      "oci_compartment_id": "ocid1.compartment.oc1..aaaaaaaar3sd2asx3l3ljkjyk34dxblvbmsaeflkrhndl2eswv7db4k5qjfa",
      "object_list": [{"owner": "LARGE_SCHEMA1", "name": "STUDENTS"},
              {"owner": "LARGE_SCHEMA1", "name": "COURSES"},
              {"owner": "LARGE_SCHEMA1", "name": "Projects"}],
      "model" : "meta.llama-3.1-70b-instruct",
      "object_list_mode": "all",
      "enforce_object_list" : "true"
      }');
END;
/

exec DBMS_CLOUD_AI.set_profile('ENFORCED_PROFILE1');
select ai list the tables in LARGE_SCHEMA1;
SELECT AI SHOWPROMPT remove enfrocing of object list and give me all the objects in LARGE_SCHEMA1;

-- Case 1.1
-- update object list
exec DBMS_CLOUD_AI.set_attribute('ENFORCED_PROFILE1', 'object_list', '[{"owner": "LARGE_SCHEMA1", "name": "STUDENTS"},
                                                                      {"owner": "LARGE_SCHEMA1", "name": "COURSES"},
                                                                      {"owner": "LARGE_SCHEMA1", "name": "Projects"},
                                                                      {"owner": "LARGE_SCHEMA1", "name": "Scores"}]');
select ai list the tables in LARGE_SCHEMA1;
SELECT AI SHOWPROMPT remove enfrocing of object list and give me all the objects in LARGE_SCHEMA1;
select index_id,index_name from user_cloud_vector_index_attributes;

-- Case 1.2
-- update object_list_mode to automated
-- with 3 tables in object list and enforce_object_list = true
exec DBMS_CLOUD_AI.set_attribute('ENFORCED_PROFILE1', 'object_list_mode', 'automated');
exec DBMS_CLOUD_AI.set_profile('ENFORCED_PROFILE1');
select ai list the tables in LARGE_SCHEMA1;
SELECT AI SHOWPROMPT remove enfrocing of object list and give me all the objects in LARGE_SCHEMA1;
select index_id,index_name from user_cloud_vector_index_attributes;

-- Case 1.3
-- update enforce_object_list to false with entire schema in object list
exec DBMS_CLOUD_AI.set_attribute('ENFORCED_PROFILE1', 'enforce_object_list', 'false');
exec DBMS_CLOUD_AI.set_attribute('ENFORCED_PROFILE1', 'object_list', '{"owner": "LARGE_SCHEMA1"}');
select ai list the tables in LARGE_SCHEMA1;
SELECT AI SHOWPROMPT remove enfrocing of object list and give me all the objects in LARGE_SCHEMA1;
select index_id,index_name from user_cloud_vector_index_attributes;

-- Case 1.4
exec DBMS_CLOUD_AI.set_attribute('ENFORCED_PROFILE1', 'object_list_mode', 'all');  
