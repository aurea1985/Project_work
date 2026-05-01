--creazione tabella di test--
drop table IF EXISTS test ;
CREATE TABLE test (
	table_name varchar(150)  ,
	record_id uuid,
	insert_tabella_madre varchar(2)  ,
	insert_audit varchar(2)  ,
	update_tabella_madre varchar(2)  ,
	update_versioning varchar(2)  ,
	update_audit varchar(2)  ,
	delete_tabella_madre varchar(2)  ,
	delete_versioning varchar(2) ,
	delete_audit varchar(2)
);

--organization--
INSERT INTO organization(name, description, sector, size, nis2_category) VALUES ('test', 'test','test', 'test', 'test');
INSERT INTO test(table_name,record_id)VALUES ('organization', (select id from organization where name = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization WHERE name = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'organization' and operation = 'INSERT' and record_id in (select id from organization where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE organization set description = 'test upgrade' where name = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization WHERE name = 'test' and description = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_organization where organization_id in (select id from organization where name = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'organization' and operation = 'UPDATE' and record_id in (select id from organization where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
DELETE from organization where name = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization WHERE name = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_organization where organization_id in (select record_id from test where table_name = 'organization') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'organization' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'organization')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization';

--organization_location--
INSERT INTO organization_location(organization_id, active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main ) VALUES ((select id from organization where name = 'Century s.r.l.'),true, 'test', 'test','83042','test','AV','test','test', false);
INSERT INTO test(table_name,record_id)VALUES ('organization_location', (select id from organization_location where address = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location WHERE address = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location' and operation = 'INSERT' and record_id in (select id from organization_location where address = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE organization_location set city_name = 'test upgrade' where address = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location WHERE address = 'test' and city_name = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_organization_location where organization_location_id in (select id from organization_location where address = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location' and operation = 'UPDATE' and record_id in (select id from organization_location where address = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
DELETE from organization_location where address = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location WHERE address = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_organization_location where organization_location_id in (select record_id from test where table_name = 'organization_location') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'organization_location')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location';

--organization_location_contact--
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'NA' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'test','test');
INSERT INTO test(table_name,record_id)VALUES ('organization_location_contact', (select id from organization_location_contact where type = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location_contact WHERE type = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location_contact' and operation = 'INSERT' and record_id in (select id from organization_location_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE organization_location_contact set contact = 'test upgrade' where type = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location_contact WHERE type = 'test' and contact = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_organization_location_contact where organization_location_contact_id in (select id from organization_location_contact where type = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location_contact' and operation = 'UPDATE' and record_id in (select id from organization_location_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
DELETE from organization_location_contact where type = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM organization_location_contact WHERE type = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_organization_location_contact where organization_location_contact_id in (select record_id from test where table_name = 'organization_location_contact') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'organization_location_contact' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'organization_location_contact')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='organization_location_contact';

--service--
INSERT INTO service(organization_id, name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact) VALUES ((select id from organization where name = 'Century s.r.l.'),'test', 'test', true, 5, 5, 5, 5);
INSERT INTO test(table_name,record_id)VALUES ('service', (select id from service where name = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM service WHERE name = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'service' and operation = 'INSERT' and record_id in (select id from service where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE service set description = 'test upgrade' where name = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM service WHERE name = 'test' and description = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_service where service_id in (select id from service where name = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'service' and operation = 'UPDATE' and record_id in (select id from service where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
DELETE from service where name = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM service WHERE name = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_service where service_id in (select record_id from test where table_name = 'service') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'service' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'service')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='service';

--person--
INSERT INTO person(family, given) VALUES ('test','test');
INSERT INTO test(table_name,record_id)VALUES ('person', (select id from person where family= 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person WHERE family= 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'person' and operation = 'INSERT' and record_id in (select id from person where family= 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE person set given = 'test upgrade' where family= 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person WHERE family= 'test' and given = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_person where person_id in (select id from person where family= 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'person' and operation = 'UPDATE' and record_id in (select id from person where family= 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
DELETE from person where family= 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person WHERE family= 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_person where person_id in (select record_id from test where table_name = 'person') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'person' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'person')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person';

--person_contact--
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),'test', 'test');
INSERT INTO test(table_name,record_id)VALUES ('person_contact', (select id from person_contact where type = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person_contact WHERE type = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'person_contact' and operation = 'INSERT' and record_id in (select id from person_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE person_contact set contact = 'test upgrade' where type = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person_contact WHERE type = 'test' and contact = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_person_contact where person_contact_id in (select id from person_contact where type = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'person_contact' and operation = 'UPDATE' and record_id in (select id from person_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
DELETE from person_contact where type = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM person_contact WHERE type = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_person_contact where person_contact_id in (select record_id from test where table_name = 'person_contact') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'person_contact' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'person_contact')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='person_contact';

--practitioner_role--
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'test');
INSERT INTO test(table_name,record_id)VALUES ('practitioner_role', (select id from practitioner_role where role = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM practitioner_role WHERE role = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'practitioner_role' and operation = 'INSERT' and record_id in (select id from practitioner_role where role = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE practitioner_role set role = 'test upgrade' where role = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM practitioner_role WHERE role = 'test upgrade'  and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_practitioner_role where practitioner_id in (select id from practitioner_role where role = 'test upgrade') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'practitioner_role' and operation = 'UPDATE' and record_id in (select id from practitioner_role where role = 'test upgrade')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
DELETE from practitioner_role where role = 'test upgrade';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM practitioner_role WHERE role = 'test upgrade') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_practitioner_role where practitioner_id in (select record_id from test where table_name = 'practitioner_role') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'practitioner_role' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'practitioner_role')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='practitioner_role';

--supplier--
INSERT INTO supplier (name, description, critical) VALUES ('test', 'test', true);
INSERT INTO test(table_name,record_id)VALUES ('supplier', (select id from supplier where name = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier WHERE name = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier' and operation = 'INSERT' and record_id in (select id from supplier where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE supplier set description = 'test upgrade' where name = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier WHERE name = 'test' and description = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_supplier where supplier_id in (select id from supplier where name = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier' and operation = 'UPDATE' and record_id in (select id from supplier where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
DELETE from supplier where name = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier WHERE name = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_supplier where supplier_id in (select record_id from test where table_name = 'supplier') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'supplier')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier';

--supplier_location--
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'CloudNow'), 'test', '20','83100','test','NA','test','test', true);
INSERT INTO test(table_name,record_id)VALUES ('supplier_location', (select id from supplier_location where address = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location WHERE address = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location' and operation = 'INSERT' and record_id in (select id from supplier_location where address = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE supplier_location set city_name = 'test upgrade' where address = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location WHERE address = 'test' and city_name = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_supplier_location where supplier_location_id in (select id from supplier_location where address = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location' and operation = 'UPDATE' and record_id in (select id from supplier_location where address = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
DELETE from supplier_location where address = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location WHERE address = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_supplier_location where supplier_location_id in (select record_id from test where table_name = 'supplier_location') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'supplier_location')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location';

--supplier_location_contact--
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'CloudNow')), 'test', 'test');
INSERT INTO test(table_name,record_id)VALUES ('supplier_location_contact', (select id from supplier_location_contact where type = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location_contact WHERE type = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location_contact' and operation = 'INSERT' and record_id in (select id from supplier_location_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE supplier_location_contact set contact = 'test upgrade' where type = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location_contact WHERE type = 'test' and contact = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_supplier_location_contact where supplier_location_contact_id in (select id from supplier_location_contact where type = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location_contact' and operation = 'UPDATE' and record_id in (select id from supplier_location_contact where type = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
DELETE from supplier_location_contact where type = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_location_contact WHERE type = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_supplier_location_contact where supplier_location_contact_id in (select record_id from test where table_name = 'supplier_location_contact') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_location_contact' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'supplier_location_contact')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_location_contact';

--supplier_practitioner_role--
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCGGG11A22A123A'),(select id from supplier where name = 'CloudNow'),'test');
INSERT INTO test(table_name,record_id)VALUES ('supplier_practitioner_role', (select id from supplier_practitioner_role where role = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_practitioner_role WHERE role = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_practitioner_role' and operation = 'INSERT' and record_id in (select id from supplier_practitioner_role where role = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE supplier_practitioner_role set role = 'test upgrade' where role = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_practitioner_role WHERE role = 'test upgrade'  and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_supplier_practitioner_role where supplier_practitioner_id in (select id from supplier_practitioner_role where role = 'test upgrade') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_practitioner_role' and operation = 'UPDATE' and record_id in (select id from supplier_practitioner_role where role = 'test upgrade')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
DELETE from supplier_practitioner_role where role = 'test upgrade';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM supplier_practitioner_role WHERE role = 'test upgrade') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_supplier_practitioner_role where supplier_practitioner_id in (select record_id from test where table_name = 'supplier_practitioner_role') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'supplier_practitioner_role' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'supplier_practitioner_role')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='supplier_practitioner_role';


--asset--
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'test', 'test', 'test', 'test', 5, false);
INSERT INTO test(table_name,record_id)VALUES ('asset', (select id from asset where name = 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset WHERE name = 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'asset' and operation = 'INSERT' and record_id in (select id from asset where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE asset set description = 'test upgrade' where name = 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset WHERE name = 'test' and description = 'test upgrade' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_asset where asset_id in (select id from asset where name = 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'asset' and operation = 'UPDATE' and record_id in (select id from asset where name = 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
DELETE from asset where name = 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset WHERE name = 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_asset where asset_id in (select record_id from test where table_name = 'asset') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'asset' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'asset')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset';

--asset_detail--
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Sistema Autenticazione'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'test','9999-01-01');
INSERT INTO test(table_name,record_id)VALUES ('asset_detail', (select id from asset_detail where serial_number= 'test'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_detail WHERE serial_number= 'test') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_detail' and operation = 'INSERT' and record_id in (select id from asset_detail where serial_number= 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE asset_detail set date_start= '8888-01-01 00:00:00' where serial_number= 'test';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_detail WHERE serial_number= 'test' and date_start= '8888-01-01' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_asset_detail where asset_detail_id in (select id from asset_detail where serial_number= 'test') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_detail' and operation = 'UPDATE' and record_id in (select id from asset_detail where serial_number= 'test')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
DELETE from asset_detail where serial_number= 'test';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_detail WHERE serial_number= 'test') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_asset_detail where asset_detail_id in (select record_id from test where table_name = 'asset_detail') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_detail' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'asset_detail')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_detail';

--asset_association--
INSERT INTO asset_association(asset_id_master, asset_id_parent, date_start)	VALUES ((select id from asset where name = 'Laptop PO'),(select id from asset where name = 'Antivirus'),'9999-08-02');
INSERT INTO test(table_name,record_id)VALUES ('asset_association', (select id from asset_association where date_start = '9999-08-02'));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_association WHERE date_start = '9999-08-02') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_association' and operation = 'INSERT' and record_id in (select id from asset_association where date_start = '9999-08-02')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE asset_association set date_start= '8888-01-01 00:00:00' where date_start = '9999-08-02';
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_association WHERE  date_start= '8888-01-01' and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_asset_association where asset_association_id in (select id from asset_association where date_start = '8888-01-01') and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_association' and operation = 'UPDATE' and record_id in (select id from asset_association where date_start = '8888-01-01')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
delete from asset_association where date_start= '8888-01-01 00:00:00';
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_association WHERE date_start = '8888-01-01') = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_asset_association where asset_association_id in (select record_id from test where table_name = 'asset_association') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_association' and operation = 'DELETE' and record_id in (select record_id from test where table_name = 'asset_association')) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_association';

--asset_service--
INSERT INTO asset_service(asset_id, service_id)	VALUES ((select id from asset where name = 'Laptop PO'),(select id from service where name = 'Televisita'));
INSERT INTO test(table_name,record_id)VALUES ('asset_service', (select id from asset_service where asset_id in (select id from asset where name = 'Laptop PO') and service_id in (select id from service where name = 'Televisita') ));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_service WHERE record_id = asset_service.id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_service' and operation = 'INSERT' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE asset_service set asset_id=(select id from asset where name = 'Laptop CDA') where id in (select record_id from test where table_name='asset_service');
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_service WHERE  record_id = asset_service.id and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_asset_service where asset_service_id in (select id from asset_service where record_id = asset_service.id) and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_service' and operation = 'UPDATE' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
delete from asset_service where id in (select record_id from test where table_name='asset_service');
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_service WHERE record_id = asset_service.id) = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_asset_service where asset_service_id in(select record_id from test where table_name= 'asset_service') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_service' and operation = 'DELETE' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_service';

--asset_supplier--
INSERT INTO asset_supplier(asset_id, supplier_id)	VALUES ((select id from asset where name = 'Laptop PO'),(select id from supplier where name = 'Auth0'));
INSERT INTO test(table_name,record_id)VALUES ('asset_supplier', (select id from asset_supplier where asset_id in (select id from asset where name = 'Laptop PO') and supplier_id in (select id from supplier where name = 'Auth0') ));
UPDATE test SET insert_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_supplier WHERE record_id = asset_supplier.id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE test SET insert_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_supplier' and operation = 'INSERT' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE asset_supplier set asset_id=(select id from asset where name = 'Laptop CDA') where id in (select record_id from test where table_name='asset_supplier');
UPDATE test SET update_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_supplier WHERE  record_id = asset_supplier.id and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE test SET update_versioning = CASE WHEN (select count(*) from ver_asset_supplier where asset_supplier_id in (select id from asset_supplier where record_id = asset_supplier.id) and version = '1') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE test SET update_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_supplier' and operation = 'UPDATE' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
delete from asset_supplier where id in (select record_id from test where table_name='asset_supplier');
UPDATE test SET delete_tabella_madre = CASE WHEN (SELECT COUNT(*) FROM asset_supplier WHERE record_id = asset_supplier.id) = 0 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE test SET delete_versioning = CASE WHEN (select count(*) from ver_asset_supplier where asset_supplier_id in(select record_id from test where table_name= 'asset_supplier') and version = '2') = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
UPDATE test SET delete_audit = CASE WHEN (select count(*) from audit where table_name = 'asset_supplier' and operation = 'DELETE' and audit.record_id =test.record_id) = 1 THEN 'ok' ELSE 'KO' END WHERE table_name='asset_supplier';
select * from test order by 1