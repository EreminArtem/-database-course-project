USE study_journal;

CREATE VIEW student_score AS
SELECT students.id,
       students.last_name,
       students.first_name,
       students.email,
       scores.score
FROM students
         JOIN scores ON students.id = scores.student_id;

CREATE VIEW lesson_teacher AS
SELECT lessons.number,
       lesson_date,
       lessons.theme,
       study_groups.number AS group_number,
       CONCAT(teachers.last_name, teachers.first_name)
FROM lessons
         JOIN teachers ON teachers.id = lessons.teacher_id
         JOIN study_groups ON study_groups.number = lessons.group_id;

CREATE VIEW group_size AS
SELECT DISTINCT group_id                                       AS group_number,
                COUNT(*) OVER (PARTITION BY students.group_id) AS students
FROM students;
