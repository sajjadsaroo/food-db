INSERT INTO department (dept_name) VALUES
('Computer Science'),
('Mechanical Engineering'),
('Business Administration'),
('Electrical Engineering'),
('Mathematics');

INSERT INTO student (student_number, first_name, last_name, email, dept_id) VALUES
('4001001','Ali','Rahimi','ali.rahimi@example.edu',1),
('4001002','Sara','Ghasemi','sara.ghasemi@example.edu',2),
('4001003','Reza','Moradi','reza.moradi@example.edu',1),
('4001004','Fatemeh','Karimi','fatemeh.karimi@example.edu',3),
('4001005','Hossein','Noori','hossein.noori@example.edu',4);

INSERT INTO teacher (emp_number, first_name, last_name, email, dept_id) VALUES
('T-101','Mahdi','Azizi','mahdi.azizi@example.edu',1),
('T-102','Leila','Kazemi','leila.kazemi@example.edu',2),
('T-103','Reza','Ahmadi','reza.ahmadi@example.edu',3),
('T-104','Neda','Sadeghi','neda.sadeghi@example.edu',4),
('T-105','Amir','Yousefi','amir.yousefi@example.edu',5);

INSERT INTO food (food_name, price) VALUES
('Chicken Kebab', 120000),
('Ghormeh Sabzi', 90000),
('Spaghetti', 80000),
('Fish and Rice', 110000),
('Vegetable Stew', 70000);

INSERT INTO menu (food_id, serve_date, meal) VALUES
(1, '2025-05-21', 'lunch'),
(2, '2025-05-21', 'dinner'),
(3, '2025-05-22', 'lunch'),
(4, '2025-05-22', 'dinner'),
(5, '2025-05-23', 'lunch');

INSERT INTO orders (student_id, order_date) VALUES
(1, '2025-05-20'),
(2, '2025-05-21'),
(3, '2025-05-21'),
(4, '2025-05-22'),
(5, '2025-05-23');

INSERT INTO order_item (order_id, menu_id, quantity) VALUES
(1,1,1),
(2,2,2),
(3,3,1),
(4,4,1),
(5,5,1);
