# AdventureWorks-AzureDataEngineering-Project

This project demonstrates an end-to-end data engineering pipeline using the AdventureWorks dataset with modern Azure-native tools and the Medallion Architecture (Bronze-Silver-Gold layers). It showcases robust data ingestion, transformation, storage, and visualization using Azure Data Lake, Azure Data Factory, Azure Databricks, Azure Synapse Analytics, and Power BI.

## PROJECT ARCHITECTURE

<img width="1203" alt="Screenshot 2025-03-25 at 19 18 49" src="https://github.com/user-attachments/assets/59366418-cee7-4aaf-9ef4-166b630c633d" />


## Dataset

The dataset used in this project comes from the popular AdventureWorks sales database, with 10 related CSV files covering:
	•	Calendar
	•	Customers
	•	Product Categories
	•	Product Subcategories
	•	Products
	•	Returns
	•	Sales (2015, 2016, 2017)
	•	Territories

All files were sourced from Kaggle and ingested dynamically using metadata-driven pipelines.

## Azure Services Used


### 1. Azure Data Lake Storage Gen2
Centralized storage layer with structured folders for Bronze, Silver, and Gold layers

### 2. Azure Data Factory (ADF)
Data ingestion pipeline: HTTP source â†’ Data Lake (Bronze layer)

### 3. Azure Databricks (Spark)
Data transformation, cleansing, and enrichment (Bronze â†’ Silver)

### 4. Azure Synapse Analytics
Data warehousing, external tables, and SQL querying (Silver â†’ Gold)

### 5. Power BI
Interactive visualizations from Synapse views/tables

## Step-by-Step Implementation

### 1.  Resource Setup
	•	Created a Resource Group in Azure for project isolation.
	•	Created and configured:
	•	Azure Data Lake Storage Gen2
	•	Azure Data Factory
	•	Azure Databricks workspace
	•	Azure Synapse workspace
	•	Set up access policies, managed identities, and RBAC roles across resources.

### 2. Bronze Layer (Raw Ingestion)
	•	Built a metadata-driven pipeline in Azure Data Factory.
	•	Used Lookup, ForEach, and Copy Data activity to dynamically ingest all datasets.
	•	Data is stored in raw format in the bronze container.

Example path:
abfss://bronze@<storage_account>.dfs.core.windows.net/AdventureWorks_Products/AdventureWorks_Products.csv

### 3. Silver Layer (Transformation)
	•	Connected Azure Databricks to Data Lake using ABFS connector and Service Principal.
	•	Loaded raw data from the Bronze layer into DataFrames.
	•	Applied transformations:
	•	Type casting
	•	Date formatting
	•	Column renaming
	•	Filtering nulls, deduplication, etc.
	•	Stored cleansed data in the silver container in Delta or Parquet format.

Example path:
abfss://silver@<storage_account>.dfs.core.windows.net/AdventureWorks_Sales_2015/

Notebook used: Silver_Layer_Databricks.ipynb

### 4. Gold Layer (Analytics & Warehousing)
	•	Created Synapse Analytics SQL Pool.
	•	Configured Storage account access via managed identity and linked services.
	•	Defined External Tables in Synapse SQL using the data from Silver layer.

External Table SQL: create_ext_tables.sql
	•	Created views to support reporting & analytics.
Views: views_gold.sql


## Key Highlights

	•	Fully dynamic ingestion pipeline via ADF (parameterized).
	•	Integration of Spark with ABFS for scalable data transformation.
	•	Secure access control setup using managed identity and role assignments.
	•	Real-time querying and analytics using Synapse + Power BI
	•	Medallion architecture adopted with separation of raw, cleansed, and analytical data.

## Skills & Concepts Involved

	•	Azure Data Factory pipeline development
	•	Azure Databricks (Spark SQL, DataFrames, Delta Lake)
	•	Medallion architecture in Data Lakehouse
	•	Azure Role-based Access Control (RBAC)
	•	External tables & views in Synapse
	•	Power BI visualization on Synapse data
