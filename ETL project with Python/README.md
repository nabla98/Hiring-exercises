# Company Hiring Exercise for SSr/Sr Data Engineer Position

This exercise is designed to evaluate your data engineering skills using real-world financial data while allowing you to demonstrate your problem-solving approach and technical expertise.

## Exercise Overview

You'll be tasked with designing and implementing a data pipeline that extracts, transforms, and loads financial data from Yahoo Finance into a queryable data store for analysis. This exercise allows for creative problem-solving while using AI tools to assist your implementation.

**Objective**: Build an end-to-end data pipeline for analyzing stock market performance across different sectors.

### Requirements

#### Data Extraction

- Use the yfinance Python package to extract historical stock data from Yahoo Finance

- Select 8-10 companies across at least 3 different industry sectors (e.g., Technology, Healthcare, Financial Services)

- Pull daily price data (open, high, low, close, volume) for the past 2 years

- Extract key financial metrics from income statements and balance sheets

#### Data Processing & Storage

- Design an appropriate data model for storing both time-series price data and financial metrics

- Implement data quality checks to identify and handle missing or anomalous values

- Transform raw data into analytical views useful for downstream analysis

- Create at least one derived metric (e.g., volatility measures, sector performance indices)

#### Analytics & Visualization

- Develop SQL queries that answer at least 3 business questions about sector performance or company comparisons

- Create a simple visualization that illustrates a meaningful insight from the data

#### Implementation Notes

- Document your data pipeline architecture with a diagram

- Include comments explaining key design decisions and trade-offs

- Implement error handling and basic logging

- Write a brief explanation of how your solution could scale to handle more data

#### Deliverables

- Python code for the complete data pipeline

- SQL queries for analytics

- Architecture documentation and diagram

- Brief write-up on your approach and potential improvements

#### Evaluation Criteria
- **Data modeling approach**: How well the data is structured for both storage and analysis

- **Code quality**: Clean, well-organized, and properly documented code

- **Problem-solving**: Creative approaches to handling data challenges

- **Technical design**: Architecture decisions that demonstrate understanding of data engineering principles

- **Analysis**: Quality of insights derived from the processed data

This exercise is intentionally open-ended to allow you to demonstrate how you approach real-world data engineering challenges while leveraging AI tools to enhance your workflow. The focus is on your architectural decisions, data handling skills, and your ability to transform raw financial data into valuable business insights.
