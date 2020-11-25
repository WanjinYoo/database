SELECT count(*) as total_assistances,teachers.name
FROM assistance_requests
JOIN teachers
ON teachers.id = assistance_requests.teacher_id
WHERE teachers.name = 'Waylon Boehm'
group by name;

SELECT count(*) as total_assistances,students.name
FROM assistance_requests
JOIN students
ON students.id = assistance_requests.student_id
WHERE students.name = 'Elliot Dickinson'
group by name;

SELECT teachers.name as teachers,students.name as students,assignments.name as assignments,assistance_requests.completed_at - assistance_requests.started_at as duration
FROM assistance_requests
JOIN students
on students.id = assistance_requests.student_id
JOIN teachers
on teachers.id = assistance_requests.teacher_id
JOIN assignments
on assignments.id = assistance_requests.assignment_id
order by duration;


 WITH A as (SELECT cohorts.name as cohorts,AVG(assistance_requests.completed_at - assistance_requests.started_at) as duration 
 FROM assistance_requests 
 JOIN students
 on students.id = assistance_requests.student_id
 JOIN cohorts
 on students.cohort_id = cohorts.id
 group by cohorts.name
 order by duration) 
 SELECT cohorts,duration
 FROM A
 WHERE duration in  (SELECT MAX(duration) FROM A);


SELECT AVG(assistance_requests.started_at - assistance_requests.created_at) as average_wait_time
FROM assistance_requests;

(SELECT cohorts.name as cohorts,SUM(assistance_requests.completed_at - assistance_requests.started_at) as duration 
 FROM assistance_requests 
 JOIN students
 on students.id = assistance_requests.student_id
 JOIN cohorts
 on students.cohort_id = cohorts.id
 group by cohorts.name
 order by duration) 

With A as (SELECT cohorts.name as cohorts,SUM(assistance_requests.completed_at - assistance_requests.started_at) as duration 
 FROM assistance_requests 
 JOIN students
 on students.id = assistance_requests.student_id
 JOIN cohorts
 on students.cohort_id = cohorts.id
 group by cohorts.name
 order by duration) 
 SELECT AVG(duration)
 FROM A;

SELECT assignments.id,day,chapter,name,count(*)
FROM assignments
JOIN assistance_requests
ON assistance_requests.assignment_id = assignments.id
group by assignments.id
order by count(*) DESC;


SELECT day,count(*),sum(duration)
FROM assignments
group by day
order by day;

SELECT DISTINCT teachers.name,cohorts.name,count(*)
FROM teachers
JOIN assistance_requests
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON assistance_requests.student_id = students.id
JOIN cohorts
on students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
group by teachers.name,cohorts.name
order by teachers.name;