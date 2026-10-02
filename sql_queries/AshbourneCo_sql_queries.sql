
-- Using [AshbourneCo] database
use [AshbourneCo];

/*
============================================================================
                    ASHBOURNE & CO.
              LUXURY FASHION RETAIL ANALYTICS
============================================================================

DATABASE:
AshbourneCo

PROJECT TYPE:
Retail Analytics / Business Intelligence / SQL Data Analysis

============================================================================
1. DESCRIPTION
============================================================================

Ashbourne & Co. is a premium British fashion retailer operating through
Flagship, Boutique, Outlet, and E-Commerce channels.

This SQL analytics project uses a relational retail database to analyze
sales performance, profitability, customer behavior, store operations,
inventory, and marketing effectiveness.

The database contains transactional sales data together with customer,
product, store, inventory, and marketing campaign information.

The analysis is designed to simulate a real-world analytics workflow where
business stakeholders provide operational and strategic questions and the
Data Analytics team uses SQL to transform those requirements into
actionable business insights.

The project demonstrates practical SQL techniques including:

• INNER JOIN and LEFT JOIN
• GROUP BY and HAVING
• Common Table Expressions (CTEs)
• Window Functions
• LAG() and RANK()
• Running totals
• Self-joins
• CASE statements
• Date-based analysis
• Aggregations
• Subqueries
• PERCENTILE_CONT()
• Conditional calculations
• Revenue and profitability analysis
• Customer retention analysis
• Inventory analysis
• Marketing ROI analysis

============================================================================
2. TABLES
============================================================================

The Ashbourne & Co. database contains the following tables:

1. customers
   - Customer master data
   - Demographics
   - Income bracket
   - Acquisition source
   - City
   - Loyalty tier

2. products
   - Product master data
   - Category
   - Sub-category
   - Season
   - Material
   - Unit cost
   - Retail price

3. stores
   - Store information
   - Store name
   - City
   - Store type
   - Square footage
   - Opening date

4. orders
   - Central transactional fact table
   - Customer
   - Product
   - Store
   - Marketing campaign
   - Order date
   - Quantity
   - Discount
   - Sales
   - COGS
   - Profit
   - Return status
   - Rating
   - Delivery date

5. inventory
   - Inventory records by product and store
   - Stock level
   - Last restock date

6. marketing_campaigns
   - Marketing campaign information
   - Campaign name
   - Channel
   - Budget
   - Start date
   - End date


============================================================================
3. DATABASE STRUCTURE / ER DIAGRAM
============================================================================

                         ┌──────────────────┐
                         │    customers     │
                         ├──────────────────┤
                         │ PK customer_id   │
                         └────────┬─────────┘
                                  │
                                  │ 1
                                  │
                                  │ ∞
                         ┌────────▼─────────┐
                         │      orders      │
                         ├──────────────────┤
                         │ PK order_id      │
                         │ FK customer_id   │
                         │ FK product_id    │
                         │ FK store_id      │
                         │ FK campaign_id   │
                         └────┬────┬────┬───┘
                              │    │    │
                         ∞    │    │    │    ∞
                              │    │    │
               ┌──────────────┘    │    └──────────────┐
               │                   │                   │
               │                   │                   │
        ┌──────▼──────┐     ┌──────▼──────┐    ┌──────▼─────────────┐
        │   products  │     │    stores   │    │ marketing_campaigns│
        ├─────────────┤     ├─────────────┤    ├─────────────────────┤
        │PK product_id│     │PK store_id  │    │PK campaign_id      │
        └──────┬──────┘     └──────┬──────┘    └─────────────────────┘
               │                   │
               │ 1                 │ 1
               │                   │
               │ ∞                 │ ∞
        ┌──────▼───────────────────▼──────┐
        │             inventory            │
        ├──────────────────────────────────┤
        │ PK inventory_id                  │
        │ FK product_id                   │
        │ FK store_id                     │
        └──────────────────────────────────┘


KEY RELATIONSHIPS:

customers
    1 ─────────────── ∞ orders

products
    1 ─────────────── ∞ orders

stores
    1 ─────────────── ∞ orders

marketing_campaigns
    1 ─────────────── ∞ orders

products
    1 ─────────────── ∞ inventory

stores
    1 ─────────────── ∞ inventory


============================================================================
4. PRIMARY ANALYTICAL FOCUS
============================================================================

The SQL analysis focuses on five major business areas:

1. Sales & Profitability Analytics
   - Category revenue
   - Discounts
   - Store profitability
   - Seasonal performance
   - Monthly revenue growth
   - Cumulative profit

2. Customer Behavior & Retention
   - High-value customers
   - Customer lifetime value
   - Customer ranking
   - Customer churn risk
   - Market basket combinations

3. Stores & Operations
   - Low-stock products
   - Return volume
   - E-Commerce delivery performance
   - Unsold products

4. Products & Marketing
   - Major marketing campaigns
   - Campaign ROI
   - Material profitability
   - Product revenue concentration
   - Pricing bands

5. Strategic Business Analysis
   - Revenue optimization
   - Customer retention
   - Inventory management
   - Store performance
   - Marketing effectiveness
   - Product profitability


============================================================================
5. BUSINESS CONTEXT
============================================================================

Ashbourne & Co. was founded in 2011 in London's Covent Garden and has
grown into a premium British clothing retailer serving Men, Women, and
Kids through physical stores and an E-Commerce platform.

The company has experienced strong revenue growth, but management has
identified pressure on profit margins.

Key business challenges include:

• Inventory allocation between digital and physical channels
• Heavy promotional discounting in Outlet stores
• Increasing dependence on digital marketing
• Unclear marketing ROI
• Potential discount-related margin pressure
• Customer retention and churn concerns
• Inventory availability and stock-level management
• Differences in performance across store formats
• Seasonal variations in product demand

The executive board requires a data-driven analysis of omni-channel
performance covering January 2023 through December 2025.

The objective is to use SQL-based analysis to understand the drivers of
revenue, profitability, customer value, inventory performance, store
performance, and marketing effectiveness.

The insights generated from this analysis can support decisions related
to operational budgets, store planning, inventory allocation, customer
retention, product strategy, and marketing investment.


============================================================================
6. SQL ANALYTICAL REQUIREMENTS
============================================================================

The following 20 business questions have been defined for the Ashbourne &
Co. SQL analytics project.

----------------------------------------------------------------------------
SALES & PROFITABILITY ANALYTICS
----------------------------------------------------------------------------

1. CATEGORY REVENUE

Calculate total net_sales and quantity sold for each product category,
sorted in descending order by revenue.


2. DISCOUNT IMPACT

Find the average discount_pct applied specifically to orders processed
at 'Outlet' store types.


3. STORE PROFITABILITY

Join Orders and Stores to calculate total profit generated by each
store_name.

Exclude 'E-Commerce'.


4. SEASONAL PERFORMANCE

Extract the Month from order_date and aggregate total gross_sales for
'Autumn/Winter' versus 'Spring/Summer' products per month.


5. MONTH-OVER-MONTH GROWTH

Create a CTE for total monthly revenue.

Use the LAG() function to calculate the Month-over-Month percentage
growth rate for the 2024 calendar year.


6. RUNNING CUMULATIVE PROFIT

Calculate the cumulative running total of profit over the year 2025,
ordered chronologically by order_date.


----------------------------------------------------------------------------
CUSTOMER BEHAVIOR & RETENTION
----------------------------------------------------------------------------

7. HIGH-VALUE VIPs

Retrieve the names and emails of all Platinum-tier customers located
in the flagship city of London.


8. CUSTOMER LIFETIME VALUE

Group by customer_id to calculate:

• Total Spend
• Total Order Count

Use HAVING to filter for customers spending over £1,500.


9. TOP CUSTOMER PER CITY

Use the RANK() function to identify the highest-spending customer
in each city.


10. CUSTOMER CHURN RISK

Find customers who placed an order in 2023 or 2024 but have not placed
any orders in the last 12 months relative to December 31, 2025.


11. MARKET BASKET INDICATOR

Using self-joins, identify the top 5 most frequent sub_category
combinations purchased by the same customer on the same date.


----------------------------------------------------------------------------
STORES & OPERATIONS
----------------------------------------------------------------------------

12. LOW STOCK ALERTS

List all products currently showing a stock_level below 20 units
across any physical store location.


13. RETURN VOLUME

Count the total number of 'Returned' orders and calculate this as a
percentage of overall transaction volume.


14. DELIVERY SLA

For all E-Commerce orders, calculate the date difference between
order_date and delivery_date.

Find the average delivery time per month.


15. UNSOLD INVENTORY

Use a LEFT JOIN to find products in the Products table that have
never been recorded in the Orders fact table.


----------------------------------------------------------------------------
PRODUCTS & MARKETING
----------------------------------------------------------------------------

16. MAJOR CAMPAIGNS

Select all marketing campaigns that launched in 2024 with an allocated
budget exceeding £20,000.


17. CAMPAIGN ROI

Join Marketing Campaigns to Orders.

Calculate:

• Net revenue attributed to each campaign
• Campaign budget
• True monetary ROI

Formula:

Monetary ROI = Attributed Net Revenue - Campaign Budget


18. MATERIAL MARGINS

Find the top 3 product material types by average profit margin.

Only include materials with at least 100 historical orders.


19. PARETO PRINCIPLE — 80/20 RULE

Use a cumulative window function to determine whether the top 20% of
highest-selling products account for approximately 80% of total revenue.


20. PRICING BANDS

Categorize products into:

• Entry
• Mid
• Luxury

based on retail_price quartiles.

Then calculate the total number of units sold in each pricing band.


============================================================================
7. OBJECTIVE
============================================================================

The primary objective of this SQL project is to transform business
requirements into meaningful, data-driven insights.

The analysis is designed to support:

• Revenue optimization
• Profitability improvement
• Customer retention
• Customer lifetime value analysis
• Inventory optimization
• Store performance evaluation
• Product pricing strategy
• Marketing campaign evaluation
• Campaign ROI analysis
• Return management
• E-Commerce delivery analysis
• Product portfolio optimization
• Strategic decision-making

The project demonstrates how SQL can be used to move from raw relational
data to actionable business intelligence.

============================================================================
END OF PROJECT DOCUMENTATION
============================================================================
*/





