CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id VARCHAR(25) NOT NULL,
    issue_date DATE NOT NULL,
    loan_amount NUMERIC(12,2) NOT NULL,
    term_months INT NOT NULL,
    interest_rate NUMERIC(5,2) NOT NULL,
    loan_status VARCHAR(20) NOT NULL
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount NUMERIC(12,2) NOT NULL,
    days_past_due INT DEFAULT 0,
    remaining_balance NUMERIC(12,2) NOT NULL,
    CONSTRAINT fk_payments_loans
        FOREIGN KEY (loan_id)
        REFERENCES loans (loan_id)
);


select *
from loans;



COPY payments FROM 'C:/Users/Dell/Downloads/payments.csv' DELIMITER ',' CSV HEADER;


select *
from payments;

select *
from loans;

-- Total Loan Portfolio

SELECT 
		COUNT (loan_id) as total_loans
		,SUM (loan_amount) as total_loan_value
FROM loans;


--Recovered vs Outstanding 

SELECT 
		SUM (payment_amount) as recovered
		,SUM (remaining_balance) as total_Outstanding
FROM payments;


--Recovery Rate (%)

WITH total_loan_amount as (
				SELECT 
						SUM(payment_amount) as amount_paid
						,SUM(payment_amount)+SUM (remaining_balance) as total_loan_amount
				FROM payments	
) 
		SELECT 
			CONCAT(ROUND((amount_paid/total_loan_amount)*100, 2),'%') as Recovery_Rate
		FROM total_loan_amount;


--Delinquent Loans

SELECT
    COUNT(DISTINCT loan_id) AS delinquent_loans
FROM payments
WHERE days_past_due > 0;


-- Delinquency Rate (%)

SELECT 
		CONCAT(
		ROUND(
			COUNT(DISTINCT CASE WHEN days_past_due > 0 THEN loan_id END)* 100.0/
			COUNT(DISTINCT loan_id),2),'%') as delinquency_rate_pct
FROM payments;


--Monthly Recovery Trend

SELECT 
		DATE_TRUNC('MONTHS', payment_date) as months
		,SUM(payment_amount) as amount_recovered
FROM payments
GROUP BY months
ORDER BY months;


--Outstanding Balance by Loan Status

SELECT
		l.loan_status
		,SUM(p.remaining_balance) as Outstanding_Balance
		,CONCAT(ROUND((SUM(p.remaining_balance)/SUM(SUM(p.remaining_balance))OVER())*100.0,2),'%')
FROM payments p
left join loans l
			on l.loan_id=p.loan_id
GROUP BY l.loan_status
ORDER BY Outstanding_Balance;

