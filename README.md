# Walmart Sales Data Analysis

## About the Project
This project focuses on analyzing Walmart sales data to understand sales performance, customer behavior, and product trends across different branches. The objective is to derive actionable insights that can help optimize sales strategies and improve business performance.

The dataset is sourced from the Kaggle Walmart Sales dataset and contains transactional sales data from three Walmart branches.

## Objectives
- Analyze sales performance by branch, city, and product line  
- Identify top-performing products and customer segments  
- Understand revenue, VAT, and profitability trends  
- Explore customer behavior based on time, gender, and payment methods  

## Dataset Overview
- **Source:** Kaggle – Walmart Sales Dataset  
- **Branches:** 3 (Yangon, Mandalay, Naypyitaw)  
- **Rows:** 1000  
- **Columns:** 17  

## Key Columns
- Invoice ID  
- Branch  
- City  
- Customer Type  
- Gender  
- Product Line  
- Unit Price  
- Quantity  
- VAT (5%)  
- Total Sales  
- Date  
- Time  
- Payment Method  
- COGS  
- Gross Margin Percentage  
- Gross Income  
- Rating  

## Tools & Technologies
- **Database:** MySQL  
- **Language:** SQL  
- **Data Format:** CSV

## Analysis Performed

The following business questions were fully analyzed using SQL:

## Product Analysis
- How many unique product lines does the data have?
- What is the most common payment method?
- What is the most selling product line?
- What is the total revenue by month?
- Which month had the largest COGS?
- Which product line generated the highest revenue?
- Which city has the largest revenue?
- Which product line had the highest VAT?
- Classified product lines as **Good / Bad** based on average sales
- Which branch sold more products than the average?
- What is the most common product line by gender?
- What is the average rating of each product line?

## Sales Analysis
- Number of sales made in each time of the day per weekday
- Which customer type brings the most revenue?
- Which city contributes the highest VAT?
- Which customer type pays the most VAT?

## Customer Analysis
- How many unique customer types exist?
- How many unique payment methods are used?
- What is the most common customer type?
- Which customer type buys the most products?
- What is the gender distribution of customers?
- Gender distribution per branch
- Which time of day receives the most ratings?
- Which time of day receives the most ratings per branch?
- Which weekday has the best average ratings?
- Which weekday has the best average ratings per branch?
