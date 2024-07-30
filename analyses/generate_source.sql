{{ codegen.generate_source(schema_name= 'jaffle_shop', database_name= 'raw') }}

-- $ dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "database_name": "raw", "table_names":["table_1", "table_2"]}'   
-- $ dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "database_name": "raw"}'   
/*
It will genrate the following:

version: 2

sources:
  - name: jaffle_shop
    database: raw
    tables:
      - name: customers
      - name: orders


MNotes: issing the line: schema: jaffle_shop
 */
