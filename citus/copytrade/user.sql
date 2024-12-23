DELETE FROM system_parameters.business_tables 
    WHERE table_name='user';
INSERT INTO system_parameters.business_tables (table_name, table_label, description) 
    VALUES ('user', 'user', 'user');
DELETE FROM system_parameters.business_fields 
    WHERE table_id in (SELECT table_id FROM system_parameters.business_tables WHERE table_name='user');
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description, is_primary_key)
        SELECT table_id, 'user_id','SERIAL', 'user_id', true FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'username','VARCHAR(255)', 'username' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'email','VARCHAR(255)', 'email' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'password_hash','VARCHAR(255)', 'password_hash' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'created_at','TIMESTAMP', 'created_at' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'updated_at','TIMESTAMP', 'updated_at' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'full_name','VARCHAR(200)', 'full_name' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'phone','VARCHAR(15)', 'phone' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'status','VARCHAR(20)', 'status' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'date_of_birth','DATE', 'date_of_birth' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'gender','VARCHAR(10)', 'gender' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'address','TEXT', 'address' FROM system_parameters.business_tables WHERE table_name='user' ;
INSERT INTO system_parameters.business_fields(
        table_id, field_name, field_type, description)
        SELECT table_id, 'user_type','VARCHAR(20)', 'Loại người dùng (leader, follower)' FROM system_parameters.business_tables WHERE table_name='user' ;