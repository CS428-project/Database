--create database
CREATE DATABASE Coaching_Website

GO 
USE Coaching_Website

--create table user
CREATE TABLE Users
(
	ID int IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(20) NOT NULL,
	LastName nvarchar(20) NOT NULL,
	Email varchar(50) NOT NULL,
	Telephone varchar(20) NOT NULL,
	DOB date NOT NULL,
	Country varchar(20),
	Gender char NOT NULL CHECK (Gender = 'F' OR Gender = 'M' OR Gender = 'N'), -- N is non-disclosure
	Role varchar(6) NOT NULL CHECK (Role = 'Mentor' OR Role = 'Mentee'),
	PRIMARY KEY(ID)
);

--create table register
CREATE TABLE Register
(
	userID int NOT NULL,
	username varchar(20) NOT NULL,
	password varchar(20) NOT NULL,
	created_at date,
	UNIQUE(username),
	PRIMARY KEY(userID, username)
);

--create table mentor
CREATE TABLE Mentor
(
	mentorID int NOT NULL,
	Language nvarchar(100) NOT NULL,
	FieldID int NOT NULL,
	Description text,
	Rating float,
	PRIMARY KEY(mentorID)
);

--create table work experience
CREATE TABLE WorkExperience
(
	mentorID int NOT NULL,
	current_job text NOT NULL,
	current_workplace text,
	old_job text,
	years_experience int,
	PRIMARY KEY(mentorID)
);

--create table services
CREATE TABLE Services
(
	mentorID int NOT NULL,
	Cost varchar(20),
	FieldID int NOT NULL,
	Information text,
	work_time text NOT NULL,
	PRIMARY KEY(mentorID)
);

CREATE TABLE Field
(
	ID int IDENTITY(1001,1) NOT NULL,
	Type varchar(50),
	PRIMARY KEY(ID),
	UNIQUE(Type)
);

CREATE TABLE Booking
(
	ID int NOT NULL,
	mentorID int NOT NULL,
	menteeID int NOT NULL,
	book_at date NOT NULL,
	time varchar(50),
	status char NOT NULL CHECK (status = '0' OR status = '1'),
	PRIMARY KEY(ID)
);

CREATE TABLE Income
(
	mentorID int NOT NULL,
	BookingID int NOT NULL,
	money float NOT NULL,
	PRIMARY KEY(mentorID)
);

CREATE TABLE Feedback
(
	BookingID int NOT NULL,
	feedback text,
	rate float NOT NULL,
);

alter table Mentor 
ADD CONSTRAINT FK_MENTOR_MENTORID
FOREIGN KEY(mentorID) REFERENCES Users(ID);

alter table Mentor
ADD CONSTRAINT FK_MENTOR_FIELDID
FOREIGN KEY(FieldID) REFERENCES Field(ID);

alter table Register
ADD CONSTRAINT FK_REGISTER_ID
FOREIGN KEY(userID) REFERENCES Users(ID);

alter table WorkExperience
ADD CONSTRAINT FK_WORK_EXPERIENCE_MENTORID
FOREIGN KEY(mentorID) REFERENCES Mentor(mentorID);

alter table Services
ADD CONSTRAINT FK_SERVICES_MENTORID
FOREIGN KEY(mentorID) REFERENCES Mentor(mentorID);

alter table Services
ADD CONSTRAINT FK_SERVICES_FIELDID
FOREIGN KEY(FieldID) REFERENCES Field(ID);

alter table Booking
ADD CONSTRAINT FK_BOOKING_MENTORID
FOREIGN KEY(mentorID) REFERENCES Mentor(mentorID);

alter table Booking
ADD CONSTRAINT FK_BOOKING_MENTEEID
FOREIGN KEY(menteeID) REFERENCES Users(ID);

alter table Income
ADD CONSTRAINT FK_INCOME_MENTORID
FOREIGN KEY(mentorID) REFERENCES Mentor(mentorID);

alter table Income
ADD CONSTRAINT FK_INCOME_BOOKINGID
FOREIGN KEY(BookingID) REFERENCES Booking(ID);

alter table Feedback
ADD CONSTRAINT FK_FEEDBACK_BOOKINGID
FOREIGN KEY(BookingID) REFERENCES Booking(ID);

