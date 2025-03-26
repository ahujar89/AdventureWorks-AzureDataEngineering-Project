------------------------
-- VIEW CALENDAR
------------------------
CREATE VIEW gold.calendar
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Calendar/',
            FORMAT = 'PARQUET'
        ) as QUER1;

------------------------
-- VIEW Customer
------------------------
CREATE VIEW gold.customers
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Customers/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW Product Categories
------------------------
CREATE VIEW gold.prodcat
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Product_Categories/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW Product SubCategories
------------------------
CREATE VIEW gold.prodsubcat
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW Products
------------------------
CREATE VIEW gold.products
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Products/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW  Returns
------------------------
CREATE VIEW gold.ret
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Returns/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW Sales
------------------------
CREATE VIEW gold.sales
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Sales/',
            FORMAT = 'PARQUET'
        ) as QUER1

------------------------
-- VIEW Territories
------------------------
CREATE VIEW gold.ter
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://rishabhstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as QUER1