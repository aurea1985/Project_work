---GV.OC-04---
---elenco servizi erogati dall'organizzazione e livello di criticità---
SELECT 
    o.name AS organization,
    s.id,
    s.name AS service_name,
    s.critical,
    s.business_impact,
	s.confidentiality_impact,
	s.integrity_impact,
	s.availability_impact
FROM service s
JOIN organization o ON o.id = s.organization_id
ORDER BY s.business_impact DESC;

---GV.RR-02---
---ruoli nell'organizzazione---
select o.name as organizzazione,
r.role as ruolo,
p.family||' '||p.given as nominativo
from organization o
left join practitioner_role r on o.id = r.organization_id
left join person p on p.id = r.person_id
---ruoli nell'organizzazione e relativi contatti---
select o.name as organizzazione,
r.role as ruolo,
p.family||' '||p.given as nominativo,
c.type as tipo_contatto, c.contact as contatto
from organization o
left join practitioner_role r on o.id = r.organization_id
left join person p on p.id = r.person_id
left join person_contact c on c.person_id = p.id
order by 1, 3

---GV.SC-02---
---elenco fornitori e contatti delle sedi principali---
select s.name, s.description, s.critical,
l.address||' '||l.civic_number, l.city_name,
c.type, c.contact
from supplier s
left join supplier_location l on s.id = l.supplier_id
left join supplier_location_contact c on c.supplier_location_id = l.id
where l.main is true
order by s.name, c.type
---elenco fornitori e contatti dei referenti---
select s.name, s.description, s.critical,
r.role,
p.family||' '||p.given as referente, c.type, c.contact
from supplier s
left join supplier_practitioner_role r on s.id = r.supplier_id
left join person p on p.id = r.person_id
left join person_contact c on c.person_id = p.id
order by s.name, r.role, referente

---GV.SC-04---
---elenco fornitori e contatti dei referenti---
select s.name, s.description, s.critical,
r.role,
p.family||' '||p.given as referente, c.type, c.contact
from supplier s
left join supplier_practitioner_role r on s.id = r.supplier_id
left join person p on p.id = r.person_id
left join person_contact c on c.person_id = p.id
order by s.name, r.role, referente
---elenco fornitori con sedi e contatti---
select s.name as fornitore, s.description as descrizione, s.critical as critico,
l.main as sede_principale,
l.address||' '||l.civic_number as indirizzo,
l.city_name as città,
l.district_name as provincia,
c.type as tipo_contatto,
c.contact as contatto
from supplier s
left join supplier_location l on s.id = l.supplier_id
left join supplier_location_contact c on c.supplier_location_id = l.id
order by 1,4,5,6,7

---GV.SC-07---
--elenco asset da fornitori con relativo livello di criticità ordinato per criticità--
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
s.name as fornitore, s.critical
from asset a 
left join asset_supplier ass on a.id = ass.asset_id
left join supplier s on s.id = ass.supplier_id
where a.category ='supplier_service'
order by 5,6 desc


---ID.AM-01---
--elenco hardware con dettagli
select a.name, a.description, a.type, d.serial_number, (select family||' '||given from person p where p.id = d.person_id) as assegnato_a 
from asset a inner join asset_detail d on a.id = d.asset_id 
where a.category = 'hardware' and d.date_dismiss is null
--elenco asset e relative associazioni ad altri asset
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
(select a2.name from asset a2 where d.asset_id_master= a2.id ) as asset_associato
from asset a 
left join asset_association d on a.id = d.asset_id_parent
where d.date_dismiss is null
and a.category  in ('hardware')

---ID.AM-02---
--elenco asset e relative licenze e assegnazioni
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
d.serial_number, (select family||' '||given from person p where p.id = d.person_id) as assegnatario
from asset a 
left join asset_detail d on a.id = d.asset_id
where d.date_dismiss is null
and a.category not in ('hardware','supplier_service')
--elenco asset e relative associazioni ad altri asset
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
(select a2.name from asset a2 where d.asset_id_master= a2.id ) as asset_associato
from asset a 
left join asset_association d on a.id = d.asset_id_parent
where d.date_dismiss is null
and a.category not in ('hardware','supplier_service')

---ID.AM-04---
--elenco asset da fornitori
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
s.name as fornitore, s.critical
from asset a 
left join asset_supplier ass on a.id = ass.asset_id
left join supplier s on s.id = ass.supplier_id
where a.category ='supplier_service'
---elenco asset da fornitori e relativa associazione ai servizi erogati
select a.name, a.description, a.type, a.category, a.critical_level, a.healt_data,
se.name as servizio, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact
from asset a 
left join asset_service s on a.id = s.asset_id
left join service se on se.id =s.service_id
where a.category ='supplier_service'



---salvataggio vista nis2 in c:\temp---
COPY (
    SELECT * FROM v_nis2_export
) TO 'c:/temp/nis2_export.csv'
WITH CSV HEADER;