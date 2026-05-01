--attivazione estensione che consente di creare gli uid
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--creazione tabelle anagrafiche
CREATE TABLE organization (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	name varchar(150) NOT NULL,
	description varchar(150) NOT NULL,
	sector varchar(100) NOT NULL,
	size varchar(36) NULL,
	nis2_category varchar(50) NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT organization_pk PRIMARY KEY (id)
);

CREATE TABLE organization_location (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_id uuid NOT NULL,
	active bool DEFAULT true NOT NULL,
	address varchar(300) NULL,
	civic_number varchar(20) NULL,
	postal_code varchar(10) NULL,
	city_name varchar(70) NOT NULL,
	district_name varchar(2) NULL,
	state_name varchar(50) NULL,
	country_name varchar(50) NOT NULL,		
	main bool DEFAULT false NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT organization_location_pk PRIMARY KEY (id),
	CONSTRAINT organization_fk FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_location_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_location_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT organization_location_contact_pk PRIMARY KEY (id),
	CONSTRAINT organization_location_fk FOREIGN KEY (organization_location_id) REFERENCES organization_location(id)
);

CREATE TABLE service (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_id uuid NOT NULL,
	name varchar(50) NOT NULL,
	description  varchar(100)  NULL,
	critical bool DEFAULT false NOT NULL,
	confidentiality_impact INTEGER CHECK (confidentiality_impact BETWEEN 1 AND 5),
	integrity_impact INTEGER CHECK (integrity_impact BETWEEN 1 AND 5),	
	availability_impact INTEGER CHECK (availability_impact BETWEEN 1 AND 5),
	business_impact INTEGER CHECK (business_impact BETWEEN 1 AND 5),	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT service_pk PRIMARY KEY (id),
	CONSTRAINT organization_fk FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE person (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	family varchar(50) NOT NULL,
	given  varchar(50) NOT NULL,
	fiscal_code varchar(16)  NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT person_pk PRIMARY KEY (id)
);

CREATE TABLE person_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	person_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT person_contact_pk PRIMARY KEY (id),
	CONSTRAINT person_fk FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE practitioner_role (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	person_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	role varchar(100) NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT practitioner_role_pk PRIMARY KEY (id),
	CONSTRAINT person_fk FOREIGN KEY (person_id) REFERENCES person(id),
	CONSTRAINT organization_fk FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE supplier (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(100) NULL,
	critical bool DEFAULT false NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT supplier_pk PRIMARY KEY (id)
);

CREATE TABLE supplier_location (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_id uuid NOT NULL,
	address varchar(300) NULL,
	civic_number varchar(20) NULL,
	postal_code varchar(10) NULL,
	city_name varchar(70) NOT NULL,
	district_name varchar(2) NULL,
	state_name varchar(50) NULL,
	country_name varchar(50) NOT NULL,		
	main bool DEFAULT false NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT supplier_location_pk PRIMARY KEY (id),
	CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE supplier_location_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_location_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT supplier_location_contact_pk PRIMARY KEY (id),
	CONSTRAINT supplier_location_fk FOREIGN KEY (supplier_location_id) REFERENCES supplier_location(id)
);

CREATE TABLE supplier_practitioner_role (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	person_id uuid NOT NULL,
	supplier_id uuid NOT NULL,
	role varchar(100) NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT supplier_practitioner_role_pk PRIMARY KEY (id),
	CONSTRAINT person_fk FOREIGN KEY (person_id) REFERENCES person(id),
	CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE asset (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_id uuid NOT NULL,
	name varchar(50) NOT NULL,
	description  varchar(100)  NULL,
	type varchar(50) NOT NULL,
	category varchar(50) NOT NULL,
	critical_level INTEGER CHECK (critical_level BETWEEN 1 AND 5),
	healt_Data bool DEFAULT false NOT NULL,	
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT asset_pk PRIMARY KEY (id),
	CONSTRAINT organization_fk FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE asset_detail (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_id uuid NOT NULL,
	person_id uuid NOT NULL,
	serial_number varchar(50) NOT NULL,
	date_start timestamp DEFAULT now() NOT NULL,
	date_dismiss timestamp,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT asset_detail_pk PRIMARY KEY (id),
	CONSTRAINT asset_fk FOREIGN KEY (asset_id) REFERENCES asset(id),
	CONSTRAINT person_fk FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE asset_association (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_id_master uuid NOT NULL,
	asset_id_parent uuid NOT NULL,
	date_start timestamp DEFAULT now() NOT NULL,
	date_dismiss timestamp,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT asset_association_pk PRIMARY KEY (id),
	CONSTRAINT asset_master_fk FOREIGN KEY (asset_id_master) REFERENCES asset(id),
	CONSTRAINT asset_parent_fk FOREIGN KEY (asset_id_parent) REFERENCES asset(id)
);
--creazione tabelle relazionali
CREATE TABLE asset_service (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_id uuid NOT NULL,
	service_id uuid NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT asset_service_pk PRIMARY KEY (id),
	CONSTRAINT asset_fk FOREIGN KEY (asset_id) REFERENCES asset(id),
	CONSTRAINT service_fk FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE asset_supplier (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_id uuid NOT NULL,
	supplier_id uuid NOT NULL,
	"version" int4 DEFAULT 1 NOT NULL,
	date_ins timestamp DEFAULT now() NOT NULL,
	date_upd timestamp DEFAULT now() NOT NULL,
	CONSTRAINT asset_supplier_pk PRIMARY KEY (id),
	CONSTRAINT asset_fk FOREIGN KEY (asset_id) REFERENCES asset(id),
	CONSTRAINT supplier_fk FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

--creazione tabelle versioning
CREATE TABLE ver_organization (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_id uuid NOT NULL,
	name varchar(150) NOT NULL,
	description varchar(150) NOT NULL,
	sector varchar(100) NOT NULL,
	size varchar(36) NULL,
	nis2_category varchar(50) NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_organization_pk PRIMARY KEY (id)
);

CREATE TABLE ver_organization_location (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_location_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	active bool DEFAULT true NOT NULL,
	address varchar(300) NULL,
	civic_number varchar(20) NULL,
	postal_code varchar(10) NULL,
	city_name varchar(70) NOT NULL,
	district_name varchar(2) NULL,
	state_name varchar(50) NULL,
	country_name varchar(50) NOT NULL,		
	main bool DEFAULT false NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_organization_location_pk PRIMARY KEY (id)
);

CREATE TABLE ver_organization_location_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	organization_location_contact_id uuid NOT NULL,
	organization_location_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_organization_location_contact_pk PRIMARY KEY (id)
);

CREATE TABLE ver_service (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	service_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	name varchar(50) NOT NULL,
	description  varchar(100)  NULL,
	critical bool DEFAULT false NOT NULL,
	confidentiality_impact INTEGER CHECK (confidentiality_impact BETWEEN 1 AND 5),
	integrity_impact INTEGER CHECK (integrity_impact BETWEEN 1 AND 5),	
	availability_impact INTEGER CHECK (availability_impact BETWEEN 1 AND 5),
	business_impact INTEGER CHECK (business_impact BETWEEN 1 AND 5),	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_service_pk PRIMARY KEY (id)
);

CREATE TABLE ver_person (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	person_id uuid NOT NULL,
	family varchar(50) NOT NULL,
	given  varchar(50) NOT NULL,
	fiscal_code varchar(16)  NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_person_pk PRIMARY KEY (id)
);

CREATE TABLE ver_person_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	person_contact_id uuid NOT NULL,
	person_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_person_contact_pk PRIMARY KEY (id)
);

CREATE TABLE ver_practitioner_role (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	practitioner_id uuid NOT NULL,
	person_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	role varchar(100) NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_practitioner_role_pk PRIMARY KEY (id)
);

CREATE TABLE ver_supplier (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_id uuid NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(100) NULL,
	critical bool DEFAULT false NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_supplier_pk PRIMARY KEY (id)
);

CREATE TABLE ver_supplier_location (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_location_id uuid NOT NULL,
	supplier_id uuid NOT NULL,
	address varchar(300) NULL,
	civic_number varchar(20) NULL,
	postal_code varchar(10) NULL,
	city_name varchar(70) NOT NULL,
	district_name varchar(2) NULL,
	state_name varchar(50) NULL,
	country_name varchar(50) NOT NULL,		
	main bool DEFAULT false NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_supplier_location_pk PRIMARY KEY (id)
);

CREATE TABLE ver_supplier_location_contact (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_location_contact_id uuid NOT NULL,
	supplier_location_id uuid NOT NULL,
	type varchar(30) NOT NULL,
	contact varchar(100) NOT NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_supplier_location_contact_pk PRIMARY KEY (id)
);

CREATE TABLE ver_supplier_practitioner_role (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	supplier_practitioner_id uuid NOT NULL,
	person_id uuid NOT NULL,
	supplier_id uuid NOT NULL,
	role varchar(100) NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_supplier_practitioner_role_pk PRIMARY KEY (id)
);

CREATE TABLE ver_asset (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	name varchar(50) NOT NULL,
	description  varchar(100)  NULL,
	type varchar(50) NOT NULL,
	category varchar(50) NOT NULL,
	critical_level INTEGER CHECK (critical_level BETWEEN 1 AND 5),
	healt_Data bool DEFAULT false NOT NULL,	
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_asset_pk PRIMARY KEY (id)
);
CREATE TABLE ver_asset_detail (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_detail_id uuid NOT NULL,
	asset_id uuid NOT NULL,
	person_id uuid NOT NULL,
	serial_number varchar(50) NOT NULL,
	date_Start timestamp DEFAULT now() NOT NULL,
	date_dismiss timestamp,
	"version" int4 DEFAULT 1 NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp  NOT NULL,
	CONSTRAINT ver_asset_detail_pk PRIMARY KEY (id)
);

CREATE TABLE ver_asset_association (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_association_id uuid NOT NULL,
	asset_id_master uuid NOT NULL,
	asset_id_parent uuid NOT NULL,
	date_start timestamp DEFAULT now() NOT NULL,
	date_dismiss timestamp,
	"version" int4 DEFAULT 1 NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp  NOT NULL,
	CONSTRAINT ver_asset_association_pk PRIMARY KEY (id)
);


CREATE TABLE ver_asset_service (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_service_id uuid NOT NULL,
	asset_id uuid NOT NULL,
	service_id uuid NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_asset_service_pk PRIMARY KEY (id)
);

CREATE TABLE ver_asset_supplier (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	asset_supplier_id uuid NOT NULL,
	asset_id uuid NOT NULL,
	supplier_id uuid NOT NULL,
	"version" int4  NOT NULL,
	date_from timestamp NOT NULL,
	date_to timestamp NOT NULL,
	CONSTRAINT ver_asset_supplier_pk PRIMARY KEY (id)
);

--creazione tabella audit
CREATE TABLE audit (
	id uuid DEFAULT uuid_generate_v1() NOT NULL,
	table_name varchar(50) NOT NULL,
	record_id uuid NOT NULL,
	operation varchar(50) NOT NULL,
	old_data JSON,
	new_data JSON,
	date_ins TIMESTAMP DEFAULT now(),
	change_by varchar(100) NULL,
	CONSTRAINT audit_pk PRIMARY KEY (id)
);