/*

============================================================================
                    SALES & PROFITABILITY ANALYTICS
============================================================================


----------------------------------------------------------------------------
1. CATEGORY REVENUE
----------------------------------------------------------------------------

BUSINESS QUESTION:
Calculate total net_sales and quantity sold for each product category,
sorted descending by revenue.

SOLUTION:
*/

SELECT
    p.category,
    SUM(o.net_sales) AS total_net_sales,
    SUM(o.quantity) AS total_quantity_sold
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
GROUP BY
    p.category
ORDER BY
    total_net_sales DESC;


/*
----------------------------------------------------------------------------
2. DISCOUNT IMPACT
----------------------------------------------------------------------------

BUSINESS QUESTION:
Find the average discount_pct applied specifically to orders processed
at 'Outlet' store types.

SOLUTION:
*/

SELECT
    AVG(o.discount_pct) AS average_discount_pct
FROM orders AS o
INNER JOIN stores AS s
    ON o.store_id = s.store_id
WHERE
    s.store_type = 'Outlet';


/*
----------------------------------------------------------------------------
3. STORE PROFITABILITY
----------------------------------------------------------------------------

BUSINESS QUESTION:
Join Orders and Stores to calculate total profit generated by each
store_name.

Exclude 'E-Commerce'.

SOLUTION:
*/

