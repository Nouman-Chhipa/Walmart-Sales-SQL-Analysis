-- Import data from csv using table import wizard

SELECT *
FROM walmartsalesdata;

-- How many unique cities does the data have?

SELECT COUNT(DISTINCT city) AS unique_cities
FROM walmartsalesdata;

-- In which city is each branch?

SELECT DISTINCT branch, city
FROM walmartsalesdata
ORDER BY branch
;

-- How many unique product lines does the data have?

SELECT COUNT(DISTINCT `Product line`) AS unique_products
FROM walmartsalesdata
;

-- What is the most common payment method?

SELECT payment, count(*) AS Count_of_payment
FROM walmartsalesdata
GROUP BY payment
ORDER BY Count_of_payment DESC
LIMIT 1
;

-- What is the most selling product line?

SELECT
    `Product line`,
    SUM(quantity) AS total_units_sold
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY total_units_sold DESC
LIMIT 1;

-- What is the total revenue by month?

SELECT
    DATE_FORMAT(`date`, '%Y-%m') AS month,
    SUM(total) AS total_revenue
FROM walmartsalesdata
GROUP BY month
ORDER BY month;

-- What month had the largest COGS?

SELECT DATE_FORMAT(`date`, '%Y-%m') AS month, SUM(cogs) AS total_cog
FROM walmartsalesdata
GROUP BY month
ORDER BY total_cog DESC
LIMIT 1
;

-- What product line had the largest revenue?

SELECT `Product line`, SUM(total) AS total_revenue
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY total_revenue DESC
LIMIT 1
;

-- What is the city with the largest revenue?

SELECT City, SUM(total) AS total_revenue
FROM walmartsalesdata
GROUP BY City
ORDER BY total_revenue DESC
LIMIT 1
;

-- What product line had the largest VAT?

SELECT `Product line`, SUM(`Tax 5%`) AS Total_tax
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY Total_tax DESC
LIMIT 1
;

-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales

SELECT
    `product line`,
    CASE
        WHEN AVG(quantity) > (SELECT AVG(quantity) FROM walmartsalesdata)
            THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM walmartsalesdata
GROUP BY `product line`;

-- Which branch sold more products than average product sold?

SELECT Branch, AVG(quantity) AS avg_qty
FROM walmartsalesdata
GROUP BY Branch
HAVING AVG(quantity) > (SELECT AVG(quantity) FROM walmartsalesdata)
;

-- What is the most common product line by gender?

SELECT
    gender,
    `Product line`,
    COUNT(*) AS product_count
FROM walmartsalesdata
GROUP BY gender, `Product line`
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT
            gender,
            `Product line`,
            COUNT(*) AS cnt
        FROM walmartsalesdata
        GROUP BY gender, `Product line`
    ) t
    WHERE t.gender = walmartsalesdata.gender
);

-- What is the average rating of each product line?

SELECT `Product line`, ROUND(AVG(rating), 2) AS avg_rating
FROM walmartsalesdata
GROUP BY `Product line`
;

-- Number of sales made in each time of the day per weekday

SELECT
    DAYNAME(`date`) AS weekday,
    CASE
        WHEN `time` BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN `time` BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS number_of_sales
FROM walmartsalesdata
GROUP BY
    weekday,
    time_of_day
ORDER BY
    FIELD(weekday,
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
    ),
    time_of_day;

-- Which of the customer types brings the most revenue?

SELECT
    `Customer type`,
    ROUND(SUM(`Total`),2) AS sum_of_sales
FROM walmartsalesdata
GROUP BY `Customer type`
ORDER BY sum_of_sales DESC
LIMIT 1;

-- Which city has the largest tax percent/ VAT (Value Added Tax)?

SELECT city, SUM(`Tax 5%`) AS total_tax
FROM walmartsalesdata
GROUP BY city
ORDER BY total_tax DESC
LIMIT 1
;

-- Which customer type pays the most in VAT?

SELECT `Customer type`, SUM(`Tax 5%`) AS total_tax
FROM walmartsalesdata
GROUP BY `Customer type`
ORDER BY total_tax DESC
LIMIT 1
;

-- How many unique customer types does the data have?

SELECT COUNT(DISTINCT `Customer type`) AS unique_customer_types
FROM walmartsalesdata
;

-- How many unique payment methods does the data have?

SELECT COUNT(DISTINCT payment) AS unique_payment_types
FROM walmartsalesdata
;

-- What is the most common customer type?

SELECT `Customer type`, COUNT(*)  AS common_customer_type
FROM walmartsalesdata
GROUP BY `Customer type`
ORDER BY common_customer_type DESC
LIMIT 1
;

-- Which customer type buys the most?

SELECT `Customer type`, SUM(Quantity)  AS most_buying
FROM walmartsalesdata
GROUP BY `Customer type`
ORDER BY most_buying DESC
LIMIT 1
;

-- What is the gender of most of the customers?

SELECT Gender, COUNT(*) gender_count
FROM walmartsalesdata
GROUP BY gender
ORDER BY gender_count DESC
LIMIT 1
;

-- What is the gender distribution per branch?

SELECT branch, gender, COUNT(*) AS gender_dist
FROM walmartsalesdata
GROUP BY branch, gender
ORDER BY Branch
;

-- Which time of the day do customers give most ratings?

SELECT
    CASE
        WHEN `time` BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN `time` BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS rating_count
FROM walmartsalesdata
GROUP BY time_of_day
ORDER BY rating_count DESC
;
 
-- Which time of the day do customers give most ratings per branch?

SELECT branch, 
    CASE
        WHEN `time` BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN `time` BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day,
    COUNT(*) AS rating_count
FROM walmartsalesdata
GROUP BY branch, time_of_day
ORDER BY branch, rating_count desc
;
 
-- Which day of the week has the best avg ratings?

SELECT 
	DAYNAME(`Date`) AS weekday,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM walmartsalesdata
GROUP BY weekday
ORDER BY Avg_Rating DESC
;

-- Which day of the week has the best average ratings per branch?

SELECT 
	DAYNAME(`Date`) AS weekday, Branch,
    ROUND(AVG(Rating), 2) AS Avg_Rating
FROM walmartsalesdata
GROUP BY Branch, weekday
ORDER BY
    FIELD(weekday,
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
    ),
    Avg_Rating DESC
;
