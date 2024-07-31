Select 
        --customer info
        c.ID as customer_id,  c.first_name,  c.last_name,   --order info 
        count(o.id) as number_of_orders,  min(o.order_date)  as  first_order_date,  max (o.order_date)  as  last_order_date
From raw.jaffle_shop.customers AS c join  raw.jaffle_shop.orders  AS o on c.id = o.user_id
    Group by 1,2,3