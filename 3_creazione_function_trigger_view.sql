--function versioning tabelle
CREATE OR REPLACE FUNCTION fn_version_organization()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_organization (
            organization_id,
            name, description, sector, size, nis2_category,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
            OLD.name, OLD.description, OLD.sector, OLD.size, OLD.nis2_category,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_organization (
            organization_id,
            name, description, sector, size, nis2_category,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
            OLD.name, OLD.description, OLD.sector, OLD.size, OLD.nis2_category,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_organization_location()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_organization_location (
            organization_location_id,
			organization_id,
            active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
            OLD.active, OLD.address, OLD.civic_number, OLD.postal_code, OLD.city_name, OLD.district_name, OLD.state_name, OLD.country_name, OLD.main,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_organization_location (
            organization_location_id,
			organization_id,
            active, address, civic_number, postal_code, city_name, district_name, state_name, country_name, main,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
            OLD.active, OLD.address, OLD.civic_number, OLD.postal_code, OLD.city_name, OLD.district_name, OLD.state_name, OLD.country_name, OLD.main,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_organization_location_contact()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_organization_location_contact (
            organization_location_contact_id,
			organization_location_id,
            type, contact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_location_id,
            OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_organization_location_contact (
            organization_location_contact_id,
			organization_location_id,
            type, contact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_location_id,
            OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_service()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_service (
            service_id,
			organization_id,
            name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
            OLD.name, OLD.description, OLD.critical, OLD.confidentiality_impact, OLD.integrity_impact, OLD.availability_impact, OLD.business_impact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_service (
            service_id,
			organization_id,
            name, description, critical, confidentiality_impact, integrity_impact, availability_impact, business_impact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
            OLD.name, OLD.description, OLD.critical, OLD.confidentiality_impact, OLD.integrity_impact, OLD.availability_impact, OLD.business_impact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_person()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_person (
            person_id,
			family, given, fiscal_code,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.family, OLD.given, OLD.fiscal_code,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_person (
            person_id,
			family, given, fiscal_code,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.family, OLD.given, OLD.fiscal_code,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_person_contact()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_person_contact (
            person_contact_id,
			person_id,
			type, contact, 
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_person_contact (
            person_contact_id,
			person_id,
			type, contact, 
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_practitioner_role()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_practitioner_role (
            practitioner_id,
			person_id,
			organization_id,
			role,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.organization_id,
			OLD.role,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_practitioner_role (
            practitioner_id,
			person_id,
			organization_id,
			role,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.organization_id,
			OLD.role,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_supplier()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_supplier (
            supplier_id,
			name, description, critical,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.name, OLD.description, OLD.critical,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_supplier (
            supplier_id,
			name, description, critical,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.name, OLD.description, OLD.critical,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_supplier_location()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_supplier_location (
            supplier_location_id,
			supplier_id,
			address, civic_number, postal_code, city_name, district_name, state_name, country_name, main,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.supplier_id,
			OLD.address, OLD.civic_number, OLD.postal_code, OLD.city_name, OLD.district_name, OLD.state_name, OLD.country_name, OLD.main,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_supplier_location (
            supplier_location_id,
			supplier_id,
			address, civic_number, postal_code, city_name, district_name, state_name, country_name, main,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.supplier_id,
			OLD.address, OLD.civic_number, OLD.postal_code, OLD.city_name, OLD.district_name, OLD.state_name, OLD.country_name, OLD.main,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_supplier_location_contact()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_supplier_location_contact (
            supplier_location_contact_id,
			supplier_location_id,
			type, contact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.supplier_location_id,
			OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_supplier_location_contact (
            supplier_location_contact_id,
			supplier_location_id,
			type, contact,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.supplier_location_id,
			OLD.type, OLD.contact,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_supplier_practitioner_role()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_supplier_practitioner_role (
            supplier_practitioner_id,
			person_id,
			supplier_id,
			role,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.supplier_id,
			OLD.role,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_supplier_practitioner_role (
            supplier_practitioner_id,
			person_id,
			supplier_id,
			role,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.person_id,
			OLD.supplier_id,
			OLD.role,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_asset()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_asset (
            asset_id,
			organization_id,
			name, description, type, category, critical_level, healt_data,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
			OLD.name, OLD.description, OLD.type, OLD.category, OLD.critical_level, OLD.healt_data,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_asset (
            asset_id,
			organization_id,
			name, description, type, category, critical_level, healt_data,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.organization_id,
			OLD.name, OLD.description, OLD.type, OLD.category, OLD.critical_level, OLD.healt_data,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_asset_service()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_asset_service (
            asset_service_id,
			asset_id,
			service_id,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id,
			OLD.service_id,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_asset_service (
            asset_service_id,
			asset_id,
			service_id,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id,
			OLD.service_id,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_asset_supplier()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_asset_supplier (
            asset_supplier_id,
			asset_id,
			supplier_id,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id,
			OLD.supplier_id,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_asset_supplier (
            asset_supplier_id,
			asset_id,
			supplier_id,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id,
			OLD.supplier_id,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_asset_detail()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_asset_detail (
            asset_detail_id,
			asset_id,
			person_id,
			serial_number, date_start, date_dismiss,
            version,
            date_from,
            date_to
        )
        VALUES (
             OLD.id,
			OLD.asset_id,
			OLD.person_id,
			OLD.serial_number, OLD.date_start, OLD.date_dismiss,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_asset_detail (
            asset_detail_id,
			asset_id,
			person_id,
			serial_number, date_start, date_dismiss,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id,
			OLD.person_id,
			OLD.serial_number, OLD.date_start, OLD.date_dismiss,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_version_asset_association()
RETURNS TRIGGER AS $$
BEGIN

    IF TG_OP = 'UPDATE' THEN

        INSERT INTO ver_asset_association (
            asset_association_id,
			asset_id_master,
			asset_id_parent,
			date_start, date_dismiss,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id_master,
			OLD.asset_id_parent,
			OLD.date_start, OLD.date_dismiss,
            OLD.version,
            OLD.date_upd,
            now()
        );

        NEW.version = OLD.version + 1;
        NEW.date_upd = now();

        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN

        INSERT INTO ver_asset_association (
            asset_association_id,
			asset_id_master,
			asset_id_parent,
			date_start, date_dismiss,
            version,
            date_from,
            date_to
        )
        VALUES (
            OLD.id,
			OLD.asset_id_master,
			OLD.asset_id_parent,
			OLD.date_start, OLD.date_dismiss,
            OLD.version,
            OLD.date_upd,
            now()
        );

        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;


--trigger automatico versioning
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public'
        AND tablename NOT LIKE 'ver_%'
        AND tablename NOT IN ('audit')
    LOOP

        EXECUTE format('
            CREATE TRIGGER trg_version_%I
            BEFORE UPDATE OR DELETE ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_version_%I();
        ', r.tablename, r.tablename, r.tablename, r.tablename);

    END LOOP;
END;
$$;



--function audit

CREATE OR REPLACE FUNCTION fn_audit()
RETURNS TRIGGER AS $$
BEGIN

    -- UPDATE timestamp automatico
    IF TG_OP = 'UPDATE' THEN
        NEW.date_upd = now();
    END IF;

    -- INSERT
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit (table_name, record_id, operation, new_data, change_by)
        VALUES (
            TG_TABLE_NAME,
            NEW.id,
            TG_OP,
            to_jsonb(NEW),
            current_user
        );
        RETURN NEW;

    -- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit (table_name, record_id, operation, old_data, new_data, change_by)
        VALUES (
            TG_TABLE_NAME,
            NEW.id,
            TG_OP,
            to_jsonb(OLD),
            to_jsonb(NEW),
            current_user
        );
        RETURN NEW;

    -- DELETE
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit (table_name, record_id, operation, old_data, change_by)
        VALUES (
            TG_TABLE_NAME,
            OLD.id,
            TG_OP,
            to_jsonb(OLD),
            current_user
        );
        RETURN OLD;
    END IF;

END;
$$ LANGUAGE plpgsql;



--trigger automatico audit sulle tabelle anagrafiche
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN 
        SELECT tablename 
        FROM pg_tables 
        WHERE schemaname = 'public'
        AND tablename NOT LIKE 'ver_%'
        AND tablename <> 'audit'
    LOOP

        EXECUTE format('
            DROP TRIGGER IF EXISTS trg_audit_%I ON %I;
            CREATE TRIGGER trg_audit_%I
            AFTER INSERT OR UPDATE OR DELETE ON %I
            FOR EACH ROW
            EXECUTE FUNCTION fn_audit();
        ', r.tablename, r.tablename, r.tablename, r.tablename);

    END LOOP;
END;
$$;

--creazione vista nis2
CREATE OR REPLACE VIEW v_nis2_export AS
SELECT 
    o.name AS organization,
    a.name AS asset_name,
    a.type AS asset_type,
    a.category,
    a.critical_level,
    srv.name AS service_name,
    srv.business_impact,
    sup.name AS supplier_name,
    sup.critical AS supplier_critical,
    cont.type AS contact_type,
    cont.contact
FROM organization o
LEFT JOIN asset a ON a.organization_id = o.id
LEFT JOIN asset_service ats ON ats.asset_id = a.id
LEFT JOIN service srv ON srv.id = ats.service_id
LEFT JOIN asset_supplier asp ON asp.asset_id = a.id
LEFT JOIN supplier sup ON sup.id = asp.supplier_id
LEFT JOIN supplier_location sl ON sl.supplier_id = sup.id
LEFT JOIN supplier_location_contact cont 
    ON cont.supplier_location_id = sl.id;