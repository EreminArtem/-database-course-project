USE study_journal;

SELECT id,
       CONCAT(last_name, ' ', first_name) AS student,
       group_id
FROM students;

SELECT id, name, group_id
FROM courses
WHERE active = TRUE;

SELECT lessons.id,
       lessons.number,
       lessons.group_id,
       courses.name,
       CONCAT(teachers.last_name, ' ', teachers.first_name) AS teacher
FROM lessons
         JOIN teachers ON lessons.teacher_id = teachers.id
         JOIN courses ON lessons.course_id = courses.id;

SELECT DISTINCT course_id,
                COUNT(*) OVER (PARTITION BY course_id) AS total
FROM lessons;

SELECT lessons.id,
       lessons.number,
       courses.name,
       CONCAT(students.last_name, ' ', students.first_name) AS student,
       scores.score
FROM lessons
         JOIN scores ON lessons.id = scores.lesson_id
         JOIN students ON scores.student_id = students.id
         JOIN courses ON lessons.course_id = courses.id;

SELECT students.id,
       CONCAT(students.last_name, ' ', students.first_name) AS student,
       students.email,
       students.group_id,
       courses.name
FROM students
         JOIN courses ON students.group_id = courses.group_id;

SELECT teachers.id,
       CONCAT(teachers.last_name, ' ', teachers.first_name) AS FIO,
       teachers.email
FROM teachers;