INSERT INTO Users(FirstName, LastName, Email, Telephone, DOB, Country, Gender, Role)
VALUES
	('John', 'Doe', 'john.doe@example.com', '1234567890', '1970-05-15', 'USA', 'M', 'Mentor'),
	('Jane', 'Smith', 'jane.smith@example.com', '9876543210', '1982-08-25', 'Canada', 'F', 'Mentor'),
	('David', 'Johnson', 'david.johnson@example.com', '5551234567', '1985-11-10', 'Australia', 'M', 'Mentor'),
	('Sarah', 'Williams', 'sarah.williams@example.com', '7894561230', '1978-02-18', 'UK', 'F', 'Mentor'),
	('Emily', 'Brown', 'emily.brown@example.com', '3216549870', '1971-04-30', 'USA', 'F', 'Mentor'),
	('Michael', 'Taylor', 'michael.taylor@example.com', '1237894560', '1982-07-05', 'Canada', 'M', 'Mentor'),
	('Jessica', 'Anderson', 'jessica.anderson@example.com', '9873216540', '1969-09-22', 'Australia', 'F', 'Mentor'),
	('Daniel', 'Thomas', 'daniel.thomas@example.com', '4561237890', '1983-01-12', 'USA', 'M', 'Mentor'),
	('Olivia', 'Davis', 'olivia.davis@example.com', '7418529630', '1977-06-20', 'Canada', 'F', 'Mentor'),
	('Christopher', 'Wilson', 'christopher.wilson@example.com', '3698521470', '1981-03-08', 'UK', 'M', 'Mentor'),
	('Michelle', 'Lee', 'michelle.lee@example.com', '1239874560', '1974-12-03', 'USA', 'F', 'Mentor'),
	('Andrew', 'Wang', 'andrew.wang@example.com', '9871236540', '1986-07-17', 'Canada', 'M', 'Mentor'),
	('Sophia', 'Martinez', 'sophia.martinez@example.com', '5557891230', '1990-09-08', 'Australia', 'F', 'Mentor'),
	('Matthew', 'Garcia', 'matthew.garcia@example.com', '7893214560', '1992-02-25', 'UK', 'M', 'Mentor'),
	('Isabella', 'Lopez', 'isabella.lopez@example.com', '3219876540', '1983-06-12', 'USA', 'F', 'Mentor'),
	('William', 'Scott', 'william.scott@example.com', '1234569870', '1988-10-20', 'Canada', 'M', 'Mentor'),
	('Ava', 'Rodriguez', 'ava.rodriguez@example.com', '9876541230', '1981-03-15', 'Australia', 'F', 'Mentor'),
	('James', 'Nguyen', 'james.nguyen@example.com', '4567893210', '1975-05-27', 'USA', 'M', 'Mentor'),
	('Charlotte', 'Kim', 'charlotte.kim@example.com', '7418523690', '1968-08-09', 'Canada', 'F', 'Mentor'),
	('Benjamin', 'Lewis', 'benjamin.lewis@example.com', '3691472580', '1980-01-30', 'UK', 'M', 'Mentor'),
	('Lily', 'Harris', 'lily.harris@example.com', '1234567890', '1982-04-15', 'USA', 'F', 'Mentor'),
	('Henry', 'Martin', 'henry.martin@example.com', '9876543210', '1984-08-25', 'Canada', 'M', 'Mentor'),
	('Sophie', 'Clark', 'sophie.clark@example.com', '5551234567', '1987-11-10', 'Australia', 'F', 'Mentor'),
	('Ethan', 'Robinson', 'ethan.robinson@example.com', '7894561230', '1989-02-18', 'UK', 'M', 'Mentor'),
	('Natalie', 'Walker', 'natalie.walker@example.com', '3216549870', '1990-04-30', 'USA', 'F', 'Mentor'),
	('Jacob', 'Young', 'jacob.young@example.com', '1237894560', '1988-07-05', 'Canada', 'M', 'Mentor'),
	('Grace', 'Hall', 'grace.hall@example.com', '9873216540', '1973-09-22', 'Australia', 'F', 'Mentor'),
	('Ryan', 'Baker', 'ryan.baker@example.com', '4561237890', '1985-01-12', 'USA', 'M', 'Mentor'),
	('Avery', 'Turner', 'avery.turner@example.com', '7418529630', '1987-06-20', 'Canada', 'F', 'Mentor'),
	('Leo', 'Parker', 'leo.parker@example.com', '3698521470', '1989-03-08', 'UK', 'M', 'Mentor'),
	('Sophia', 'Allen', 'sophia.allen@example.com', '1239874560', '1994-12-03', 'USA', 'F', 'Mentee'),
	('Daniel', 'Gomez', 'daniel.gomez@example.com', '9871236540', '1996-07-17', 'Canada', 'M', 'Mentee'),
	('Olivia', 'Powell', 'olivia.powell@example.com', '5557891230', '1999-09-08', 'Australia', 'F', 'Mentee'),
	('Matthew', 'Perry', 'matthew.perry@example.com', '7893214560', '1992-02-25', 'UK', 'M', 'Mentee'),
	('Emily', 'Long', 'emily.long@example.com', '3219876540', '1993-06-12', 'USA', 'F', 'Mentee'),
	('Joshua', 'Rivera', 'joshua.rivera@example.com', '1234569870', '1988-10-20', 'Canada', 'M', 'Mentee'),
	('Grace', 'Wright', 'grace.wright@example.com', '9876541230', '1991-03-15', 'Australia', 'F', 'Mentee'),
	('Lucas', 'Morris', 'lucas.morris@example.com', '4567893210', '1995-05-27', 'USA', 'M', 'Mentee'),
	('Chloe', 'Turner', 'chloe.turner@example.com', '7418523690', '1998-08-09', 'Canada', 'F', 'Mentee'),
	('Caleb', 'Stewart', 'caleb.stewart@example.com', '3691472580', '1990-01-30', 'UK', 'M', 'Mentee'),
	('Hannah', 'Price', 'hannah.price@example.com', '1234567890', '1992-04-15', 'USA', 'F', 'Mentee'),
	('Julian', 'Carter', 'julian.carter@example.com', '9876543210', '1994-08-25', 'Canada', 'M', 'Mentee'),
	('Samantha', 'Reed', 'samantha.reed@example.com', '5551234567', '1987-11-10', 'Australia', 'F', 'Mentee'),
	('Owen', 'Cook', 'owen.cook@example.com', '7894561230', '1999-02-18', 'UK', 'M', 'Mentee'),
	('Anna', 'Bell', 'anna.bell@example.com', '3216549870', '1990-04-30', 'USA', 'F', 'Mentee'),
	('Nathan', 'Brooks', 'nathan.brooks@example.com', '1237894560', '1988-07-05', 'Canada', 'M', 'Mentee'),
	('Ella', 'Bailey', 'ella.bailey@example.com', '9873216540', '1993-09-22', 'Australia', 'F', 'Mentee'),
	('Isaac', 'Murphy', 'isaac.murphy@example.com', '4561237890', '1995-01-12', 'USA', 'M', 'Mentee'),
	('Madison', 'Rogers', 'madison.rogers@example.com', '7418529630', '1997-06-20', 'Canada', 'F', 'Mentee'),
	('Elijah', 'Reynolds', 'elijah.reynolds@example.com', '3698521470', '1989-03-08', 'UK', 'M', 'Mentee')
	('Sophia', 'Hill', 'sophia.hill@example.com', '3698521470', '1991-04-05', 'USA', 'F', 'Mentee'),
	('Alexander', 'Allen', 'alexander.allen@example.com', '1237894560', '1993-07-12', 'Canada', 'M', 'Mentee'),
	('Ella', 'Cole', 'ella.cole@example.com', '9876543210', '1994-09-18', 'Australia', 'F', 'Mentee'),
	('Jackson', 'Turner', 'jackson.turner@example.com', '5551234567', '1995-12-22', 'UK', 'M', 'Mentee'),
	('Aria', 'Baker', 'aria.baker@example.com', '7894561230', '1992-02-25', 'USA', 'F', 'Mentee'),
	('Lucas', 'Wright', 'lucas.wright@example.com', '3691472580', '1993-04-28', 'Canada', 'M', 'Mentee'),
	('Scarlett', 'Cook', 'scarlett.cook@example.com', '1234567890', '1996-07-31', 'Australia', 'F', 'Mentee'),
	('Carter', 'Harris', 'carter.harris@example.com', '9876541230', '1997-09-08', 'UK', 'M', 'Mentee'),
	('Grace', 'Roberts', 'grace.roberts@example.com', '5557891230', '1994-11-15', 'USA', 'F', 'Mentee'),
	('Mason', 'Turner', 'mason.turner@example.com', '7893214560', '1995-12-23', 'Canada', 'M', 'Mentee'),
	('Layla', 'Bell', 'layla.bell@example.com', '3216549870', '1998-03-30', 'Australia', 'F', 'Mentee'),
	('Oliver', 'Parker', 'oliver.parker@example.com', '3698521470', '1992-05-09', 'UK', 'M', 'Mentee'),
	('Chloe', 'Bailey', 'chloe.bailey@example.com', '1234567890', '1995-08-12', 'USA', 'F', 'Mentee'),
	('Elijah', 'Morris', 'elijah.morris@example.com', '9876543210', '1996-09-18', 'Canada', 'M', 'Mentee'),
	('Aurora', 'Reed', 'aurora.reed@example.com', '5551234567', '1999-12-22', 'Australia', 'F', 'Mentee'),
	('Wyatt', 'Clark', 'wyatt.clark@example.com', '7894561230', '1994-02-25', 'UK', 'M', 'Mentee'),
	('Harper', 'Walker', 'harper.walker@example.com', '3691472580', '1995-04-28', 'USA', 'F', 'Mentee'),
	('Sebastian', 'Cook', 'sebastian.cook@example.com', '1234567890', '1998-07-31', 'Canada', 'M', 'Mentee'),
	('Luna', 'Harris', 'luna.harris@example.com', '9876541230', '1999-09-08', 'Australia', 'F', 'Mentee'),
	('Henry', 'Roberts', 'henry.roberts@example.com', '5557891230', '1996-11-15', 'UK', 'M', 'Mentee'),
	('Stella', 'Turner', 'stella.turner@example.com', '7893214560', '1997-12-23', 'USA', 'F', 'Mentee'),
	('Leo', 'Bell', 'leo.bell@example.com', '3216549870', '1992-05-09', 'Canada', 'M', 'Mentee'),
	('Willow', 'Parker', 'willow.parker@example.com', '1234567890', '1995-08-12', 'Australia', 'F', 'Mentee'),
	('Liam', 'Bailey', 'liam.bailey@example.com', '9876543210', '1998-09-18', 'UK', 'M', 'Mentee'),
	('Nora', 'Reed', 'nora.reed@example.com', '5551234567', '1999-12-22', 'USA', 'F', 'Mentee'),
	('Benjamin', 'Clark', 'benjamin.clark@example.com', '7894561230', '1996-02-25', 'Canada', 'M', 'Mentee'),
	('Paisley', 'Walker', 'paisley.walker@example.com', '3691472580', '1997-04-28', 'Australia', 'F', 'Mentee'),
	('Mateo', 'Cook', 'mateo.cook@example.com', '1234567890', '2000-07-31', 'UK', 'M', 'Mentee'),
	('Emilia', 'Harris', 'emilia.harris@example.com', '9876541230', '2001-09-08', 'USA', 'F', 'Mentee'),
	('James', 'Roberts', 'james.roberts@example.com', '5557891230', '1998-11-15', 'Canada', 'M', 'Mentee');