SELECT
    s.store_name,
    SUM(o.profit) AS total_profit
FROM orders AS o
INNER JOIN stores AS s
    ON o.store_id = s.store_id
WHERE
    s.store_type <> 'E-Commerce'
GROUP BY
    s.store_name
ORDER BY
    total_profit DESC;


/*
----------------------------------------------------------------------------
4. SEASONAL PERFORMANCE
----------------------------------------------------------------------------

BUSINESS QUESTION:
Extract the Month from order_date and aggregate total gross_sales for
'Autumn/Winter' vs. 'Spring/Summer' products per month.

SOLUTION:
*/

SELECT
    MONTH(o.order_date) AS order_month,
    p.season,
    SUM(o.gross_sales) AS total_gross_sales
FROM orders AS o
INNER JOIN products AS p
    ON o.product_id = p.product_id
WHERE
    p.season IN ('Autumn/Winter', 'Spring/Summer')
GROUP BY
    MONTH(o.order_date),
    p.season
ORDER BY
    order_month,
    p.season;


/*
----------------------------------------------------------------------------
5. MONTH-OVER-MONTH GROWTH
----------------------------------------------------------------------------

BUSINESS QUESTION:
Create a CTE for total monthly revenue.

Use the LAG() function to calculate the Month-over-Month percentage
growth rate for the 2024 calendar year.

SOLUTION:
*/

