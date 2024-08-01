{#
--codegen.generate_model_yaml--

This macro generates the YAML for a list of model(s), which you can then paste 
into a schema.yml file for documents and test.	
	Arguments:	
		• model_names (required): The model(s) you wish to generate YAML for.	  
-- A. First, create the models sql files. e.g. customers.sql  stg_orders.sql
-- B. Compile this file in Cloud IDE -- materialized argument is optional 

#}

{{ codegen.generate_model_yaml(model_names=["customers", "stg_orders"]) }}

{#
-- Furthermore, you can use the helper function codegen.get_models and specify a
   directory and/or prefix to get a list of all matching models, to be passed 
   into model_names list.
-- For Examples: 

  To get all stg_* models in the /models or its subfolders: use directory='' 
or directory=None  or without directory argument 
#}

{% set models_to_generate = codegen.get_models(prefix="stg_") %}
{{ codegen.generate_model_yaml(model_names=models_to_generate) }}

{# To get all stg_* models in the subfolder /models/marts/, use  directory='marts' #}
{% set models_to_generate = codegen.get_models(directory="marts", prefix="stg_") %}
{{ codegen.generate_model_yaml(model_names=models_to_generate) }}


{#
Or Alternative, run the command below:

$ dbt run-operation generate_model_yaml  --args '{"model_names": ["customers", "stg_orders"]}'

It will generate the following schema yaml file for the columns and all the given models.
Copy/paste the the models' schemayaml  fiel(s), and refactor as required to 
add documentations and generic tests


version: 2

models:
  - name: customers
    description: ""
    columns:
      - name: customer_id
        data_type: number
        description: ""

      - name: first_name
        data_type: varchar
        description: ""

      - name: last_name
        data_type: varchar
        description: ""

      ... rest of all columns

  - name: stg_orders
    description: ""
    columns:
      - name: order_id
        data_type: number
        description: ""

      - name: customer_id
        data_type: number
        description: ""

       ... rest of all columns
#}

