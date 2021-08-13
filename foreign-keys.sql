USE study_journal;

ALTER TABLE students
    ADD CONSTRAINT student_group_id_fk
        FOREIGN KEY (group_id) REFERENCES study_groups (number);

ALTER TABLE courses
    ADD CONSTRAINT courses_group_id_fk
        FOREIGN KEY (group_id) REFERENCES study_groups (number);

ALTER TABLE lessons
    ADD CONSTRAINT lessons_group_id_fk
        FOREIGN KEY (group_id) REFERENCES study_groups (number),
    ADD CONSTRAINT lessons_course_id_fk
        FOREIGN KEY (course_id) REFERENCES courses (id),
    ADD CONSTRAINT lessons_teacher_id_fk
        FOREIGN KEY (teacher_id) REFERENCES teachers (id);

ALTER TABLE scores
    ADD CONSTRAINT scores_student_id_fk
        FOREIGN KEY (student_id) REFERENCES students (id),
    ADD CONSTRAINT scores_lesson_id_fk
        FOREIGN KEY (lesson_id) REFERENCES lessons (id);