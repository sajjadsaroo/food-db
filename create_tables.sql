CREATE TABLE department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    student_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    email      VARCHAR(100) UNIQUE NOT NULL,
    dept_id    INT NOT NULL REFERENCES department(dept_id)
);

CREATE TABLE teacher (
    teacher_id  SERIAL PRIMARY KEY,
    emp_number  VARCHAR(20) UNIQUE NOT NULL,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    email       VARCHAR(100) UNIQUE NOT NULL,
    dept_id     INT NOT NULL REFERENCES department(dept_id)
);

CREATE TABLE food (
    food_id   SERIAL PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    price     NUMERIC(8,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE menu (
    menu_id    SERIAL PRIMARY KEY,
    food_id    INT NOT NULL REFERENCES food(food_id),
    serve_date DATE NOT NULL,
    meal       VARCHAR(10) NOT NULL CHECK (meal IN ('breakfast','lunch','dinner')),
    UNIQUE (food_id, serve_date, meal)
);

CREATE TABLE orders (
    order_id   SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES student(student_id),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id  INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    menu_id   INT NOT NULL REFERENCES menu(menu_id),
    quantity  INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
    UNIQUE (order_id, menu_id)
);
