--alter session set "_ORACLE_SCRIPT"=true;
create user my_user identified by my_password;
grant CONNECT, resource to my_user;
GRANT CREATE VIEW TO my_user;
ALTER USER my_user QUOTA UNLIMITED ON USERS;