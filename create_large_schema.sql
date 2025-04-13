-- Create LARGE_SCHEMA1 user/schema
CREATE USER LARGE_SCHEMA1 IDENTIFIED BY welcome1
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP
  QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO LARGE_SCHEMA1;

-- Connect to LARGE_SCHEMA1
CONNECT LARGE_SCHEMA1/welcome1

-- HR Domain Tables
CREATE TABLE employees (
  employee_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  email VARCHAR2(100),
  hire_date DATE
);

CREATE TABLE departments (
  department_id NUMBER PRIMARY KEY,
  department_name VARCHAR2(100)
);

CREATE TABLE job_history (
  employee_id NUMBER,
  start_date DATE,
  end_date DATE,
  job_title VARCHAR2(100)
);

CREATE TABLE salary_grades (
  grade_level NUMBER PRIMARY KEY,
  min_salary NUMBER,
  max_salary NUMBER
);

CREATE TABLE training_records (
  training_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  course_name VARCHAR2(100),
  completion_date DATE
);

-- Sales Domain Tables
CREATE TABLE customers (
  customer_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  email VARCHAR2(100),
  phone VARCHAR2(20)
);

CREATE TABLE orders (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  order_date DATE,
  total_amount NUMBER(10,2)
);

CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  price NUMBER(10,2),
  category VARCHAR2(50)
);

CREATE TABLE order_items (
  order_id NUMBER,
  product_id NUMBER,
  quantity NUMBER,
  unit_price NUMBER(10,2)
);

CREATE TABLE sales_regions (
  region_id NUMBER PRIMARY KEY,
  region_name VARCHAR2(50),
  manager_id NUMBER
);

-- Inventory Domain Tables
CREATE TABLE warehouses (
  warehouse_id NUMBER PRIMARY KEY,
  location VARCHAR2(100),
  capacity NUMBER
);

CREATE TABLE inventory_items (
  item_id NUMBER PRIMARY KEY,
  product_id NUMBER,
  warehouse_id NUMBER,
  quantity NUMBER
);

CREATE TABLE suppliers (
  supplier_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  contact_person VARCHAR2(100),
  phone VARCHAR2(20)
);

CREATE TABLE purchase_orders (
  po_id NUMBER PRIMARY KEY,
  supplier_id NUMBER,
  order_date DATE,
  total_amount NUMBER(10,2)
);

CREATE TABLE shipments (
  shipment_id NUMBER PRIMARY KEY,
  order_id NUMBER,
  ship_date DATE,
  status VARCHAR2(20)
);

-- Finance Domain Tables
CREATE TABLE accounts (
  account_id NUMBER PRIMARY KEY,
  account_name VARCHAR2(100),
  account_type VARCHAR2(50),
  balance NUMBER(15,2)
);

CREATE TABLE transactions (
  transaction_id NUMBER PRIMARY KEY,
  account_id NUMBER,
  transaction_date DATE,
  amount NUMBER(15,2),
  type VARCHAR2(20)
);

CREATE TABLE budgets (
  budget_id NUMBER PRIMARY KEY,
  department_id NUMBER,
  fiscal_year NUMBER,
  amount NUMBER(15,2)
);

CREATE TABLE expenses (
  expense_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  expense_date DATE,
  amount NUMBER(10,2),
  category VARCHAR2(50)
);

CREATE TABLE invoices (
  invoice_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  issue_date DATE,
  due_date DATE,
  amount NUMBER(10,2)
);

-- Insert sample data
INSERT INTO employees VALUES (1, 'John', 'Doe', 'john.doe@email.com', DATE '2020-01-15');
INSERT INTO departments VALUES (1, 'Sales');
INSERT INTO customers VALUES (1, 'Acme Corp', 'contact@acme.com', '555-0100');
INSERT INTO products VALUES (1, 'Widget', 99.99, 'Hardware');
INSERT INTO warehouses VALUES (1, 'Central', 10000);
INSERT INTO accounts VALUES (1, 'Operating Account', 'Checking', 100000.00);

-- Additional tables to reach approximately 50 tables
CREATE TABLE employee_skills (
  employee_id NUMBER,
  skill_name VARCHAR2(100),
  proficiency_level VARCHAR2(20)
);

CREATE TABLE project_assignments (
  project_id NUMBER,
  employee_id NUMBER,
  start_date DATE,
  end_date DATE
);

CREATE TABLE customer_feedback (
  feedback_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  rating NUMBER,
  comments VARCHAR2(1000)
);

