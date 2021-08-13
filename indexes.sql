USE study_journal;

CREATE INDEX courses_name_idx ON courses (name);

CREATE INDEX students_name_idx ON students (last_name);
CREATE INDEX students_email_idx ON students (email);

CREATE INDEX teachers_name_idx ON teachers (last_name);
CREATE INDEX teachers_email_idx ON teachers (email);
