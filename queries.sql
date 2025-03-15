use tennis;
SELECT c.competition_id, c.competition_name, cat.category_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id;
SELECT cat.category_name, COUNT(c.competition_id) AS competition_count
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
GROUP BY cat.category_name;
SELECT competition_id, competition_name, type
FROM Competitions
WHERE type = 'doubles';
SELECT c.competition_id, c.competition_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
WHERE cat.category_name = 'ITF Men';
SELECT parent.competition_name AS parent_competition, child.competition_name AS sub_competition
FROM Competitions child
JOIN Competitions parent ON child.parent_id = parent.competition_id;
SELECT cat.category_name, c.type, COUNT(*) AS count
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
GROUP BY cat.category_name, c.type
ORDER BY cat.category_name, c.type;
SELECT competition_id, competition_name
FROM Competitions
WHERE parent_id IS NULL;


SELECT v.venue_id, v.venue_name, c.complex_name
FROM venues v
LEFT JOIN complexes c ON v.complex_id = c.complex_id;
SELECT c.complex_name, COUNT(v.venue_id) AS venue_count
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
GROUP BY c.complex_name;
SELECT venue_id, venue_name, city_name, country_name, country_code, timezone
FROM venues
WHERE country_name = 'Chile';
SELECT venue_id, venue_name, timezone
FROM venues;
SELECT c.complex_name, COUNT(v.venue_id) AS venue_count
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
GROUP BY c.complex_name
HAVING COUNT(v.venue_id) > 1;
SELECT country_name, COUNT(venue_id) AS venue_count
FROM venues
GROUP BY country_name
ORDER BY venue_count DESC;
SELECT v.venue_id, v.venue_name, c.complex_name
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
WHERE c.complex_name = 'Nacional';
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id;
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE r.ranking_position <= 5
ORDER BY r.ranking_position ASC;
SELECT c.competitor_id, c.name, r.ranking_position, r.movement
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE r.movement = 0;
SELECT c.country, SUM(r.points) AS total_points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE c.country = 'Croatia'
GROUP BY c.country;
SELECT c.country, COUNT(c.competitor_id) AS competitor_count
FROM competitors c
GROUP BY c.country
ORDER BY competitor_count DESC;
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
ORDER BY r.points DESC
LIMIT 1;




