{# 
This macro generates the SQL for a base model from the source table (stg_xxx model), which you can then paste into a model.

Arguments
	• source_name (required): The source you wish to generate base model SQL for.
	• table_name (required): The source table you wish to generate base model SQL 
	• materialized (optional, default=None): Set materialization style (e.g. table, view, incremental) inside of the model's config block. If not set, materialization style will be controlled by dbt_project.yml
 

-- A. First, create the source yaml file for the table you wish to create a base model on top of.
--     source name: jaffle_shop     table names: customers, orders
-- B. Compile this file in Cloud IDE -- materialized argument is optional 
--
 #}
	
    {{ codegen.generate_base_model( source_name='jaffle_shop', table_name='customers',  materialized='table' ) }}


{# 
Or Alternative, run the command below:

$ dbt run-operation generate_base_model --args '{"source_name": "jaffle_shop", "table_name": "customers"}'  

It will genrate the following model sql for soruce table customers
Copy/paste the output to stg_customers.sql model file, and refactor as required

-- Copy/Paste to the module file stg_customers.sql --

{{ config(materialized='table') }}

with source as (
    select * from {{ source('jaffle_shop', 'customers') }}
),
renamed as (
    select
        id,
        first_name,
        last_name
    from source
)
select * from renamed

 #}
