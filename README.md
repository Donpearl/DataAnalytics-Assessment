# DataAnalytics-Assessment
Assessment_Q1.sql      -- file containing solution to Question 1

  BRIEF EXPLANATION
  Multi-Product High-Value Customers Scenario: The business would like to identify customers with an investment plan AND a     
  savings plan (cross-selling opportunity). Task: Create a query to return customers with one or more deposited savings plans 
  AND one or more deposited investment plans, sorted by total deposits

  APPROACH
  To identify cross-selling high-value customers, I focused on those with one or more active saving plans and one or more     
  active investment plans. I joined the customer, plan, and savings account tables to calculate the total deposits for each 
  customer. Finally, I filtered to display only customers with both plan requirements and ranked the results by their total 
  deposits to display the most valuable customers.


Assessment_Q2.sql      -- File containing solution to Question 2

  BRIEF EXPLANATION
  Transaction Frequency Analysis Scenario: The finance team wants to identify how often customers make transactions in order 
  to segment them (e.g., frequent vs. infrequent users). Task: Calculate the average transactions per customer per month and 
  segment them: ● "High Frequency" (>=10 transactions/month) ● "Medium Frequency" (3-9 transactions/month) ● "Low Frequency" 
  (<=2 transactions/month)

  APPROACH
  To understand customer transaction frequencies, I calculated the average number of successful transactions each customer 
  makes on a month-to-month basis. From this average, I segmented customers into three groups—High, Medium, and Low Frequency 
  — to help the finance department clearly discern how often customers utilize their accounts. Segmentation helps with 
  focused marketing and service efforts.

Assessment_Q3.sql      -- File containing solution to Question 3

  BRIEF EXPLANATION
  Account Inactivity Alert Scenario: The ops team wishes to mark accounts with zero inflow transactions for more than one 
  year. Task: Retrieve all active accounts (investments or savings) with zero transactions in the past 1 year (365 days).


  APPROACH
  In order to help the operations team select inactive accounts, I compiled all active (not archived, not deleted) savings or 
  investment plans with no inflow transactions at all for over a year—or none at all. This is to highlight dormant accounts 
  for further action or re-engagement.

Assessment_Q4.sql      -- File containing solution to Question 4
  BRIEF EXPLANATION
  Customer Lifetime Value (CLV) Estimation Scenario: Marketing wants to estimate CLV based on account tenure and volume of 
  transactions (simple model). Task: For each customer, if profit_per_transaction is 0.1% of the transaction, compute the 
  following: ● Account tenure (months after sign-up) ● Total transactions ● Estimated CLV (Suppose: CLV = (total_transactions 
  / tenure) * 12 * avg_profit_per_transaction) ● Order by estimated CLV in descending order

  APPROACH
  To help marketing estimate customer value, I calculated each customer's tenure in months and the number of successful 
  transactions, and I applied a basic CLV calculation with average monthly activity and a 0.1% profit per transaction rate. 
  This allows the company to select high-value customers sorted by estimated lifetime value.


CHALLENGE :
Everything looks very seemless ,I didn't encounter much difficult.

  













  
