use tennis;

-- A. Competition data-

-- List all competitions along with their category name
SELECT c.competition_id, c.competition_name, cat.category_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id;

-- Count the number of competitions in each category
SELECT cat.category_name, COUNT(c.competition_id) AS competition_count
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
GROUP BY cat.category_name;

-- Find all competitions of type 'doubles'
SELECT competition_id, competition_name, type
FROM Competitions
WHERE type = 'doubles';

-- Get competitions that belong to a specific category (e.g., ITF Men)
SELECT c.competition_id, c.competition_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
WHERE cat.category_name = 'ITF Men';

-- Identify parent competitions and their sub-competitions
SELECT parent.competition_name AS parent_competition, child.competition_name AS sub_competition
FROM Competitions child
JOIN Competitions parent ON child.parent_id = parent.competition_id;

-- Analyze the distribution of competition types by category 
SELECT cat.category_name, c.type, COUNT(*) AS count
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id
GROUP BY cat.category_name, c.type
ORDER BY cat.category_name, c.type;

-- List all competitions with no parent (top-level competitions)
SELECT competition_id, competition_name
FROM Competitions
WHERE parent_id IS NULL;

-- B. Complexes data- 

-- List all venues along with their associated complex name
SELECT v.venue_id, v.venue_name, c.complex_name
FROM venues v
LEFT JOIN complexes c ON v.complex_id = c.complex_id;

-- Count the number of venues in each complex
SELECT c.complex_name, COUNT(v.venue_id) AS venue_count
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
GROUP BY c.complex_name;

-- Get details of venues in a specific country (e.g., Chile)
SELECT venue_id, venue_name, city_name, country_name, country_code, timezone
FROM venues
WHERE country_name = 'Chile';

-- Identify all venues and their timezones
SELECT venue_id, venue_name, timezone
FROM venues;

-- Find complexes that have more than one venue
SELECT c.complex_name, COUNT(v.venue_id) AS venue_count
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
GROUP BY c.complex_name
HAVING COUNT(v.venue_id) > 1;

-- List venues grouped by country
SELECT country_name, COUNT(venue_id) AS venue_count
FROM venues
GROUP BY country_name
ORDER BY venue_count DESC;

-- Find all venues for a specific complex (e.g., Nacional)
SELECT v.venue_id, v.venue_name, c.complex_name
FROM venues v
JOIN complexes c ON v.complex_id = c.complex_id
WHERE c.complex_name = 'Nacional';

-- C.DOUBLES COMPETITOR RANKINGS DATA 

-- Get all competitors with their rank and points
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id;

-- Find competitors ranked in the top 5
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE r.ranking_position <= 5
ORDER BY r.ranking_position ASC;

-- List competitors with no rank movement (stable rank)
SELECT c.competitor_id, c.name, r.ranking_position, r.movement
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE r.movement = 0;

-- Get the total points of competitors from a specific country (e.g., Croatia)
SELECT c.country, SUM(r.points) AS total_points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
WHERE c.country = 'Croatia'
GROUP BY c.country;

-- Count the number of competitors per country
SELECT c.country, COUNT(c.competitor_id) AS competitor_count
FROM competitors c
GROUP BY c.country
ORDER BY competitor_count DESC;

-- Find competitors with the highest points in the current week
SELECT c.competitor_id, c.name, r.ranking_position, r.points
FROM competitors c
JOIN competitor_rankings r ON c.competitor_id = r.competitor_id
ORDER BY r.points DESC
LIMIT 1;




