# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!


CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag) values 
    (1, 'sleeping', 'performing eyes closed for 8 hours at night :D', 'Skill 1'),
    (2, 'databases', 'fantastic at creating databases, especially on cmsc508 hw7', 'Skill 2'),
    (3, 'door-holding', 'world renowned at holding the door open for others', 'Skill 3'),
    (4, 'pythons', 'can name every type of python', 'Skill 4'),
    (5, 'python', 'extensive knowledge of programming in python', 'Skill 5'),
    (6, 'java', 'coffee taste-tester', 'Skill 6'),
    (7, 'eating', 'expert at putting food in my mouth ', 'Skill 7'),
    (8, 'exercising', 'proficient at burning off all the calories i eat', 'Skill 8');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.


CREATE TABLE people (
    people_id int NOT NULL,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    people_email varchar(255),
    people_linkedin_url varchar(255),
    people_headshot_url varchar(255),
    people_discord_handle varchar(255),
    people_brief_bio varchar(255),
    people_date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

-- might have issues with this insert header, idk if this is valid
INSERT INTO people (people_id,people_last_name, people_email, people_date_joined) values 
    (1,'Person 1', 'crowdl@vcu.edu', 17760704),
    (2,'Person 2', 'jdleonard@vcu.edu', 12340101),
    (3,'Person 3', 'mrao@vcu.edu', 20231110),
    (4,'Person 4', 'realemail@realcompany.com', 02020202),
    (5,'Person 5', 'hmmm@blanking.com', 10101010),
    (6,'Person 6', 'thinking@ishard.com', 12211221),
    (7,'Person 7', 'college@knowledge.edu', 21121124),
    (8,'Person 8', 'schoolemail@college.edu', 01231105),
    (9,'Person 9', 'WOW@IAM.edu', 02340405),
    (10,'Person 10', 'VERY@COOL.edu', 03450403);

    

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int NOT NULL AUTO_INCREMENT,
    peopleskills_skills_id int NOT NULL,
    peopleskills_people_id int NOT NULL,
    peopleskills_date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id)
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (peopleskills_people_id, peopleskills_skills_id, peopleskills_date_acquired) values
    (1, 1, 20200101),
    (1, 3, 20200102),
    (1, 6, 20200103),
    (2, 3, 20110711),
    (2, 4, 20110812),
    (2, 5, 20110913),
    (3, 1, 20070403),
    (3, 5, 20080304),
    (5, 3, 20090119),
    (5, 6, 20230912), 
    (6, 2, 20170602),
    (6, 3, 20170603),
    (6, 4, 20170604),
    (7, 3, 19500703),
    (7, 5, 19600705),
    (7, 6, 19700706),
    (8, 1, 19800801),
    (8, 3, 19900803),
    (8, 5, 20000805),
    (8, 6, 20100806),
    (9, 2, 20200902),
    (9, 5, 15000905),
    (9, 6, 16000906),
    (10, 1, 17001001),
    (10, 4, 18001004),
    (10, 5, 19001005);
 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int,
    roles_name varchar(255),
    roles_sort_priority int,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (roles_id, roles_name, roles_sort_priority) values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int NOT NULL AUTO_INCREMENT,
    peopleroles_people_id int NOT NULL,
    peopleroles_role_id int NOT NULL,
    peopleroles_date_assigned date NOT NULL,
    PRIMARY KEY (peopleroles_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer



INSERT INTO peopleroles (peopleroles_people_id, peopleroles_role_id, peopleroles_date_assigned) VALUES
    (1, 2, '20220101'),
    (2, 5, '20220102'),
    (2, 6, '20220102'),
    (3, 2, '20220103'),
    (3, 4, '20220103'),
    (4, 3, '20220104'),
    (5, 3, '20220105'),
    (6, 2, '20220106'),
    (6, 1, '20220106'),
    (7, 1, '20220107'),
    (8, 1, '20220108'),
    (8, 4, '20220108'),
    (9, 2, '20220109'),
    (10, 2, '20220110'),
    (10, 1, '20220110');