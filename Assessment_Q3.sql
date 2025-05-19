-- Retrieve a list of inactive plans based on the date of the last transaction
SELECT 
    a.id AS plan_id,  -- Identifier for the plan
    a.owner_id,       -- ID of the customer who owns the plan
    CASE 
        WHEN a.plan_type_id = 1 THEN 'Savings'      -- Classify plan type
        WHEN a.plan_type_id = 2 THEN 'Investment'
        ELSE 'Other'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,  -- Latest transaction linked to the plan
    DATEDIFF(CURRENT_DATE(), MAX(s.transaction_date)) AS inactivity_days  -- Days since last activity
FROM 
    plans_plan a
LEFT JOIN 
    savings_savingsaccount s ON a.id = s.plan_id  -- Associate plans with their transactions
WHERE 
    a.status_id = 1       -- Filter for plans that are marked as active
    AND a.is_deleted = 0  -- Exclude plans that have been deleted
    AND a.is_archived = 0 -- Exclude archived plans
GROUP BY 
    a.id, a.owner_id, a.plan_type_id
HAVING 
    -- Only include plans that have never had a transaction 
    -- or whose last transaction was more than 1 year ago
    MAX(s.transaction_date) IS NULL 
    OR MAX(s.transaction_date) < DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)
ORDER BY 
    inactivity_days DESC;  -- Show the most inactive plans first
