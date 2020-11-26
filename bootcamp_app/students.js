const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const values = [`%${process.argv[2]}%`,process.argv[3]];
const query = `
SELECT students.name as student,cohorts.name as cohorts,students.id as student_id
FROM students
JOIN cohorts
on students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;
pool.query(query,values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.student} has an id of ${user.student_id} and was in the ${user.cohorts} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));