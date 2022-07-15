CREATE TABLE class(
    class_id INT PRIMARY KEY,
    class_name VARCHAR(20)
);


CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20),
    student_surname VARCHAR(20),
    student_sex VARCHAR (6),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE subjects(
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE teachers(
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(20),
    teacher_surname VARCHAR(20),
    teacher_sex VARCHAR(6),
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


SELECT * FROM students;
SELECT * FROM teachers;
SELECT * FROM class;
SELECT * FROM subjects;


INSERT INTO class VALUES (1, "A");
INSERT INTO class VALUES (2, "B");

INSERT INTO students VALUES(1,"John","John", "Male", 1);
INSERT INTO students VALUES(2,"Mark","Mark", "Male", 2);
INSERT INTO students VALUES(3,"Lucy","Lucy", "Female", 1);



INSERT INTO subjects VALUES (1,"Math", 1);
INSERT INTO subjects VALUES (2,"CS", 2);
INSERT INTO subjects VALUES (3,"CS", 1);


INSERT INTO teachers VALUES(1,"Liza","LIZA", "Female", 1);
INSERT INTO teachers VALUES(2,"David","DAVID", "Male", 2);
INSERT INTO teachers VALUES(3,"Eugen","DAVID", "Male", 3);

SELECT DISTINCT student_name, teacher_name, subject_name
FROM students, teachers, subjects, class
WHERE (students.class_id = subjects.class_id AND teachers.subject_id = subjects.subject_id);

SELECT DISTINCT teacher_name
FROM students, teachers, subjects, class
WHERE student_name = "John" AND (students.class_id = subjects.class_id AND teachers.subject_id = subjects.subject_id);