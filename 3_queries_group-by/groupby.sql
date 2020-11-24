SELECT day, count(*) AS total_assginments
FROM assignments
group by day
Having count(*) >= 10
order by day;

SELECT cohorts.name as cohort_name, count(*) as student_count
FROM cohorts
JOIN students
ON students.cohort_id = cohorts.id
group by cohorts.name
HAVING count(*) >= 18
order by student_count;

SELECT cohorts.name as cohort, count(*) as student_count
FROM cohorts
JOIN students
ON students.cohort_id = cohorts.id
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
group by cohorts.name
order by student_count desc;

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
WHERE end_date IS NULL
group by students.name
order by avg(duration) DESC;


SELECT 
students.name as student, 
avg(assignment_submissions.duration) as average_assignment_duration, 
avg(assignments.duration)
FROM students
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
JOIN assignments
ON assignment_submissions.assignment_id = assignments.id
WHERE end_date IS NULL
group by students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
order by avg(assignment_submissions.duration);