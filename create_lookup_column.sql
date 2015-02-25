--ALTER TABLE chemicals ADD COLUMN search_index tsvector;
--UPDATE chemicals SET search_index = to_tsvector('english',
--          name || ' ' ||
--          company || ' ' ||
--          product_info || ' ' ||
--          responsible_party || ' ' ||
--          contractor_info || ' ' ||
--          composition || ' ' ||
--          hazards || ' ' ||
--          first_aid || ' ' ||
--          fire_fighting || ' ' ||
--          accidental_release || ' ' ||
--          handling_storage || ' ' ||
--          exposure_controls || ' ' ||
--          physical_chemical_properties || ' ' ||
--          stability_reactivity || ' ' ||
--          toxicological_info || ' ' ||
--          regulatory_info || ' ' ||
--          disposal_considerations || ' ' ||
--          ecological_info || ' ' ||
--          msds_transport_info || ' ' ||
--          other_info);

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
ON chemicals FOR EACH ROW EXECUTE PROCEDURE
tsvector_update_trigger(search_index, 'pg_catalog.english',
          name,
          company,
          product_info,
          responsible_party,
          contractor_info,
          composition,
          hazards,
          first_aid,
          fire_fighting,
          accidental_release,
          handling_storage,
          exposure_controls,
          physical_chemical_properties,
          stability_reactivity,
          toxicological_info,
          regulatory_info,
          disposal_considerations,
          ecological_info,
          msds_transport_info,
          other_info);

CREATE INDEX ON chemicals USING gin(search_index);
