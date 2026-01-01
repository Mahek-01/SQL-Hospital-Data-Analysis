-- CREATING TABLE
CREATE TABLE H_DATA(
	HOSPITAL_NAME VARCHAR(100),
	LOCATION VARCHAR(50),
	DEPARTMENT VARCHAR(50),
	DOCTORS_COUNT INT,
	PATIENTS_COUNT INT,
	ADMISSION_DATE DATE,
	DISCHARGE_DATE DATE,
	MEDICAL_EXPENSES NUMERIC(10,2)
);

-- IMPORTING HOSPITAL DATA
COPY H_DATA(HOSPITAL_NAME, LOCATION, DEPARTMENT, DOCTORS_COUNT, PATIENTS_COUNT, ADMISSION_DATE, DISCHARGE_DATE, MEDICAL_EXPENSES)
FROM 'D:\mahek pdf\SQL\Dataset\Hospital\Hospital_Data.csv'
CSV HEADER;

SELECT * FROM H_DATA;

-- 1) Write an SQL query to find the total number of patients across all hospitals. 
SELECT SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS 
FROM H_DATA;

-- 2) Retrieve the average count of doctors available in each hospital. 
SELECT AVG(DOCTORS_COUNT) AS AVG_COUNT_DOC
FROM H_DATA;

-- 3) Find the top 3 hospital departments that have the highest number of patients. 
SELECT DEPARTMENT, PATIENTS_COUNT
FROM H_DATA
ORDER BY PATIENTS_COUNT DESC
LIMIT 3
;

-- 4) Identify the hospital that recorded the highest medical expenses.
SELECT HOSPITAL_NAME, MEDICAL_EXPENSES
FROM H_DATA
ORDER BY MEDICAL_EXPENSES DESC
LIMIT 1
;

-- 5) Calculate the average medical expenses per day for each hospital. 
SELECT HOSPITAL_NAME, AVG(MEDICAL_EXPENSES)
FROM H_DATA
GROUP BY HOSPITAL_NAME;

-- 6) Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT PATIENTS_COUNT, ADMISSION_DATE, DISCHARGE_DATE, DISCHARGE_DATE - ADMISSION_DATE AS DIFFERENCE
FROM H_DATA
ORDER BY DIFFERENCE DESC
LIMIT 1
;

-- 7)  Count the total number of patients treated in each city. 
SELECT LOCATION, SUM(PATIENTS_COUNT)
FROM H_DATA
GROUP BY LOCATION;

-- 8) Calculate the average number of days patients spend in each department. 
SELECT DEPARTMENT, AVG(DISCHARGE_DATE - ADMISSION_DATE) AS AVG_DAY_SPEND
FROM H_DATA
GROUP BY DEPARTMENT;

-- 9) Find the department with the least number of patients. 
SELECT DEPARTMENT, PATIENTS_COUNT
FROM H_DATA
ORDER BY PATIENTS_COUNT ASC
LIMIT 1
;

-- 10) Group the data by month and calculate the total medical expenses for each month. 
SELECT 
    TO_CHAR(DATE_TRUNC('month', admission_date), 'YYYY-MM-DD') AS month_date,
    SUM(medical_expenses) AS total_expenses
FROM H_DATA
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month_date;






