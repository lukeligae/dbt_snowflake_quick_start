
{# 
This macro generates the source yaml file:

Arguments
	• schema_name  (required): The schema name that contains your source data
	• database_name (optional, default=target.database): The database that your source data is in.
	• table_names     (optional, default=none (all tables) ): A list of tables that you want to generate the source definitions for.
 
 --Compile this file in Cloud IDE 
 #}
 
{{ codegen.generate_source(schema_name= 'jaffle_shop', database_name= 'raw') }}

{# 
   Or Alternative, run the command below:

-- $ dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "database_name": "raw", "table_names":["table_1", "table_2"]}'   
-- $ dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "database_name": "raw"}'   

It will genrate the following source yaml file (the soruce name is the same as the schema name):

version: 2
sources:
  - name: jaffle_shop
    database: raw
    tables:
      - name: customers
      - name: orders
-----------------------
version: 2
sources:
  - name: stripe
    database: raw
    tables:
      - name: payment

Notes: Missing the line: schema: jaffle_shop
 
 #}