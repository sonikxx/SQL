CREATE TABLE person_audit (
	 created timestamp with time zone DEFAULT current_timestamp NOT NULL,
	 type_event char(1) DEFAULT 'I' NOT NULL,
	 row_id bigint NOT NULL,
	 name varchar NOT NULL,
	 age integer DEFAULT 10 NOT NULL, 
	 gender varchar DEFAULT 'female' NOT NULL, 
	 address varchar,
	 CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
 );

CREATE FUNCTION fnc_trg_person_insert_audit() 
	 RETURNS trigger 
	 LANGUAGE PLPGSQL
	 AS $$
	 BEGIN
	 	INSERT INTO person_audit (row_id, name, age, gender, address) 
		VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
	 	RETURN NULL;
	 END;
$$;

CREATE TRIGGER6 trg_person_insert_audit 
	 AFTER INSERT
	 ON person
	 FOR EACH ROW
	 EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
SELECT * FROM person_audit;