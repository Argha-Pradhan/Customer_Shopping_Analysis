-- Summary
select * from customer_shopping_behavior limit 20;

-- 1. Customer count based on gender 
select gender,count(*) as Gender from customer_shopping_behavior group by gender;

-- 2. Most Purchased Category
select category,count(*) as Category_count from customer_shopping_behavior group by category  order by Category_count desc;
-- 3. Customer Rating per Category
select category,avg(review_rating) as Average_Rating from customer_shopping_behavior group by category order by Average_Rating desc;

-- 4. Top 10 purchased product
select item_purchased,count(*) as Products_count from customer_shopping_behavior group by item_purchased  order by Products_count desc limit 10;
-- 5. Top 10 highest rated product
select item_purchased,round(avg(review_rating),2) as Average_Rating from customer_shopping_behavior group by item_purchased order by Average_Rating desc limit 10;

-- 6. Most liked Category
SELECT category, COUNT(*) AS Total_Purchases, ROUND(AVG(review_rating), 2) AS Avg_Rating, ROUND(SUM(review_rating), 2) AS Total_Rating_Points FROM customer_shopping_behavior GROUP BY category ORDER BY Total_Purchases DESC;

-- 7. Total Sales from Each Category
SELECT category,sum(purchase_amount) as Total_sales FROM customer_shopping_behavior group by category order by Total_sales desc;

-- 8. Top 10 product with most revenue
select item_purchased,sum(purchase_amount) as Revenue from customer_shopping_behavior group by item_purchased order by Revenue desc limit 10;

-- 9. Most purchased category by gender
select gender, category,count(*) as Category_count from customer_shopping_behavior  group by gender,category  order by gender, Category_count desc;


-- 10. Most preffered Shipping Type
select shipping_type,count(*) as Shipping from customer_shopping_behavior group by shipping_type order by Shipping desc;

-- 11. Top 10 Order Locations
select location,count(*) as Location_count from customer_shopping_behavior group by location order by Location_count desc limit 10;

-- 12. Average spending by subscription status
select subscription_status, avg(purchase_amount) as average_spending from customer_shopping_behavior group by subscription_status;

-- 13. Discount vs Average Purchase
select discount_applied, avg(purchase_amount) as average_spending from customer_shopping_behavior group by discount_applied;

-- 14. Spending by payment method
select payment_method, sum(purchase_amount) as Revenue from customer_shopping_behavior group by payment_method order by Revenue desc;

-- 15. Top 10 Customers by Total purchase
select customer_id, sum(purchase_amount) as Revenue from customer_shopping_behavior group by customer_id order by Revenue desc;

-- 16. Top 100 Regular Customers 
select customer_id, sum(previous_purchases) as Total_purchase_count from customer_shopping_behavior group by customer_id order by Total_purchase_count desc limit 100;

