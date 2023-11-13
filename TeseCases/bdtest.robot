*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem

Suite Setup       Connect To Database      pymysql     ${DBname}   ${DBuser}   ${DBpass}   ${DBhost}   ${DBport}
Suite Teardown    Disconnect From Database

*** Variables ***
${DBname}     ansdb1
${DBuser}     root
${DBpass}     rootansali
${DBhost}     127.0.0.1
${DBport}     3306

*** Test Cases ***

Create Person Table

      [Tags]    create_table
      ${output}=      execute sql string    Create table person(id integer,first_name varchar(20),last_name varchar(20));
      log to console    ${output}
      should be equal as strings     ${output}      None
#Insertion Data in Table
      #for single record uploading in table
   #   ${output}=      execute sql string    Insert into person values(37,"Ans","Ishtiaq")

   #for multiple record

   #   ${output}=      execute sql script        ./My_DB_data/db_person.Sql
    #  log to console    ${output}
     # should be equal as strings     ${output}      None
#Upadate record from person table
   #   ${output}=         execute sql script      ./My_DB_data/update1.Sql
    #  log to console    ${output}
    #  should be equal as strings     ${output}      None

check Ali record present in table
    [Tags]    db_valid
    check if exists in database    select * FROM ansdb1.person where first_name="Ali";

check bhatti record not present in table
    [Tags]    db_valid
    check if not exists in database    select * FROM ansdb1.person where first_name="Bhattii";

check particluar table present in my DB
    [Tags]    db_valid
    table must exist    person

verify row count is zero
    [Tags]    db_valid
    row count is 0      select * FROM ansdb1.person where first_name="xyz";

verify row count EQUALL to some value
    [Tags]    db_valid
    #row count is value that present in table and x is the number in right side
    row count is equal to x    select * from ansdb1.person where first_name="MOM"      1

verify row count GREATER to some value
    [Tags]    db_valid
    row count is greater than x    select * from ansdb1.person where first_name="Ariyan"        0

verify row count LESS to some value
    [Tags]    db_valid
    row count is less than x   select * from ansdb1.person where first_name="Ariyan"    2

Retrieve records from table
    [Tags]    longmany
    @{query_result}=        query    select * from ansdb1.person;
    log many    many  @{query_result}        #print in log report file
#Delete table from db
 #   ${output}=        execute sql string    Delete from ansdb1.new_for_robot;
  #  should be equal as strings    ${output}     None
Delete ans from table
    [Tags]    delete
    ${output}=        execute sql string    Delete from ansdb1.person where first_name="Ans";
    should be equal as strings    ${output}     None