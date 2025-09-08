-- The Entity-Relationship Model (ER Model) is a conceptual model for designing a databases. This model represents the logical structure of a database, including entities, their attributes and relationships between them.

-- Entity: An objects that is stored as data such as Student, Course or Company.
-- Attribute: Properties that describes an entity such as StudentID, CourseName, or EmployeeEmail.
-- Relationship: A connection between entities such as "a Student enrolls in a Course".

CREATE TABLE students (
    sid INT AUTO_INCREMENT,                  -- Primary Key
    roll_no INT NOT NULL,                    -- Composite Key part
    cid INT NOT NULL,                        -- Composite Key part (Foreign Key)
    tid INT,                                 -- Foreign Key
    sname VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,             -- Unique Key
    aadhar_no CHAR(12) NOT NULL,             -- Candidate Key
    admission_date DATE DEFAULT CURRENT_DATE,

    -- Keys
    PRIMARY KEY (sid),                       -- Primary Key
    UNIQUE (email),                          -- Unique Key
    UNIQUE (aadhar_no),                      -- Candidate Key
    UNIQUE (roll_no, cid),                   -- Composite Key (unique per course)
    FOREIGN KEY (cid) REFERENCES courses(cid),
    FOREIGN KEY (tid) REFERENCES teachers(tid)
);