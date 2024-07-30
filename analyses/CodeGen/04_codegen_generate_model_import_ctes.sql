/*
	This macro generates the SQL for a given model with all references pulled up into import CTEs, which you can then paste back into the model.
	
	Arguments:	
		• model_names (required): The model(s) you wish to generate YAML for.	  
 */

-- A. First, Create a model with your original SQL query. 
/*
 Examples 1: Creat a file original_query1.sql and svae it in any subfolder of /models
      original_query1.sql:    select * from raw.jaffle_shop.customers
 */
-- B. Compile the code below in Cloud IDE 
--
	{{ codegen.generate_model_import_ctes( model_name = 'orignal_query1') }}

/*
It will genertae the new model with cte below: 

with raw_jaffle_shop_customers as (
    select * from raw.jaffle_shop.customers
    -- CAUTION: It's best practice to use the ref or source function instead of a direct reference
)
select * from raw_jaffle_shop_customers

 */

 /*
 Examples 2: Creat a file original_query2.sql and svae it in any subfolder of /models
      original_query2.sql:    
      
      
      
      
 */
-- Compile the code below in Cloud IDE 
--
	{{ codegen.generate_model_import_ctes( model_name = 'orignal_query2') }}

/*
It will genertae the new model with cte below: 
with raw_jaffle_shop_customers as (
    select * from raw.jaffle_shop.customers
    -- CAUTION: It's best practice to use the ref or source function instead of a direct reference
),

raw_jaffle_shop_orders as (
    select * from raw.jaffle_shop.orders
    -- CAUTION: It's best practice to use the ref or source function instead of a direct reference
)

Select --customer info
        c.id as customer_id,
        c.first_name,
        c.last_name,
        --order info 
        count(o.id) as number_of_orders,
        min(o.order_date)  as  first_order_date,
        max (o.order_date)  as  last_order_date
from raw_jaffle_shop_customers AS c
join raw_jaffle_shop_orders  AS o
on c.id = o.user_id
group by 1,2,3

 */



/*
Or Alternative, run the command below:

$ dbt run-operation generate_model_import_ctes --args '{"model_name": "my_dbt_model"}'

It will genrate the new ctes sql for the model. 
Copy/paste the cte sql, and refactor as required to update the orignal sql query 
*/
