CREATE TABLE person (
p_id INTEGER,
p_name TEXT,
p_address TEXT,
p_phone TEXT,
p_insurer TEXT,
CONSTRAINT person_p_id_PK PRIMARY KEY (p_id)
);

CREATE TABLE service (
s_id INTEGER,
s_name TEXT,
s_costperunit NUMBER,
s_minsperunit NUMBER,
CONSTRAINT service_s_id_PK PRIMARY KEY (s_id)
);

CREATE TABLE appointment (
a_id INTEGER,
a_date DATE,
a_starttime DATE,
a_p_id INTEGER,
CONSTRAINT appointment_a_id_PK PRIMARY KEY (a_id), 
CONSTRAINT appointment_a_p_id_FK FOREIGN KEY (a_p_id)
  REFERENCES person (p_id)
);

CREATE TABLE app_svc (
as_id INTEGER,
as_quantity INTEGER,
as_a_id INTEGER,
as_s_id INTEGER,
CONSTRAINT app_svc_as_id_PK PRIMARY KEY (as_id), 
CONSTRAINT app_svc_as_a_id_FK FOREIGN KEY (as_a_id)
 REFERENCES appointment (a_id),
CONSTRAINT app_svc_as_s_id_FK FOREIGN KEY (as_s_id)
 REFERENCES service (s_id)
);
