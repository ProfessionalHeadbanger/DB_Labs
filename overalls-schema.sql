CREATE TABLE IF NOT EXISTS Overalls (
	overall_id serial NOT NULL,
	overall_type VARCHAR(255) NOT NULL,
	wear_period TIME NOT NULL,
	overall_cost DECIMAL NOT NULL,
	CONSTRAINT Overalls_pk PRIMARY KEY (overall_id)
) WITH (
  OIDS=FALSE
);  
COMMENT ON TABLE Overalls IS "����������"
COMMENT ON COLUMN Overalls.overall_id IS "������������� ����������"
COMMENT ON COLUMN Overalls.overall_type IS "��� ����������"
COMMENT ON COLUMN Overalls.wear_period IS "���� �����"
COMMENT ON COLUMN Overalls.overall_cost IS "��������� ����������"


CREATE TABLE IF NOT EXISTS Shops (
	shop_id serial NOT NULL,
	shop_name VARCHAR(255) NOT NULL UNIQUE,
	shop_boss_name VARCHAR(255) NOT NULL UNIQUE,
	shop_boss_id integer NOT NULL,
	CONSTRAINT Shops_pk PRIMARY KEY (shop_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE Shops IS "����"
COMMENT ON COLUMN Shops.shop_id IS "������������� ����"
COMMENT ON COLUMN Shops.shop_name IS "�������� ����"
COMMENT ON COLUMN Shops.boss_name IS "��� ���������� ����"
COMMENT ON COLUMN Shops.boss_id IS "������������� ���������� ����"



CREATE TABLE IF NOT EXISTS Workers (
	worker_id serial NOT NULL,
	worker_name VARCHAR(255) NOT NULL,
	worker_position VARCHAR(255) NOT NULL,
	overall_discount DECIMAL,
	shop_id integer NOT NULL,
	CONSTRAINT Workers_pk PRIMARY KEY (worker_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE Workers IS "���������"
COMMENT ON COLUMN Workers.worker_id IS "������������� ���������"
COMMENT ON COLUMN Workers.worker_name IS "��� ���������"
COMMENT ON COLUMN Workers.worker_position IS "���������"
COMMENT ON COLUMN Workers.overall_discount IS "������ �� ����������"
COMMENT ON COLUMN Workers.shop_id IS "����� ����"



CREATE TABLE IF NOT EXISTS Obtaining (
	obtaining_id integer NOT NULL,
	worker_id integer NOT NULL,
	overall_id integer NOT NULL,
	obtaining_date DATE NOT NULL,
	obtaining_sign VARCHAR(255) NOT NULL,
	CONSTRAINT Obtaining_pk PRIMARY KEY (obtaining_id)
) WITH (
  OIDS=FALSE
);
COMMENT ON TABLE Obtaining IS "���������"
COMMENT ON COLUMN Obtaining.obtaining_id IS "������������� ���������"
COMMENT ON COLUMN Obtaining.worker_id IS "������������� ���������"
COMMENT ON COLUMN Obtaining.overall_id IS "������������� ����������"
COMMENT ON COLUMN Obtaining.obtaining_date IS "���� ���������"
COMMENT ON COLUMN Obtaining.obtaining_sign IS "�������"




ALTER TABLE Shops 
	ADD CONSTRAINT Shops_fk_boss_id FOREIGN KEY (shop_boss_id) 
	REFERENCES Workers(worker_id)
	ON UPDATE SET NULL ON DELETE CASCADE;

ALTER TABLE Workers 
	ADD CONSTRAINT Workers_fk_shop_id FOREIGN KEY (shop_id) 
	REFERENCES Shops(shop_id)
	ON UPDATE SET NULL ON DELETE CASCADE;

ALTER TABLE Obtaining 
	ADD CONSTRAINT Obtaining_fk_worker_id FOREIGN KEY (worker_id) 
	REFERENCES Workers(worker_id)
	ON UPDATE SET NULL ON DELETE CASCADE;
ALTER TABLE Obtaining 
	ADD CONSTRAINT Obtaining_fk1 FOREIGN KEY (overall_id) 
	REFERENCES Overalls(overall_id)
	ON UPDATE SET NULL ON DELETE CASCADE;