--ID: FirstName_LastName
--Password: 12345678
INSERT INTO Register (userID, username, password, created_at)
SELECT ID, CONCAT(LOWER(FirstName), '_', LOWER(LastName)), '12345678', '2023-09-01'
FROM Users

INSERT INTO Field(Type)
VALUES
	('Health and Wellness Coaching'),
	('Education Coaching'),
	('Business Coaching'),
	('Career Coaching'),
	('Personal Development Coaching'),
	('Executive Coaching');

INSERT INTO Mentor
VALUES
(1, 'English', 1001, 'I am a passionate health and wellness coach dedicated to helping you achieve a balanced and fulfilling life. Let us work together to improve your physical and mental well-being.', NULL),
(2, 'English', 1001, 'With a focus on holistic well-being, I am here to guide you on your journey to optimal health and vitality. Together, we can create lasting positive changes in your life.', 4.5),
(3, 'English', 1001, 'Greetings! As a health and wellness coach, I am committed to assisting you in developing sustainable lifestyle habits and achieving your wellness goals.', 4.2),
(4, 'English', 1001, 'Hello! I specialize in health and wellness coaching and am dedicated to supporting you in creating a healthier and happier life.', 4.4),
(5, 'English', 1001, 'I am an experienced health and wellness coach ready to help you make positive changes in your life. Let us embark on this transformative journey together!',4.6),
(6, 'English', 1002, 'Hi! I am an education coach dedicated to empowering students in their academic journey. Let us work together to enhance your learning strategies and achieve academic success.',NULL),
(7, 'English', 1002, 'Greetings! As an education coach, I am passionate about helping students develop effective study techniques, organizational skills, and a growth mindset to excel academically.', 4.5),
(8, 'English', 1002, 'Hello! With my expertise in education coaching, I can guide you in setting goals, improving study habits, and maximizing your learning potential.', 4.2),
(9, 'English', 1002, 'Welcome! I specialize in education coaching and can provide personalized guidance to help you overcome challenges, boost your motivation, and succeed academically.', 4.4),
(10, 'English', 1002, 'I am an experienced education coach ready to support you in achieving your educational goals. Let us work together to unlock your full academic potential.', 4.3),
(11, 'English', 1003, 'Hello! As a business coach, I can help you develop and implement effective strategies to drive growth and achieve your business objectives.', 4.3),
(12, 'English', 1003, 'Greetings! I specialize in business coaching and can assist you in various aspects of entrepreneurship, such as business planning, marketing, and leadership development.', 4.5),
(13, 'English', 1003, 'Hi there! With my expertise in business coaching, I can guide you in building a successful business, overcoming challenges, and reaching new heights of success.', NULL),
(14, 'English', 1003, 'Welcome! I am a business coach committed to helping you develop essential business skills, optimize operations, and achieve sustainable business growth.', 4.4),
(15, 'English', 1003, 'I am an experienced business coach ready to support you in navigating the complexities of the business world. Let us work together to elevate your entrepreneurial journey.', 4.6),
(16, 'English', 1004, 'Hi! As a career coach, I am dedicated to supporting individuals in finding meaningful and fulfilling careers. Let us work together to identify your strengths and achieve your professional goals.',NULL),
(17, 'English', 1004, 'Greetings! With my expertise in career coaching, I can assist you in exploring different career paths, developing job search strategies, and navigating career transitions.', 4.5),
(18, 'English', 1004, 'Hello! As a career coach, I am passionate about helping individuals uncover their true potential and make informed decisions to excel in their professional lives.', 4.2),
(19, 'English', 1004, 'Welcome! I specialize in career coaching and can provide guidance on resume writing, interview skills, and career advancement strategies to help you succeed.', 4.4),
(20, 'English', 1004, 'I am an experienced career coach ready to support you in achieving your career goals and finding fulfillment in your professional journey. Let us work together to unlock your full potential.', 4.6),
(21, 'English', 1005, 'Hello! As a personal development coach, I am dedicated to helping individuals cultivate self-awareness, enhance their mindset, and achieve personal growth.', 4.3),
(22, 'English', 1005, 'Hi there! I specialize in personal development coaching and can guide you in discovering your strengths, overcoming self-limiting beliefs, and creating a life of fulfillment.', 4.5),
(23, 'English', 1005, 'Greetings! With my expertise in personal development coaching, I can support you in setting meaningful goals, improving self-confidence, and unlocking your full potential.', 4.8),
(24, 'English', 1005, 'Welcome! I am a personal development coach committed to empowering you to overcome obstacles, develop resilience, and live a purposeful and authentic life.',4.4),
(25, 'English', 1005, 'I am an experienced personal development coach ready to guide you on your journey of self-discovery, personal growth, and transformation. Together, we can create positive change.',4.6),
(26, 'English', 1006, 'Hi! As an executive coach, I specialize in partnering with leaders to enhance their leadership skills, develop effective communication, and achieve professional success.', 4.3),
(27, 'English', 1006, 'Greetings! I am an experienced executive coach dedicated to supporting senior executives in maximizing their potential, leading with impact, and driving organizational excellence.', 4.5),
(28, 'English', 1006, 'Hello! With my expertise in executive coaching, I can help you develop a strategic vision, strengthen your decision-making abilities, and inspire high-performing teams.', NULL),
(29, 'English', 1006, 'Welcome! I specialize in executive coaching and can provide guidance on leadership development, succession planning, and navigating complex organizational dynamics.', 5),
(30, 'English', 1006, 'I am an experienced executive coach ready to support you in achieving your leadership goals and making a positive impact in your organization and beyond.', 4.6);

