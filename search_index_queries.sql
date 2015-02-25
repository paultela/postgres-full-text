\timing on

-- Full text, tsvectors--
SELECT COUNT(*) FROM chemicals
WHERE search_index @@ to_tsquery('bleach');

SELECT COUNT(*) FROM chemicals
WHERE search_index @@ to_tsquery('toxic | dangerous | flammable');

SELECT COUNT(*) FROM chemicals
WHERE search_index @@ to_tsquery('toxic & dangerous & flammable');
