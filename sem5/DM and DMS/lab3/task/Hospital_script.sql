-- Generated by Oracle SQL Developer Data Modeler 3.2.0.735
--   at:        2022-10-12 12:51:41 MSD
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE H_Doctor 
    ( 
     ID_DOCTOR int, 
     SURNAME VARCHAR(50), 
     FIRSTNAME VARCHAR(50), 
     MIDDLE_NAME VARCHAR(50),
     code_spec int     
     );



ALTER TABLE H_Doctor 
    ADD CONSTRAINT "Doctor PK" PRIMARY KEY ( ID_Doctor ) ;



CREATE TABLE H_Patient 
    ( 
     N_CARD int, 
     SURNAME VARCHAR(50), 
     FIRSTNAME VARCHAR(50), 
     MIDDLE_NAME VARCHAR(50), 
     ADDRESS VARCHAR(50), 
     Phone CHAR(13)
    ) 
;



ALTER TABLE H_PATIENT 
    ADD CONSTRAINT Patient_PK PRIMARY KEY ( N_CARD ) ;



CREATE TABLE H_Services 
    ( 
     CODE_SRV int, 
     TITLE VARCHAR(50), 
     Price FLOAT 
    ) 
;



ALTER TABLE H_Services 
    ADD CONSTRAINT "Services PK" PRIMARY KEY ( Code_Srv ) ;



CREATE TABLE H_Speciality 
    ( 
     CODE_SPEC int, 
     Title VARCHAR(50)
    ) 
;



ALTER TABLE H_Speciality 
    ADD CONSTRAINT "Speciality PK" PRIMARY KEY ( Code_Spec ) ;



CREATE TABLE H_Visit 
    ( 
     N_Visit int, 
     ID_Doctor int, 
     ID_Patient int, 
     DATE_VISIT DATE ,     
     CODE_SRV int     
    ) 
;



ALTER TABLE H_Visit 
    ADD CONSTRAINT "Visit PK" PRIMARY KEY ( N_Visit ) ;




ALTER TABLE H_Visit 
    ADD CONSTRAINT DOCTOR_VISIT FOREIGN KEY 
    ( ID_DOCTOR ) 
    REFERENCES H_DOCTOR 
    ( ID_Doctor ) 
;


ALTER TABLE H_Doctor 
    ADD CONSTRAINT Spec_Doctor FOREIGN KEY 
    ( 
     Code_Spec
    ) 
    REFERENCES H_Speciality 
    ( 
     Code_Spec
    ) 
;


ALTER TABLE H_Visit 
    ADD CONSTRAINT Srv_Visit FOREIGN KEY 
    ( 
     Code_Srv
    ) 
    REFERENCES H_Services 
    ( 
     Code_Srv
    ) 
;


ALTER TABLE H_Visit 
    ADD CONSTRAINT Visit_Patient FOREIGN KEY 
    ( 
     ID_Patient
    ) 
    REFERENCES H_Patient 
    ( 
     N_Card
    ) 
;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE STRUCTURED TYPE                   0
-- CREATE COLLECTION TYPE                   0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