INSERT INTO Services
VALUES 
	(1, '5$/30 minutes', 1001, 'I offer personalized one-on-one coaching sessions to help you achieve your health and wellness goals. Together, we will create a customized plan tailored to your specific needs and preferences.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(2, '15$/hour', 1001, 'My health and wellness coaching services include nutritional guidance, fitness planning, and stress management techniques. I will support you in making sustainable lifestyle changes for long-term well-being.','20h00-22h00(all week)'),
	(3, '10$/45 minutes', 1001, 'During our coaching sessions, we will explore various wellness practices, such as mindfulness, meditation, and self-care strategies. Together, we will work towards enhancing your overall wellness.','07h00-11h00 + 20h00-22h00(all week)'),
	(4, '20$/hour', 1001, 'As your health and wellness coach, I will provide guidance on setting achievable goals, developing healthy habits, and overcoming obstacles. Together, we will create a roadmap for your well-being.','20h00-22h00(all week)'),
	(5, '25$/hour', 1001, 'I offer comprehensive health and wellness coaching services, including personalized fitness plans, nutrition advice, and mindset coaching. Together, we will optimize your health and vitality.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(6, '10$/30 minutes', 1002, 'My education coaching services focus on academic goal-setting, study skills development, and exam preparation strategies. I will provide support and guidance to help you excel in your studies.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(7, '20$/hour', 1002, 'During our coaching sessions, I will help you improve your learning techniques, time management skills, and organizational strategies. Together, we will enhance your academic performance.','07h00-11h00 + 20h00-22h00(all week)'),
	(8, '15$/45 minutes', 1002, 'I offer personalized education coaching services to help students overcome learning challenges, boost their confidence, and cultivate effective study habits.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(9, '25$/hour', 1002, 'As an education coach, I will assist you in identifying your strengths, setting realistic academic goals, and developing strategies to maximize your learning potential.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(10, '30$/hour', 1002, 'My education coaching services encompass personalized study plans, test-taking strategies, and academic motivation techniques. Together, we will unlock your academic success.','07h00-11h00 + 20h00-22h00(all week)'),
	(11, '15$/30 minutes', 1003, 'I provide business coaching services to entrepreneurs and small business owners, assisting them in developing effective business plans, marketing strategies, and growth opportunities.','20h00-22h00(all week)'),
	(12, '25$/hour', 1003, 'During our coaching sessions, I will help you refine your business vision, streamline operations, and enhance your leadership skills. Together, we will drive your business forward.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(13, '20$/45 minutes', 1003, 'As a business coach, I offer guidance on strategic planning, market analysis, and customer engagement. I will support you in achieving sustainable business growth.','07h00-11h00 + 20h00-22h00(all week)'),
	(14, '30$/hour', 1003, 'My business coaching services focus on areas such as business development, sales and marketing strategies, and organizational effectiveness. Together, we will build a thriving business.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(15, '35$/hour', 1003, 'I provide comprehensive business coaching services, including financial planning, market positioning, and team management. Together, we will accelerate your business success.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(16, '20$/30 minutes', 1004, 'My career coaching services are designed to help you explore career paths, identify your strengths, and navigate career transitions. I will provide guidance and support throughout your journey.','20h00-22h00(all week)'),
	(17, '30$/hour', 1004, 'During our coaching sessions, I will assist you in developing a career roadmap, enhancing your professional brand, and preparing for job interviews. Together, we will unlock your full potential.','07h00-11h00 + 20h00-22h00(all week)'),
	(18, '25$/45 minutes', 1004, 'I offer personalized career coaching services to help you discover your passion, align your career with your values, and achieve professional fulfillment.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(19, '35$/hour', 1004, 'As your career coach, I will provide guidance on job search strategies, networking techniques, and career advancement. Together, we will create a roadmap for your career success.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(20, '40$/hour', 1004, 'My career coaching services encompass career exploration, resume writing, interview preparation, and negotiation strategies. Together, we will empower you to thrive in your chosen profession.','20h00-22h00(all week)'),
	(21, '25$/30 minutes', 1005, 'I provide personalized personal development coaching sessions to help you cultivate self-awareness, develop empowering beliefs, and enhance your overall personal growth.','07h00-11h00 + 20h00-22h00(all week)'),
	(22, '35$/hour', 1005, 'During our coaching sessions, I will guide you in setting meaningful goals, overcoming limiting beliefs, and implementing effective strategies for personal transformation.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(23, '30$/45 minutes', 1005, 'I offer personal development coaching services aimed at helping you unlock your potential, cultivate positive habits, and create a life of fulfillment and purpose.','07h00-11h00 + 20h00-22h00(all week)'),
	(24, '40$/hour', 1005, 'As your personal development coach, I will support you in developing self-confidence, improving self-care practices, and achieving personal and emotional well-being.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(25, '45$/hour', 1005, 'My personal development coaching services encompass areas such as mindset transformation, goal-setting, and personal empowerment. Together, we will unleash your true potential.','20h00-22h00(all week)'),
	(26, '30$/30 minutes', 1006, 'My executive coaching services are designed to enhance your leadership skills, strengthen your decision-making abilities, and support your professional growth.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)'),
	(27, '40$/hour', 1006, 'During our coaching sessions, I will assist you in developing effective communication strategies, executive presence, and strategic thinking to excel in your leadership role.','07h00-11h00 + 20h00-22h00(all week)'),
	(28, '35$/45 minutes', 1006, 'I offer personalized executive coaching services aimed at helping you navigate complex organizational dynamics, drive team performance, and achieve executive success.','19h00-22h00(Tuesday,Thursday), 19h00-21h00(Friday), 13h00-16h00(Saturday)'),
	(29, '45$/hour', 1006, 'As your executive coach, I will provide guidance on leadership development, change management, and creating a positive organizational culture. Together, we will unlock your leadership potential.','20h00-22h00(all week)'),
	(30, '50$/hour', 1006, 'My executive coaching services encompass areas such as executive presence, stakeholder management, and career transition. Together, we will elevate your leadership impact.','12h30-13h30(Monday-Saturday), 14h00-17h00(Saturday-Sunday), 21h30-23h(all week)');

INSERT INTO WorkExperience
VALUES
	(1, 'Psychology teacher', 'Cleveland State University', 'Psychiatrist(Mount Sinan Hospital, Cleveland Clinic)', 17),
	(2, 'Fitness Coach', 'Gym Fitness Center', 'Personal Trainer (XYZ Gym)', 10),
	(3, 'Wellness Consultant', 'ABC Wellness Center', 'Nutritionist (Healthy Living Clinic)', 12),
	(4, 'Health Educator', 'Community Health Center', 'Public Health Researcher (University of XYZ)', 8),
	(5, 'Holistic Wellness Coach', 'Holistic Healing Center', 'Yoga Instructor (Mindful Yoga Studio)', 15),
	(6, 'Academic Advisor', 'University of ABC', 'Research Assistant (XYZ Research Institute)', 6),
	(7, 'Study Skills Coach', 'Private Tutoring Center', 'Education Consultant (ABC School District)', 9),
	(8, 'Career Counselor', 'Career Development Center', 'HR Specialist (XYZ Company)', 11),
	(9, 'Academic Coach', 'College Success Program', 'Teaching Assistant (ABC University)', 7),
	(10, 'Education Consultant', 'Educational Services Agency', 'Curriculum Specialist (XYZ School)', 13),
	(11, 'Business Coach', 'Business Coaching Firm', 'Entrepreneur (ABC Startup)', 14),
	(12, 'Leadership Development Trainer', 'Leadership Institute', 'Management Consultant (XYZ Consulting)', 10),
	(13, 'Marketing Strategist', 'Marketing Agency', 'Digital Marketing Specialist (ABC Company)', 8),
	(14, 'Sales Coach', 'Sales Training Institute', 'Sales Representative (XYZ Corporation)', 12),
	(15, 'Executive Coach', 'Executive Coaching Firm', 'Senior Manager (ABC Organization)', 16),
	(16, 'Career Transition Consultant', 'Career Transition Center', 'Human Resources Manager (XYZ Company)', 9),
	(17, 'Personal Development Coach', 'Personal Growth Institute', 'Life Coach (ABC Coaching Services)', 11),
	(18, 'Communication Skills Trainer', 'Communication Skills Academy', 'Public Speaking Coach (XYZ Training Center)', 7),
	(19, 'Wellness Program Coordinator', 'Wellness Program Agency', 'Health Promotion Specialist (ABC Hospital)', 13),
	(20, 'Healthcare Administrator', 'Medical Center', 'Healthcare Manager (XYZ Healthcare Group)', 15),
	(21, 'Psychologist', 'Private Practice', 'Clinical Researcher (ABC University)', 10),
	(22, 'Mental Health Counselor', 'Counseling Center', 'Therapist (XYZ Therapy Services)', 12),
	(23, 'Wellness Coach', 'Wellness Center', 'Fitness Instructor (ABC Fitness Club)', 8),
	(24, 'Nutrition Coach', 'Nutrition Consultancy', 'Dietitian (XYZ Nutrition Clinic)', 14),
	(25, 'Weight Loss Specialist', 'Weight Management Clinic', 'Health Coach (ABC Wellness Program)', 9),
	(26, 'Life Skills Trainer', 'Life Skills Institute', 'Social Worker (XYZ Social Services)', 11),
	(27, 'Behavioral Therapist', 'Behavioral Health Center', 'Counselor (ABC Counseling Agency)', 7),
	(28, 'Stress Management Coach', 'Stress Relief Center', 'Mindfulness Instructor (XYZ Mindfulness Studio)', 13),
	(29, 'Fitness Consultant', 'Fitness Solutions Agency', 'Personal Trainer (ABC Gym)', 15),
	(30, 'Holistic Health Practitioner', 'Holistic Wellness Center', 'Reiki Practitioner (XYZ Healing Arts)', 10);




--CREATE FUNCTION:
--Function 1: Insert information of user
CREATE PROCEDURE sp_AddUsers @firstname nvarchar(20), @lastname nvarchar(20), @email varchar(50),
@telephone varchar(20), @dob date, @country varchar(20), @gender char, @role varchar(6)
AS
BEGIN
	IF EXISTS(SELECT Email, Telephone FROM Users WHERE Email = @email OR Telephone = @telephone )
		PRINT 'The user has already existed. Insert failed.'
	ELSE
		INSERT INTO Users 
		VALUES (@firstname, @lastname, @email, @telephone, @dob, @country, @gender, @role)
		PRINT 'Insert successfully'

END
GO

EXEC sp_AddUsers 'Lee', 'Han', 'leehan123@gmail.com', '0905123456', '1977-07-05', 'Korea', 'M', 'Mentor';


--Function 2: Create account
CREATE PROCEDURE dbo.InsertIntoRegister @username varchar(20), @password varchar(20), @created_at date
AS
BEGIN
    DECLARE @userID int
    SELECT @userID = MAX(ID) FROM Users

    IF NOT EXISTS (SELECT 1 FROM Register WHERE username = @username)
        AND LEN(@password) >= 6 AND LEN(@password) <= 20
    BEGIN
        INSERT INTO Register (userID, username, password, created_at)
        VALUES (@userID, @username, @password, @created_at)
        PRINT 'Insert successfully'
    END
    ELSE
    BEGIN
        PRINT 'Information is wrong. Insert failed'
    END
END
GO

EXEC dbo.InsertIntoRegister 'han_lee', '12345678','2023-07-21'

-- add mentor
CREATE PROCEDURE sp_InsertMentor @language nvarchar(100), @fieldID int, @description text, @rating float
AS
BEGIN
    DECLARE @userID int
    SELECT @userID = MAX(ID) FROM Users WHERE role = 'Mentor'
    IF @userID IS NOT NULL
    BEGIN
        IF EXISTS (SELECT 1 FROM Field WHERE ID = @fieldID)
        BEGIN
            INSERT INTO Mentor (mentorID, Language, FieldID, Description, Rating)
            VALUES (@userID, @language, @fieldID, @description, @rating);
            PRINT 'Mentor inserted successfully.'
        END
        ELSE
        BEGIN
            PRINT 'Invalid FieldID. Insert failed.'
        END
    END
    ELSE
    BEGIN
        PRINT 'No Mentor found in the Users table. Insert failed.'
    END
END


EXEC sp_InsertMentor  @language = 'English', @fieldID = 1001, @description = 'As a passionate health and wellness coach, I am dedicated to helping you achieve balance and fulfillment in life. Let us work together to improve your overall well-being.', @rating = 4.5;




DROP PROCEDURE dbo.sp_AddUsers;
DROP PROCEDURE dbo.InsertIntoRegister;
DROP PROCEDURE dbo.sp_InsertMentor;

-- Rollback all transactions
ALTER DATABASE Coaching_Website SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Select master database
USE master;
-- Remove database
DROP DATABASE Coaching_Website;
