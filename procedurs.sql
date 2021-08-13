USE study_journal;

DELIMITER //
CREATE TRIGGER course_active
    AFTER UPDATE
    ON courses
    FOR EACH ROW
BEGIN
    -- если дата окончания курса после нынешней, то надо выставить актив в false если забыли
    IF NEW.end_date > NOW() AND NEW.active = FALSE THEN
        UPDATE courses SET active = FALSE WHERE id = NEW.id;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE clean_up_courses()
BEGIN
    DELETE FROM courses WHERE active = FALSE AND (NOW() - end_date) > INTERVAL 12 MONTH;
END //
DELIMITER ;


