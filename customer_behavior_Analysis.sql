-- Preview
select * from customer_shopping_behavior limit 20;

-- 1. Customer Demographics: What does the customer base look like in terms of gender distribution? 
select gender,count(*) as Gender from customer_shopping_behavior group by gender;

-- 2. Category Performance: Which product categories drive the highest purchasing activity?
select category,count(*) as Category_count from customer_shopping_behavior group by category  order by Category_count desc;

-- 3. Customer Satisfaction: Which product categories receive the highest customer satisfaction ratings?
select category,avg(review_rating) as Average_Rating from customer_shopping_behavior group by category order by Average_Rating desc;

-- 4.Product Demand: What are the top 10 products driving the highest purchase frequency?
select item_purchased,count(*) as Products_count from customer_shopping_behavior group by item_purchased  order by Products_count desc limit 10;
-- 5. Product Satisfaction: Which products consistently achieve the highest customer ratings?
select item_purchased,round(avg(review_rating),2) as Average_Rating from customer_shopping_behavior group by item_purchased order by Average_Rating desc limit 10;

-- 6. Category Popularity: Which product categories perform best in terms of both purchase volume and customer satisfaction?
SELECT category, COUNT(*) AS Total_Purchases, ROUND(AVG(review_rating), 2) AS Avg_Rating, ROUND(SUM(review_rating), 2) AS Total_Rating_Points FROM customer_shopping_behavior GROUP BY category ORDER BY Total_Purchases DESC;

-- 7. Revenue Contribution: Which product categories contribute the largest share of total revenue
SELECT category,sum(purchase_amount) as Total_sales FROM customer_shopping_behavior group by category order by Total_sales desc;

-- 8. Product Revenue: Which individual products are the biggest contributors to business revenue?
select item_purchased,sum(purchase_amount) as Revenue from customer_shopping_behavior group by item_purchased order by Revenue desc limit 10;

-- 9. Customer Preferences: How do purchasing preferences vary across customer genders?
select gender, category,count(*) as Category_count from customer_shopping_behavior  group by gender,category  order by gender, Category_count desc;


-- 10. Shipping Preferences: Which shipping methods are most commonly selected by customers?
select shipping_type,count(*) as Shipping from customer_shopping_behavior group by shipping_type order by Shipping desc;

-- 11. Geographical Performance: Which locations generate the highest order volumes?
select location,count(*) as Location_count from customer_shopping_behavior group by location order by Location_count desc limit 10;

-- 12. Subscription Analysis: Do subscribed customers spend more on average than non-subscribed customers?
select subscription_status, avg(purchase_amount) as average_spending from customer_shopping_behavior group by subscription_status;

-- 13. Discount Effectiveness: Are customers who receive discounts spending more on average than those who do not?
select discount_applied, avg(purchase_amount) as average_spending from customer_shopping_behavior group by discount_applied;

-- 14. Payment Analysis: Which payment methods account for the largest share of total revenue?
select payment_method, sum(purchase_amount) as Revenue from customer_shopping_behavior group by payment_method order by Revenue desc;

-- 15. Customer Value: Which customers contribute the most to overall business revenue?
select customer_id, sum(purchase_amount) as Revenue from customer_shopping_behavior group by customer_id order by Revenue desc;

-- 16. Customer Loyalty: Who are the most loyal customers based on their historical purchase activity?
select customer_id, sum(previous_purchases) as Total_purchase_count from customer_shopping_behavior group by customer_id order by Total_purchase_count desc limit 100;

