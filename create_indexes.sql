\timing on
CREATE INDEX ON chemicals (name);
CREATE INDEX ON chemicals (company);
CREATE INDEX ON chemicals USING gin(to_tsvector('english',
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
          other_info))
