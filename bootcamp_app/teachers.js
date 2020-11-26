const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
SELECT DISTINCT teachers.name as teacher,cohorts.name
FROM teachers
JOIN assistance_requests
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON assistance_requests.student_id = students.id
JOIN cohorts
on students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
order by teachers.name;
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name}: ${user.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));