WITH monthly_revenue AS
(
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(net_sales) AS monthly_revenue
    FROM orders
    WHERE
        YEAR(order_date) = 2024
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),

revenue_with_lag AS
(
    SELECT
        order_year,
        order_month,
        monthly_revenue,

        LAG(monthly_revenue) OVER (
            ORDER BY order_month
        ) AS previous_month_revenue

    FROM monthly_revenue
)

SELECT
    order_year,
    order_month,
    monthly_revenue,
    previous_month_revenue,

    ROUND(
        (
            monthly_revenue - previous_month_revenue
        ) * 100.0
        / NULLIF(previous_month_revenue, 0),
        2
    ) AS mom_growth_pct

FROM revenue_with_lag

ORDER BY
    order_month;


/*
----------------------------------------------------------------------------
6. RUNNING CUMULATIVE PROFIT
----------------------------------------------------------------------------

BUSINESS QUESTION:
Calculate the cumulative running total of profit over the year 2025,
ordered chronologically by order_date.

SOLUTION:
*/

WITH daily_profit AS
(
    SELECT
        order_date,
        SUM(profit) AS daily_profit
    FROM orders
    WHERE
        YEAR(order_date) = 2025
    GROUP BY
        order_date
)

SELECT
    order_date,
    daily_profit,

    SUM(daily_profit) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_profit

FROM daily_profit

ORDER BY
    order_date;


/*
----------------------------------------------------------------------------
7. HIGH-VALUE VIPs
----------------------------------------------------------------------------

BUSINESS QUESTION:
Retrieve all Platinum-tier customers located in the flagship city
of 'London'.

NOTE:
The Customers table does not contain customer_name or email.
Therefore, customer_id and available customer attributes are returned.

SOLUTION:
*/

SELECT
    customer_id,
    gender,
    age,
    income_bracket,
    acquisition_source,
    city,
    join_date,
    loyalty_tier
FROM customers
WHERE
    loyalty_tier = 'Platinum'
    AND city = 'London'
ORDER BY
    customer_id;

/*
----------------------------------------------------------------------------
8. CUSTOMER LIFETIME VALUE
----------------------------------------------------------------------------

BUSINESS QUESTION:
Group by customer_id to calculate Total Spend and Total Order Count.

Use HAVING to filter for customers spending over £1,500.

SOLUTION:
*/

SELECT
    c.customer_id,
    c.city,
    c.loyalty_tier,

    SUM(o.net_sales) AS total_spend,

    COUNT(DISTINCT o.order_id) AS total_order_count

FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.city,
    c.loyalty_tier

HAVING
    SUM(o.net_sales) > 1500

ORDER BY
    total_spend DESC;

/*
----------------------------------------------------------------------------
9. TOP CUSTOMER PER CITY
----------------------------------------------------------------------------

BUSINESS QUESTION:
Use the RANK() function to identify the single highest-spending customer
in each city.

NOTE:
The customers table does not contain customer_name.
Therefore, customer_id is used to identify the customer.

SOLUTION:
*/

WITH customer_spend AS
(
    SELECT
        c.city,
        c.customer_id,
        c.loyalty_tier,

        SUM(o.net_sales) AS total_spend

    FROM customers AS c

    INNER JOIN orders AS o
        ON c.customer_id = o.customer_id

    GROUP BY
        c.city,
        c.customer_id,
        c.loyalty_tier
),

ranked_customers AS
(
    SELECT
        city,
        customer_id,
        loyalty_tier,
        total_spend,

        RANK() OVER (
            PARTITION BY city
            ORDER BY total_spend DESC
        ) AS spend_rank

    FROM customer_spend
)

SELECT
    city,
    customer_id,
    loyalty_tier,
    total_spend