CREATE TABLE marketing_campaigns (
  campaign_id NUMBER PRIMARY KEY,
  name VARCHAR2(100),
  start_date DATE,
  end_date DATE,
  budget NUMBER(10,2)
);

CREATE TABLE product_categories (
  category_id NUMBER PRIMARY KEY,
  category_name VARCHAR2(50),
  description VARCHAR2(200)
);

CREATE TABLE shipping_rates (
  zone_id NUMBER,
  weight_range VARCHAR2(50),
  rate NUMBER(10,2)
);

CREATE TABLE tax_rates (
  state_code VARCHAR2(2),
  tax_rate NUMBER(5,2)
);

CREATE TABLE customer_segments (
  segment_id NUMBER PRIMARY KEY,
  segment_name VARCHAR2(50),
  description VARCHAR2(200)
);

CREATE TABLE vendor_contracts (
  contract_id NUMBER PRIMARY KEY,
  vendor_id NUMBER,
  start_date DATE,
  end_date DATE
);

CREATE TABLE equipment_maintenance (
  maintenance_id NUMBER PRIMARY KEY,
  equipment_id NUMBER,
  maintenance_date DATE,
  description VARCHAR2(200)
);

CREATE TABLE employee_certifications (
  certification_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  certification_name VARCHAR2(100),
  expiry_date DATE
);

CREATE TABLE quality_inspections (
  inspection_id NUMBER PRIMARY KEY,
  product_id NUMBER,
  inspector_id NUMBER,
  inspection_date DATE
);

CREATE TABLE customer_support_tickets (
  ticket_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  issue_description VARCHAR2(500),
  status VARCHAR2(20)
);

CREATE TABLE employee_attendance (
  attendance_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  attendance_date DATE,
  status VARCHAR2(20)
);

CREATE TABLE product_reviews (
  review_id NUMBER PRIMARY KEY,
  product_id NUMBER,
  customer_id NUMBER,
  rating NUMBER,
  review_text VARCHAR2(1000)
);

CREATE TABLE supplier_ratings (
  rating_id NUMBER PRIMARY KEY,
  supplier_id NUMBER,
  rating NUMBER,
  review_date DATE
);

CREATE TABLE employee_benefits (
  benefit_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  benefit_type VARCHAR2(50),
  coverage_amount NUMBER(10,2)
);

CREATE TABLE asset_tracking (
  asset_id NUMBER PRIMARY KEY,
  asset_name VARCHAR2(100),
  purchase_date DATE,
  current_value NUMBER(10,2)
);

CREATE TABLE compliance_records (
  record_id NUMBER PRIMARY KEY,
  compliance_type VARCHAR2(100),
  status VARCHAR2(20),
  review_date DATE
);

CREATE TABLE department_budgets (
  budget_id NUMBER PRIMARY KEY,
  department_id NUMBER,
  year NUMBER,
  amount NUMBER(15,2)
);

CREATE TABLE employee_performance (
  review_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  review_date DATE,
  rating NUMBER
);

CREATE TABLE inventory_adjustments (
  adjustment_id NUMBER PRIMARY KEY,
  item_id NUMBER,
  adjustment_date DATE,
  quantity NUMBER
);

CREATE TABLE payment_methods (
  method_id NUMBER PRIMARY KEY,
  method_name VARCHAR2(50),
  is_active NUMBER(1)
);

CREATE TABLE shipping_carriers (
  carrier_id NUMBER PRIMARY KEY,
  carrier_name VARCHAR2(100),
  contact_info VARCHAR2(200)
);

CREATE TABLE work_schedules (
  schedule_id NUMBER PRIMARY KEY,
  employee_id NUMBER,
  work_date DATE,
  shift VARCHAR2(20)
);

CREATE TABLE vendor_payments (
  payment_id NUMBER PRIMARY KEY,
  vendor_id NUMBER,
  amount NUMBER(10,2),
  payment_date DATE
);

CREATE TABLE customer_contracts (
  contract_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  start_date DATE,
  end_date DATE
);

-- Insert additional sample data
INSERT INTO employee_skills VALUES (1, 'Project Management', 'Expert');
INSERT INTO project_assignments VALUES (1, 1, DATE '2023-01-01', DATE '2023-12-31');
INSERT INTO customer_feedback VALUES (1, 1, 5, 'Excellent service');
INSERT INTO marketing_campaigns VALUES (1, 'Summer Sale 2023', DATE '2023-06-01', DATE '2023-08-31', 50000);