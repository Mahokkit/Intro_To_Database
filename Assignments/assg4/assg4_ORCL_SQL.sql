CREATE USER edma
IDENTIFIED BY w0057568
DEFAULT TABLESPACE users;

GRANT DBA TO edma;

CREATE USER dentaloffice
IDENTIFIED BY dentaloffice
DEFAULT TABLESPACE users;

GRANT CONNECT,RESOURCE TO dentaloffice;

CONNECT dentaloffice/dentaloffice

DROP TABLE app_svc CASCADE CONSTRAINTS;
DROP TABLE appointment CASCADE CONSTRAINTS;
DROP TABLE service CASCADE CONSTRAINTS;
DROP TABLE person CASCADE CONSTRAINTS;

CREATE TABLE person (
p_id INTEGER(4),
p_name VARCHAR2(20),
p_address VARCHAR2(40),
p_phone CHAR(10),
p_insurer VARCHAR2(20),
CONSTRAINT person_p_id_PK PRIMARY KEY (p_id));

CREATE TABLE service (
s_id INTEGER(4),
s_name VARCHAR2(10),
s_costperunit INTEGER(6),
s_minsperunit INTEGER(6),
CONSTRAINT service_s_id_PK PRIMARY KEY (s_id));

CREATE TABLE appointment (
a_id INTEGER(4),
a_date DATE,
a_starttime DATE,
a_p_id INTEGER(4),
CONSTRAINT appointment_a_id_PK PRIMARY KEY (a_id), 
CONSTRAINT appointment_a_p_id_FK FOREIGN KEY (a_p_id) REFERENCES person (p_id));

CREATE TABLE app_svc (
as_id INTEGER(4),
as_quantity INTEGER(4),
as_a_id INTEGER(4),
as_s_id INTEGER(4),
CONSTRAINT app_svc_as_id_PK PRIMARY KEY (as_id), 
CONSTRAINT app_svc_as_a_id_FK FOREIGN KEY (as_a_id) REFERENCES appointment (a_id),
CONSTRAINT app_svc_as_s_id_FK FOREIGN KEY (as_s_id) REFERENCES service (s_id));

COMMIT;

CONNECT edma/W0057568

REVOKE CONNECT FROM dentaloffice;