FROM ranked_customers

WHERE
    spend_rank = 1

ORDER BY
    city;


/*
----------------------------------------------------------------------------
10. CUSTOMER CHURN RISK
----------------------------------------------------------------------------

BUSINESS QUESTION:
Find customers who placed an order in 2023 or 2024 but have not placed
any orders in the last 12 months relative to December 31, 2025.

NOTE:
The customers table does not contain customer_name or email.
Therefore, customer_id, city, and loyalty_tier are used.

SOLUTION:
*/

SELECT
    c.customer_id,
    c.city,
    c.loyalty_tier,

    MAX(o.order_date) AS last_order_date

FROM customers AS c

INNER JOIN orders AS o
    ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.city,
    c.loyalty_tier

HAVING
    -- Customer must have placed an order during 2023 or 2024
    MAX(
        CASE
            WHEN o.order_date >= '2023-01-01'
             AND o.order_date < '2025-01-01'
            THEN o.order_date
        END
    ) IS NOT NULL

    -- Customer must have no orders during 2025
    AND MAX(o.order_date) < '2025-01-01'

ORDER BY
    last_order_date;

/*
----------------------------------------------------------------------------
11. MARKET BASKET INDICATOR
----------------------------------------------------------------------------

BUSINESS QUESTION:
Using self-joins, identify the top 5 most frequent sub_category
combinations purchased by the same customer on the same date.

SOLUTION:
*/

SELECT TOP 5

    p1.sub_category AS sub_category_1,

    p2.sub_category AS sub_category_2,

    COUNT(*) AS combination_frequency

FROM orders AS o1

INNER JOIN orders AS o2
    ON o1.customer_id = o2.customer_id
    AND o1.order_date = o2.order_date
    AND o1.product_id < o2.product_id

INNER JOIN products AS p1
    ON o1.product_id = p1.product_id

INNER JOIN products AS p2
    ON o2.product_id = p2.product_id

WHERE
    p1.sub_category <> p2.sub_category

GROUP BY
    p1.sub_category,
    p2.sub_category

ORDER BY
    combination_frequency DESC;


/*
============================================================================
                    STORES & OPERATIONS
============================================================================


----------------------------------------------------------------------------
12. LOW STOCK ALERTS
----------------------------------------------------------------------------

BUSINESS QUESTION:
List all products currently showing a stock_level below 20 units
across any physical store location.

SOLUTION:
*/

SELECT
    p.product_id,
    p.product_name,
    s.store_name,
    s.city,
    i.stock_level

FROM inventory AS i

INNER JOIN products AS p
    ON i.product_id = p.product_id

INNER JOIN stores AS s
    ON i.store_id = s.store_id

WHERE
    i.stock_level < 20

    AND s.store_type <> 'E-Commerce'

ORDER BY
    i.stock_level ASC;


/*
----------------------------------------------------------------------------
13. RETURN VOLUME
----------------------------------------------------------------------------

BUSINESS QUESTION:
Count the total number of 'Returned' orders and calculate this as a
percentage of overall transaction volume.

SOLUTION:
*/

SELECT

    COUNT(
        DISTINCT CASE
            WHEN return_status = 'Returned'
            THEN order_id
        END
    ) AS returned_orders,

    COUNT(
        DISTINCT order_id
    ) AS total_orders,

    ROUND(

        COUNT(
            DISTINCT CASE
                WHEN return_status = 'Returned'
                THEN order_id
            END
        ) * 100.0

        /

        NULLIF(
            COUNT(DISTINCT order_id),
            0
        ),

        2

    ) AS return_rate_pct

FROM orders;


/*
----------------------------------------------------------------------------
14. DELIVERY SLA
----------------------------------------------------------------------------

BUSINESS QUESTION:
For all E-Commerce orders, calculate the date difference between
order and delivery dates.

Find the average delivery time per month.

SOLUTION:
*/

SELECT

    YEAR(o.order_date) AS order_year,

    MONTH(o.order_date) AS order_month,

    AVG(
        DATEDIFF(
            DAY,
            o.order_date,
            o.delivery_date
        ) * 1.0
    ) AS average_delivery_days

FROM orders AS o

INNER JOIN stores AS s
    ON o.store_id = s.store_id

