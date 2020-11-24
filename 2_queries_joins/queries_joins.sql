-- SELECT sum(duration) as total_duration 
-- FROM assignment_submissions
-- JOIN students
-- ON assignment_submissions.student_id =  students.id
-- WHERE name = 'Ibrahim Schimmel';

SELECT sum(duration) as total_duration
FROM assignment_submissions
JOIN students 
ON assignment_submissions.student_id =  students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';