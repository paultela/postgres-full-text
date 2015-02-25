\timing on

-- Simple one term search --
SELECT COUNT(*) FROM chemicals WHERE name LIKE '%bleach%';
SELECT COUNT(*) FROM chemicals WHERE name ILIKE '%bleach%';

-- complicated term search --
SELECT COUNT(*) FROM chemicals WHERE name ILIKE '%toxic dangerous flammable%';
SELECT COUNT(*) FROM chemicals WHERE name ILIKE '%toxic%' OR name ILIKE '%dangerous%' OR name ILIKE '%flammable%';

-- Full text, no tsvectors--
SELECT COUNT(*) FROM chemicals
WHERE     name || ' ' ||
          company || ' ' ||
          product_info || ' ' ||
          responsible_party || ' ' ||
          contractor_info || ' ' ||
          composition || ' ' ||
          hazards || ' ' ||
          first_aid || ' ' ||
          fire_fighting || ' ' ||
          accidental_release || ' ' ||
          handling_storage || ' ' ||
          exposure_controls || ' ' ||
          physical_chemical_properties || ' ' ||
          stability_reactivity || ' ' ||
          toxicological_info || ' ' ||
          regulatory_info || ' ' ||
          disposal_considerations || ' ' ||
          ecological_info || ' ' ||
          msds_transport_info || ' ' ||
          other_info ILIKE '%bleach%';


-- Full text, tsvectors--
SELECT COUNT(*) FROM chemicals
WHERE to_tsvector('english',
          name || ' ' ||
          company || ' ' ||
          product_info || ' ' ||
          responsible_party || ' ' ||
          contractor_info || ' ' ||
          composition || ' ' ||
          hazards || ' ' ||
          first_aid || ' ' ||
          fire_fighting || ' ' ||
          accidental_release || ' ' ||
          handling_storage || ' ' ||
          exposure_controls || ' ' ||
          physical_chemical_properties || ' ' ||
          stability_reactivity || ' ' ||
          toxicological_info || ' ' ||
          regulatory_info || ' ' ||
          disposal_considerations || ' ' ||
          ecological_info || ' ' ||
          msds_transport_info || ' ' ||
          other_info) @@ to_tsquery('bleach');

SELECT COUNT(*) FROM chemicals
WHERE to_tsvector('english',
          name || ' ' ||
          company || ' ' ||
          product_info || ' ' ||
          responsible_party || ' ' ||
          contractor_info || ' ' ||
          composition || ' ' ||
          hazards || ' ' ||
          first_aid || ' ' ||
          fire_fighting || ' ' ||
          accidental_release || ' ' ||
          handling_storage || ' ' ||
          exposure_controls || ' ' ||
          physical_chemical_properties || ' ' ||
          stability_reactivity || ' ' ||
          toxicological_info || ' ' ||
          regulatory_info || ' ' ||
          disposal_considerations || ' ' ||
          ecological_info || ' ' ||
          msds_transport_info || ' ' ||
          other_info) @@ to_tsquery('toxic | dangerous | flammable');

SELECT COUNT(*) FROM chemicals
WHERE to_tsvector('english',
          name || ' ' ||
          company || ' ' ||
          product_info || ' ' ||
          responsible_party || ' ' ||
          contractor_info || ' ' ||
          composition || ' ' ||
          hazards || ' ' ||
          first_aid || ' ' ||
          fire_fighting || ' ' ||
          accidental_release || ' ' ||
          handling_storage || ' ' ||
          exposure_controls || ' ' ||
          physical_chemical_properties || ' ' ||
          stability_reactivity || ' ' ||
          toxicological_info || ' ' ||
          regulatory_info || ' ' ||
          disposal_considerations || ' ' ||
          ecological_info || ' ' ||
          msds_transport_info || ' ' ||
          other_info) @@ to_tsquery('toxic & dangerous & flammable');