WHERE
    s.store_type = 'E-Commerce'

    AND o.delivery_date IS NOT NULL

GROUP BY
    YEAR(o.order_date),
    MONTH(o.order_date)

ORDER BY
    order_year,
    order_month;


/*
----------------------------------------------------------------------------
15. UNSOLD INVENTORY
----------------------------------------------------------------------------

BUSINESS QUESTION:
Use a LEFT JOIN to find any items in the Products table that have
never been recorded in the Orders fact table.

SOLUTION:
*/

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category

FROM products AS p

LEFT JOIN orders AS o
    ON p.product_id = o.product_id

WHERE
    o.product_id IS NULL

ORDER BY
    p.product_id;


/*
============================================================================
                    PRODUCTS & MARKETING
============================================================================


----------------------------------------------------------------------------
16. MAJOR CAMPAIGNS
----------------------------------------------------------------------------

BUSINESS QUESTION:
Select all marketing campaigns that launched in 2024 with an allocated
budget exceeding £20,000.

SOLUTION:
*/

SELECT
    campaign_id,
    campaign_name,
    channel,
    budget,
    start_date,
    end_date

FROM marketing_campaigns

WHERE
    start_date >= '2024-01-01'
    AND start_date < '2025-01-01'
    AND budget > 20000

ORDER BY
    budget DESC;


/*
----------------------------------------------------------------------------
17. CAMPAIGN ROI
----------------------------------------------------------------------------

BUSINESS QUESTION:
Join Campaigns to Orders.

Calculate net revenue attributed to each campaign, subtract the budget,
and output the true monetary ROI.

Formula:

Monetary ROI =
Attributed Net Revenue - Campaign Budget

SOLUTION:
*/

SELECT

    mc.campaign_id,

    mc.campaign_name,

    mc.budget,

    COALESCE(
        SUM(o.net_sales),
        0
    ) AS attributed_net_revenue,

    COALESCE(
        SUM(o.net_sales),
        0
    ) - mc.budget AS monetary_roi

FROM marketing_campaigns AS mc

LEFT JOIN orders AS o
    ON mc.campaign_id = o.campaign_id

GROUP BY
    mc.campaign_id,
    mc.campaign_name,
    mc.budget

ORDER BY
    monetary_roi DESC;


/*
----------------------------------------------------------------------------
18. MATERIAL MARGINS
----------------------------------------------------------------------------

BUSINESS QUESTION:
Find the top 3 product material types by average profit margin,
ensuring only materials with at least 100 historical orders are included.

SOLUTION:
*/

SELECT TOP 3

    p.material,

    COUNT(
        DISTINCT o.order_id
    ) AS historical_orders,

    ROUND(

        AVG(
            o.profit * 100.0
            / NULLIF(o.net_sales, 0)
        ),

        2

    ) AS average_profit_margin_pct

FROM orders AS o

INNER JOIN products AS p
    ON o.product_id = p.product_id

GROUP BY
    p.material

HAVING
    COUNT(DISTINCT o.order_id) >= 100

ORDER BY
    average_profit_margin_pct DESC;


/*
----------------------------------------------------------------------------
19. PARETO PRINCIPLE — 80/20 RULE
----------------------------------------------------------------------------

BUSINESS QUESTION:
Use a cumulative window function to determine if the top 20% of
highest-selling products account for 80% of total revenue.

SOLUTION:
*/

WITH product_revenue AS
(
    SELECT

        p.product_id,

        p.product_name,

        SUM(o.net_sales) AS total_revenue

    FROM products AS p

    INNER JOIN orders AS o
        ON p.product_id = o.product_id

    GROUP BY
        p.product_id,
        p.product_name
),

ranked_products AS
(
    SELECT

        product_id,

        product_name,

        total_revenue,

        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS product_rank,

        COUNT(*) OVER () AS total_products,

        SUM(total_revenue) OVER () AS overall_revenue,

        SUM(total_revenue) OVER (
            ORDER BY total_revenue DESC

            ROWS BETWEEN
                UNBOUNDED PRECEDING
                AND CURRENT ROW
        ) AS cumulative_revenue

    FROM product_revenue
),

