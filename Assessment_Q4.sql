-- Calculate an estimated Customer Lifetime Value (CLV) for currently active customers
SELECT 
    a.id AS customer_id,  --  identifier for the customers
    a.name,               -- Name of the customers
    TIMESTAMPDIFF(MONTH, a.date_joined, CURRENT_DATE()) AS tenure_months,  -- Customer's lifetime in months
    COUNT(s.id) AS total_transactions,  -- Total number of successful transactions
    ROUND(
        (COUNT(s.id) / TIMESTAMPDIFF(MONTH, a.date_joined, CURRENT_DATE())) * 12 *  -- Annualize the transaction rate
        (SUM(s.amount) * 0.001), 2) AS estimated_clv  -- Scaled and rounded CLV estimate
FROM 
    users_customuser a
LEFT JOIN 
    savings_savingsaccount s ON a.id = s.owner_id  -- Link customers to their transactions
WHERE 
    s.transaction_status = 'successful'  -- Only include successful transactions
    AND a.date_joined IS NOT NULL        -- Exclude customers with no recorded join date
    AND a.is_active = 1                  -- Limit results to active customers only
GROUP BY 
    a.id, a.name, a.date_joined
HAVING 
    tenure_months > 0  -- Ensuring  tenure is positive to avoid division-by-zero errors
ORDER BY 
    estimated_clv DESC;  -- Customer order from highest to lowest by estimated CLV
