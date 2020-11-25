SELECT sum(duration) as total_duration 
FROM assignment_submissions
JOIN students
ON assignment_submissions.student_id =  students.id
WHERE name = 'Ibrahim Schimmel';

SELECT sum(duration) as total_duration
FROM assignment_submissions
JOIN students 
ON assignment_submissions.student_id =  students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
GROUP BY students.name;