-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2025 at 04:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `futurehub`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `student_username` varchar(50) DEFAULT NULL,
  `status` enum('not started','in progress','completed') DEFAULT 'not started'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `description`, `created_by`) VALUES
(2, 'Intro to Time Management', 'A basic course to improve your productivity.', 'employer1'),
(3, 'Finance Management', 'Learn the basics of managing money and budgeting.', 'admin'),
(4, 'CV Skills', 'Build a professional CV that stands out.', 'admin'),
(5, 'Interview Questions', 'Master answering interview questions with confidence.', 'admin'),
(6, 'Leadership Basics', 'Learn how to lead teams effectively.', 'admin'),
(7, 'Workplace Communication', 'Improve how you communicate professionally.', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `course_lessons`
--

CREATE TABLE `course_lessons` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_lessons`
--

INSERT INTO `course_lessons` (`id`, `course_id`, `title`, `content`) VALUES
(1, 2, 'Lesson 1: Understanding Time', 'Time management is the process of planning and controlling how much time to spend on specific activities.'),
(2, 2, 'Lesson 1: Budgeting 101', 'Finance starts with budgeting. You need to understand income vs expenses...'),
(3, 3, 'Lesson 1: What Makes a Good CV', 'A CV should clearly present your experience, achievements, and education...'),
(4, 4, 'Lesson 1: Common Interview Questions', 'Be ready to talk about strengths, weaknesses, and previous roles...'),
(5, 5, 'Lesson 1: Budget Basics', 'Learn how to create and stick to a personal budget.'),
(6, 6, 'Lesson 1: Writing a Great CV', 'Your CV is your first impression. Learn what to include and how to format it.'),
(7, 7, 'Lesson 1: Common Interview Questions', 'Be ready for the top questions employers ask during interviews.');

-- --------------------------------------------------------

--
-- Table structure for table `course_quizzes`
--

CREATE TABLE `course_quizzes` (
  `id` int(11) NOT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `option_a` varchar(255) DEFAULT NULL,
  `option_b` varchar(255) DEFAULT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` enum('a','b','c','d') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_quizzes`
--

INSERT INTO `course_quizzes` (`id`, `lesson_id`, `question`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`) VALUES
(1, 1, 'What is time management?', 'A way to sleep less', 'A method to spend time wisely', 'A technique for procrastination', 'None of the above', 'b'),
(2, 2, 'What is a budget?', 'A loan plan', 'A spending guide', 'A savings account', 'None of the above', 'b'),
(3, 3, 'What is an emergency fund?', 'Fun money', 'Investment', 'Money set aside for surprises', 'Part of rent', 'c'),
(4, 2, 'What font should a CV ideally use?', 'Comic Sans', 'Times New Roman', 'Papyrus', 'Jokerman', 'b'),
(5, 3, 'How should you answer “What is your weakness?”', 'Say \"None\"', 'Be honest with reflection', 'Blame team', 'Lie confidently', 'b'),
(6, 5, 'What is the primary goal of financial management?', 'Maximizing revenue', 'Maximizing market share', 'Maximizing shareholder wealth', 'Minimizing expenses', 'c'),
(7, 2, 'What is the formula for ROI?', 'Net Income / Total Assets', '(Ending Value – Beginning Value) / Beginning Value', 'Net Income / Shareholder Equity', '(Ending Value – Beginning Value) / Beginning Value × 100', 'd'),
(8, 2, 'Which of the following is a long-term liability?', 'Accounts payable', 'Short-term loans', 'Bonds payable', 'Inventory', 'c'),
(9, 2, 'What does liquidity mean in finance?', 'Convert assets into cash quickly', 'Generate a high return', 'Minimize expenses', 'Raise capital', 'a'),
(10, 2, 'IPO stands for?', 'Initial Profit Offering', 'Initial Public Offering', 'International Portfolio Organization', 'Investment Policy Statement', 'b'),
(11, 2, 'Purpose of a credit score?', 'To save money', 'To assess debt ratio', 'To evaluate creditworthiness', 'To calculate net worth', 'c'),
(12, 4, 'Formula for Price-Earnings ratio?', 'Market Price / Earnings per Share', 'Dividends / Price per Share', 'EPS / Dividends', 'Price / Dividends', 'a'),
(13, 2, 'Leading economic indicator?', 'CPI', 'GDP', 'Stock market indices', 'Unemployment rate', 'c'),
(14, 3, 'What is an emergency fund?', 'Invest in high-risk', 'Cover unexpected costs', 'Finance goals', 'Repay debts', 'b'),
(15, 2, 'Dividend refers to?', 'Company loan', 'Stock price', 'Bond interest', 'Shareholder profit payout', 'd'),
(16, 3, 'What is the purpose of a CV?', 'Show personal achievements', 'Apply for a job', 'List hobbies', 'Give references', 'b'),
(17, 3, 'What goes at the top of a CV?', 'Work Experience', 'Education', 'Contact Information', 'References', 'c'),
(18, 3, 'How to list responsibilities in experience section?', 'Paragraphs', 'Bullet points', 'Chronologically', 'With opinions', 'b'),
(19, 3, 'Recommended font size for a CV?', '8-10 pt', '10-12 pt', '12-14 pt', '14-16 pt', 'b'),
(20, 3, 'Include a photo?', 'Yes always', 'No never', 'Only if requested', 'Only for creatives', 'c'),
(21, 3, 'Ideal length for mid-level CV?', 'One page', 'Two pages', 'Three pages', 'Four pages', 'b'),
(22, 3, 'Avoid in a CV?', 'Professional summary', 'Personal pronouns', 'Contact info', 'Relevant skills', 'b'),
(23, 3, 'Best way to list achievements?', 'Vague statements', 'Quantified results', 'Opinions', 'Irrelevant details', 'b'),
(24, 3, 'Purpose of Skills section?', 'List hobbies', 'Show skills', 'Give references', 'Mention interests', 'b'),
(25, 3, 'Tailor CV to job?', 'Yes always', 'No never', 'Only for senior roles', 'Only for creatives', 'a'),
(26, 4, 'STAR method is used for?', 'Tech questions', 'Behavioral responses', 'Thank-you notes', 'Writing CVs', 'b'),
(27, 4, 'Best interview attire?', 'Casual', 'Formal or business casual', 'Uniform', 'Sportswear', 'b'),
(28, 4, 'How to answer \"Tell me about yourself\"?', 'Personal life', 'Achievements & skills', 'Hobbies', 'Salary talk', 'b'),
(29, 4, 'How to handle a question you don’t know?', 'Make it up', 'Admit and redirect', 'Stay silent', 'Guess wildly', 'b'),
(30, 4, 'Key part of body language?', 'Hands in pockets', 'Eye contact & posture', 'Slouching', 'Crossed arms', 'b'),
(31, 4, 'What’s a good question to ask at end?', 'What’s your salary?', 'When do I start?', 'What does success look like here?', 'Nothing', 'c'),
(32, 4, 'Why research the company?', 'To waste time', 'To look smart', 'To understand culture & values', 'To memorize names', 'c'),
(33, 4, 'Best way to follow up?', 'Call daily', 'Wait silently', 'Send thank-you email', 'Tweet about it', 'c'),
(34, 4, 'Common mistake?', 'Overpreparation', 'Lying', 'Eye contact', 'Asking questions', 'b'),
(35, 4, 'When asked \"greatest weakness\"?', 'Say none', 'Mention real flaw', 'Turn negative into a strength', 'Say don’t know', 'c');

-- --------------------------------------------------------

--
-- Table structure for table `job_listings`
--

CREATE TABLE `job_listings` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `posted_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_progress`
--

CREATE TABLE `quiz_progress` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `answer` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_progress`
--

INSERT INTO `quiz_progress` (`id`, `username`, `course_id`, `quiz_id`, `answer`) VALUES
(1, 'alice', 3, 1, 'b'),
(2, 'alice', 3, 5, 'b'),
(5, 'alice', 4, 12, 'a'),
(6, 'alice', 3, 3, 'c');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` enum('student','staff','employer') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'alice', 'pass123', 'student'),
(2, 'bob', 'staffpass', 'staff'),
(3, 'employer1', 'jobpass', 'employer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_lessons`
--
ALTER TABLE `course_lessons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_quizzes`
--
ALTER TABLE `course_quizzes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_listings`
--
ALTER TABLE `job_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_progress`
--
ALTER TABLE `quiz_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`quiz_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_lessons`
--
ALTER TABLE `course_lessons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_quizzes`
--
ALTER TABLE `course_quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `job_listings`
--
ALTER TABLE `job_listings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_progress`
--
ALTER TABLE `quiz_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
