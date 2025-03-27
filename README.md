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

 ## SCREENSHOTS

<img width="1328" alt="s1" src="https://github.com/user-attachments/assets/18beb58d-949b-4b67-9b37-1cc9a610002e" />
<img width="1439" alt="s1 1" src="https://github.com/user-attachments/assets/eaa40756-f50d-410c-a961-b3e11060bafd" />
<img width="1439" alt="s1 2" src="https://github.com/user-attachments/assets/0ac476af-f2c6-4d04-aba4-b17b036dab83" />
<img width="1431" alt="s2" src="https://github.com/user-attachments/assets/978058a2-5af9-46d4-bd62-5ddaebaa5130" />
<img width="1257" alt="s3" src="https://github.com/user-attachments/assets/5fc7214f-2c94-4cff-a3bb-7401d1f31430" />
<img width="1435" alt="s4" src="https://github.com/user-attachments/assets/09fe0e2a-c380-4ea1-9f4f-3cfbb483deae" />
<img width="1435" alt="s5" src="https://github.com/user-attachments/assets/56c3f2d4-4d94-462a-8bd4-4821c0f3dde9" />
<img width="1317" alt="s6" src="https://github.com/user-attachments/assets/e6126347-eba6-4d1d-b8a9-9996ba537ea5" />
<img width="1424" alt="s7" src="https://github.com/user-attachments/assets/15e78520-418a-411b-93ef-647f382eeb27" />
<img width="1426" alt="s8" src="https://github.com/user-attachments/assets/ff86e70d-38bf-4351-91a4-1d7f2d5e7954" />
<img width="1426" alt="s9" src="https://github.com/user-attachments/assets/4263b379-fe60-48f8-bcf5-d82d9d886f3a" />
<img width="1418" alt="s10" src="https://github.com/user-attachments/assets/b974df42-27ab-41df-b009-c21b653ef8e6" />
<img width="1429" alt="s11" src="https://github.com/user-attachments/assets/9662c9aa-9c2b-48f0-9dc3-045ca1eed3e5" />
<img width="1365" alt="s12" src="https://github.com/user-attachments/assets/6cbb7646-6032-4c1b-8e62-2889bc3cdc2f" />
<img width="1353" alt="s13" src="https://github.com/user-attachments/assets/97ef6496-aca5-46bd-a247-a20b97fc61f8" />

















