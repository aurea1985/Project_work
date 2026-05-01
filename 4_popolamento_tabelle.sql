-- popolazione tabelle
INSERT INTO organization(name, description, sector, size, nis2_category) VALUES ('Century s.r.l.', 'Software per MMG','Sanitario', 'medium', 'importante');
INSERT INTO organization_location(organization_id, active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main ) VALUES ((select id from organization where name = 'Century s.r.l.'),true, 'via Roma', '10','83100','Napoli','NA','Campania','Italia', true);
INSERT INTO organization_location(organization_id, active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main ) VALUES ((select id from organization where name = 'Century s.r.l.'),true, 'via Appia', '26','83042','Atripalda','AV','Campania','Italia', false);
INSERT INTO organization_location(organization_id, active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main ) VALUES ((select id from organization where name = 'Century s.r.l.'),true, 'via Piave', '125','00042','Roma','RM','Lazio','Italia', false);
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'NA' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'email','napoli@century,it');
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'NA' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'phone','081081081');
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'AV' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'email','avellino@century,it');
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'AV' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'phone','082508250825');
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'RM' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'email','roma@century,it');
INSERT INTO organization_location_contact(organization_location_id, type, contact) VALUES ((select id from organization_location where district_name = 'RM' and organization_id in (select id from organization where name = 'Century s.r.l.')), 'phone','06060606');
INSERT INTO service(organization_id, name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact) VALUES ((select id from organization where name = 'Century s.r.l.'),'Cartella Clinica', 'Gestione pazienti e prescrizioni', true, 5, 5, 5, 5);
INSERT INTO service(organization_id, name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact) VALUES ((select id from organization where name = 'Century s.r.l.'),'Televisita', 'Visite online', true, 5, 5, 5, 5);
INSERT INTO service(organization_id, name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact) VALUES ((select id from organization where name = 'Century s.r.l.'),'Agenda', 'Agenda appuntamenti', true, 4, 5, 5, 4);
INSERT INTO person(family, given, fiscal_code) VALUES ('ROSSI','ANNA','RRRAAA11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('BIANCHI','STEFANO','BBBSSS11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('VERDI','MICHELE','VVVMMM11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('VIOLA','ANTONIO','VVVAAA11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('CELESTE','GIULIA','CCCGGG11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('BLU','ALESSIA','BBBAAA11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('ROSSETTI','FRANCESCO','RRRFFF11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('NERO','SARA','NNNSSS11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('GRIGIO','MARTINA','GGGMMM11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('BRUNO','LUIGI','BBBLLL11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('CIPOLLETTA','ANNA','CCCAAA11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('CONA','NUNZIA','CCCNNN11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('GUERRIERO','PIERO','GGGPPP11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('PRIZIO','PAOLO','PPPPPP11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('GRANDI','ZAIRA','GGGZZZ11A22A123A');
INSERT INTO person(family, given, fiscal_code) VALUES ('MARINO','GABRIELE','MMMGGG11A22A123A');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),'email', 'anna.rossi@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),'phone', '34011111111');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),'pec', 'anna.rossi@pec.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'BBBSSS11A22A123A'),'email', 'stefano.bianchi@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'BBBSSS11A22A123A'),'phone', '3402222222');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'VVVMMM11A22A123A'),'email', 'michele.verdi@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'VVVMMM11A22A123A'),'phone', '328456894');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'VVVAAA11A22A123A'),'email', 'antonio.viola@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'VVVAAA11A22A123A'),'phone', '0825626262');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCGGG11A22A123A'),'email', 'giulia.celeste@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCGGG11A22A123A'),'phone', '365888888');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRFFF11A22A123A'),'email', 'francesco.rossetti@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'RRRFFF11A22A123A'),'phone', '357894578');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'NNNSSS11A22A123A'),'email', 'sara.nero@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'NNNSSS11A22A123A'),'phone', '578787878');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGMMM11A22A123A'),'email', 'martina.grigio@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGMMM11A22A123A'),'phone', '325787878');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'BBBLLL11A22A123A'),'email', 'luigi.bruno@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'BBBLLL11A22A123A'),'phone', '154154154');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCAAA11A22A123A'),'email', 'anna.cipolletta@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCAAA11A22A123A'),'phone', '52525252');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCNNN11A22A123A'),'email', 'nunzia.cona@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'CCCNNN11A22A123A'),'phone', '45454545');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGPPP11A22A123A'),'email', 'piero.guerriero@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGPPP11A22A123A'),'phone', '5254824558');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'PPPPPP11A22A123A'),'email', 'paolo.prizio@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'PPPPPP11A22A123A'),'phone', '896896896');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGZZZ11A22A123A'),'email', 'zaira.grandi@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'GGGZZZ11A22A123A'),'phone', '989656323');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'MMMGGG11A22A123A'),'email', 'gabriele.marino@email.it');
INSERT INTO person_contact(person_id, type, contact)VALUES ((select id from person where fiscal_code = 'MMMGGG11A22A123A'),'phone', '340340340');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'RRRAAA11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'CDA');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'BBBSSS11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'CISO');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'BBBSSS11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'Risk Manager');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'BBBSSS11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'coordinamento CSIRT');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'VVVMMM11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'IT/DevOps');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'VVVMMM11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'operativo CSIRT');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'VVVAAA11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'Product Owner');
INSERT INTO practitioner_role(person_id, organization_id, role) VALUES ((select id from person where fiscal_code = 'GGGPPP11A22A123A'),(select id from organization where name = 'Century s.r.l.'),'segretaria amministrativa');
INSERT INTO supplier (name, description, critical) VALUES ('CloudNow', 'Cloud provider infrastruttura', true);
INSERT INTO supplier (name, description, critical) VALUES ('Auth0', 'Identity provider e autenticazione', true);
INSERT INTO supplier (name, description, critical) VALUES ('CrowdStrike', 'Antivirus', true);
INSERT INTO supplier (name, description, critical) VALUES ('Fastweb Business', 'ConnettivitÃ  internet aziendale', true);
INSERT INTO supplier (name, description, critical) VALUES ('Veeam', 'Backup e disaster recovery', true);
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'CloudNow'), 'via Roma', '20','83100','Napoli','NA','Campania','Italia', true);
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'Auth0'), 'via dei glicini', '125','00030','Roma','RM','Lazio','Italia', true);
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'CrowdStrike'), 'via di collodi', '33','50100','Firenze','FI','Toscana','Italia', true);
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'Fastweb Business'), 'via serroni', '10','40100','Bologna','BO','Emilia Romagna','Italia', true);
INSERT INTO supplier_location(supplier_id, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main) VALUES ((select id from supplier where name = 'Veeam'), 'via Nappi', '37','38121','Trento','TN','Trentino Alto Adige','Italia', true);
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'CloudNow')), 'email', 'info@cloudnow.it');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Auth0')), 'email', 'info@auth0.it');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'CrowdStrike')), 'email', 'info@crowdstrike.it');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Fastweb Business')), 'email', 'info@fastweb.it');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Veeam')), 'email', 'info@veeam.it');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'CloudNow')), 'phone', '1111111111');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Auth0')), 'phone', '22222222222');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'CrowdStrike')), 'phone', '33333333333');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Fastweb Business')), 'phone', '44444444444');
INSERT INTO supplier_location_contact(supplier_location_id, type, contact) VALUES ((select id from supplier_location where supplier_id in (select id from supplier where name = 'Veeam')), 'phone', '5555555555');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCGGG11A22A123A'),(select id from supplier where name = 'CloudNow'),'support_24x7');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'BBBAAA11A22A123A'),(select id from supplier where name = 'CloudNow'),'cloud_support');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'RRRFFF11A22A123A'),(select id from supplier where name = 'CloudNow'),'incident_response');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'NNNSSS11A22A123A'),(select id from supplier where name = 'CloudNow'),'account_manager');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'GGGMMM11A22A123A'),(select id from supplier where name = 'Auth0'),'support_24x7');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'GGGMMM11A22A123A'),(select id from supplier where name = 'Auth0'),'security_incident');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCAAA11A22A123A'),(select id from supplier where name = 'Auth0'),'technical_account_manager');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'BBBLLL11A22A123A'),(select id from supplier where name = 'CrowdStrike'),'soc');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'PPPPPP11A22A123A'),(select id from supplier where name = 'CrowdStrike'),'security_incident');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'PPPPPP11A22A123A'),(select id from supplier where name = 'CrowdStrike'),'support_24x7');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'GGGZZZ11A22A123A'),(select id from supplier where name = 'Fastweb Business'),'network_operations_center');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'GGGZZZ11A22A123A'),(select id from supplier where name = 'Fastweb Business'),'support_24x7');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'MMMGGG11A22A123A'),(select id from supplier where name = 'Fastweb Business'),'account_manager');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCNNN11A22A123A'),(select id from supplier where name = 'Veeam'),'support_24x7');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCNNN11A22A123A'),(select id from supplier where name = 'Veeam'),'backup_support');
INSERT INTO supplier_practitioner_role(person_id, supplier_id, role) VALUES ((select id from person where fiscal_code = 'CCCNNN11A22A123A'),(select id from supplier where name = 'Veeam'),'incident_response');
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'VM Produzione', 'Server cloud applicativo', 'Infrastruttura', 'supplier_service', 5, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Database Pazienti', 'DB clinico PostgreSQL', 'Database', 'supplier_service', 5, true);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Sistema Autenticazione', 'Auth0 IAM', 'Security', 'software', 5, true);    
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Endpoint Protection', 'CrowdStrike agent', 'Security', 'software', 4, false);    
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Linea Internet', 'Connessione Fastweb', 'Network', 'supplier_service', 5, false);    
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'VPN', 'VPN gateway', 'Network', 'supplier_service', 5, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Sistema Backup', 'Backup Veeam', 'Security', 'software', 5, true);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Server Edge Locale', 'Server fisico per caching e servizi locali', 'server', 'hardware', 4, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'NAS Backup Locale', 'Storage locale per backup secondario', 'NAS', 'hardware', 5, true);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Router Primario', 'Router per connettivitÃ  internet', 'router', 'hardware', 5, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'UPS Sala Server', 'Gruppo di continuitÃ  elettrica', 'UPS', 'hardware', 5, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'PC Amministrativo', 'Postazione segreteria', 'PC', 'hardware', 3, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Laptop IT', 'Laptop amministratore di sistema', 'PC', 'hardware', 4, true);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Laptop CDA', 'Laptop operativo', 'PC', 'hardware', 3, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Laptop PO', 'Laptop operativo', 'PC', 'hardware', 5, false);
INSERT INTO asset(organization_id, name, description, type, category, critical_level, healt_data) VALUES ((select id from organization where name = 'Century s.r.l.'),'Antivirus', 'Antivirus', 'Security', 'software', 2, false);
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Sistema Autenticazione'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'SWR-001','2025-06-10');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Endpoint Protection'),(select id from person where fiscal_code = 'BBBSSS11A22A123A'),'SWR-002','2022-05-23');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Sistema Backup'),(select id from person where fiscal_code = 'BBBSSS11A22A123A'),'SWR-003','2021-04-04');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Server Edge Locale'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'HWR-001','2026-03-06');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'NAS Backup Locale'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'HWR-002','2024-02-07');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Router Primario'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'HWR-003','2022-01-15');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'UPS Sala Server'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'HWR-004','2020-12-26');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'PC Amministrativo'),(select id from person where fiscal_code = 'GGGPPP11A22A123A'),'PC-001','2021-11-30');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Laptop IT'),(select id from person where fiscal_code = 'VVVMMM11A22A123A'),'LPT-001','2023-10-10');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Laptop CDA'),(select id from person where fiscal_code = 'RRRAAA11A22A123A'),'LPT-002','2024-09-08');
INSERT INTO asset_detail(asset_id, person_id, serial_number, date_start)	VALUES ((select id from asset where name = 'Laptop PO'),(select id from person where fiscal_code = 'VVVAAA11A22A123A'),'LPT-003','2025-08-16');
INSERT INTO asset_association(asset_id_master, asset_id_parent, date_start)	VALUES ((select id from asset where name = 'Laptop PO'),(select id from asset where name = 'Antivirus'),'2025-08-02');
INSERT INTO asset_association(asset_id_master, asset_id_parent, date_start)	VALUES ((select id from asset where name = 'Laptop CDA'),(select id from asset where name = 'Antivirus'),'2025-08-03');
INSERT INTO asset_association(asset_id_master, asset_id_parent, date_start)	VALUES ((select id from asset where name = 'Laptop IT'),(select id from asset where name = 'Antivirus'),'2025-08-04');
INSERT INTO asset_association(asset_id_master, asset_id_parent, date_start)	VALUES ((select id from asset where name = 'PC Amministrativo'),(select id from asset where name = 'Antivirus'),'2025-08-05');
-- VM Produzione -> tutti i servizi
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'VM Produzione';
-- Database Pazienti -> Cartella Clinica
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'Database Pazienti'
AND s.name = 'Cartella Clinica';
-- Sistema Autenticazione -> tutti i servizi
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'Sistema Autenticazione';
-- Endpoint Protection -> tutti i servizi
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'Endpoint Protection';
-- Linea Internet -> tutti i servizi
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'Linea Internet';
-- VPN -> tutti i servizi
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'VPN';
-- Sistema Backup -> Cartella Clinica
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'Sistema Backup'
AND s.name = 'Cartella Clinica';
-- NAS Backup Locale -> Cartella Clinica
INSERT INTO asset_service (asset_id, service_id)
SELECT a.id, s.id
FROM asset a, service s
WHERE a.name = 'NAS Backup Locale'
AND s.name = 'Cartella Clinica';
-- VM Produzione -> CloudNow
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'VM Produzione'
AND s.name = 'CloudNow';
-- Database Pazienti -> CloudNow
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Database Pazienti'
AND s.name = 'CloudNow';
-- Sistema Autenticazione -> Auth0
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Sistema Autenticazione'
AND s.name = 'Auth0';
-- Endpoint Protection -> CrowdStrike
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Endpoint Protection'
AND s.name = 'CrowdStrike';
-- Antivirus -> CrowdStrike
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Antivirus'
AND s.name = 'CrowdStrike';
-- Linea Internet -> Fastweb
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Linea Internet'
AND s.name = 'Fastweb Business';
-- VPN -> Fastweb
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'VPN'
AND s.name = 'Fastweb Business';
-- Sistema Backup -> Veeam
INSERT INTO asset_supplier (asset_id, supplier_id)
SELECT a.id, s.id
FROM asset a, supplier s
WHERE a.name = 'Sistema Backup'
AND s.name = 'Veeam';