-- Write a query to find customers with at least one funded savings plan
-- AND one funded investment plan, sorted by total deposits.

SELECT 
    a.id AS owner_id,                            -- Customer ID
   concat(a.first_name,' ',a.last_name) as name,                                     -- Customer Name
    COUNT(CASE WHEN p.plan_type_id = 1 THEN 1 END) AS active_savings_plans,   -- Count of active savings plans
    COUNT(CASE WHEN p.plan_type_id = 2 THEN 1 END) AS active_investment_plans, -- Count of active investment plans
    COALESCE(round(SUM(s.amount),1),0) AS total_deposit_amount  -- Sum of deposits
FROM 
    users_customuser a
 JOIN 
    plans_plan p 
    
    ON a.id = p.owner_id 
    AND p.status_id = 1                        -- Only active plans considered
 JOIN 
    savings_savingsaccount s 
    ON p.id = s.plan_id
GROUP BY 
    a.id, a.name
HAVING 
    active_savings_plans > 0                    -- At least one active savings plan
    AND active_investment_plans > 0             -- At least one active investment plan
ORDER BY 
    total_deposit_amount DESC;                  -- Sort by total deposit amount, highest first