pareto_analysis AS
(
    SELECT

        product_id,

        product_name,

        total_revenue,

        product_rank,

        total_products,

        overall_revenue,

        cumulative_revenue,

        product_rank * 100.0
            / total_products
            AS cumulative_product_pct,

        cumulative_revenue * 100.0
            / overall_revenue
            AS cumulative_revenue_pct

    FROM ranked_products
)

SELECT

    product_rank,

    product_id,

    product_name,

    total_revenue,

    ROUND(
        cumulative_product_pct,
        2
    ) AS cumulative_product_pct,

    ROUND(
        cumulative_revenue_pct,
        2
    ) AS cumulative_revenue_pct

FROM pareto_analysis

WHERE
    cumulative_product_pct <= 20

ORDER BY
    product_rank;


/*
----------------------------------------------------------------------------
19A. PARETO SUMMARY
----------------------------------------------------------------------------

This version returns one result showing how much revenue is generated
by the top 20% of products.
*/

WITH product_revenue AS
(
    SELECT

        p.product_id,

        SUM(o.net_sales) AS total_revenue

    FROM products AS p

    INNER JOIN orders AS o
        ON p.product_id = o.product_id

    GROUP BY
        p.product_id
),

ranked_products AS
(
    SELECT

        product_id,

        total_revenue,

        ROW_NUMBER() OVER (
            ORDER BY total_revenue DESC
        ) AS product_rank,

        COUNT(*) OVER () AS total_products,

        SUM(total_revenue) OVER () AS overall_revenue

    FROM product_revenue
)

SELECT

    COUNT(*) AS top_20_percent_product_count,

    ROUND(
        SUM(total_revenue),
        2
    ) AS top_20_percent_revenue,

    ROUND(

        SUM(total_revenue) * 100.0
        / MAX(overall_revenue),

        2

    ) AS revenue_contribution_pct

FROM ranked_products

WHERE
    product_rank <= CEILING(
        total_products * 0.20
    );


/*
----------------------------------------------------------------------------
20. PRICING BANDS
----------------------------------------------------------------------------

BUSINESS QUESTION:
Categorize products into 'Entry', 'Mid', and 'Luxury' based on
retail_price quartiles, and count total units sold in each band.

SOLUTION:
*/

WITH price_quartiles AS
(
    SELECT

        product_id,

        product_name,

        retail_price,

        PERCENTILE_CONT(0.25)
            WITHIN GROUP (
                ORDER BY retail_price
            ) OVER () AS q1,

        PERCENTILE_CONT(0.75)
            WITHIN GROUP (
                ORDER BY retail_price
            ) OVER () AS q3

    FROM products
),

product_bands AS
(
    SELECT

        product_id,

        product_name,

        retail_price,

        CASE

            WHEN retail_price <= q1
                THEN 'Entry'

            WHEN retail_price <= q3
                THEN 'Mid'

            ELSE 'Luxury'

        END AS pricing_band

    FROM price_quartiles
)

SELECT

    pb.pricing_band,

    SUM(
        COALESCE(o.quantity, 0)
    ) AS total_units_sold

FROM product_bands AS pb

LEFT JOIN orders AS o
    ON pb.product_id = o.product_id

GROUP BY
    pb.pricing_band

ORDER BY

    CASE pb.pricing_band

        WHEN 'Entry' THEN 1

        WHEN 'Mid' THEN 2

        WHEN 'Luxury' THEN 3

    END;


/*
============================================================================
                         END OF ANALYSIS
============================================================================

TOTAL BUSINESS QUESTIONS: 20

MAIN SQL CONCEPTS USED:

1.  SELECT / WHERE
2.  INNER JOIN
3.  LEFT JOIN
4.  GROUP BY
5.  HAVING
6.  ORDER BY
7.  CASE WHEN
8.  CTEs
9.  LAG()
10. RANK()
11. ROW_NUMBER()
12. Window Functions
13. Running Totals
14. Self-JOIN
15. Subqueries
16. DATEADD()
17. DATEDIFF()
18. MONTH() / YEAR()
19. PERCENTILE_CONT()
20. Conditional Aggregation
21. COALESCE()
22. NULLIF()
23. Pareto Analysis
24. Customer LTV Analysis
25. Market Basket Analysis

============================================================================
*/