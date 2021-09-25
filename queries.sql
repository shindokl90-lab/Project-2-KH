-- Joins tables
SELECT s.id, s.name, s.rating, s.district,s.niche_grade,s.stu_number,s.ratio,d.city
FROM school as s
LEFT JOIN district as d
ON s.district = d.name;
