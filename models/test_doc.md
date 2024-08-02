{% docs state_code_name %}

### State Code and Desc

| code | desc       |
| :--- | :--------- |
| CA   | Califorina |
| TX   | Taxes      |
| NY   | New York   |

{% enddocs %}

{% docs country_code_name %}

### Country Code and Desc

| code | desc          |
| :--- | :------------ |
| US   | United States |
| CN   | China         |
| JP   | Japan         |

{% enddocs %}

{% docs table_events %}

This table contains clickstream events from the marketing website.

The events in this table are recorded by Snowplow and piped into the warehouse on an hourly basis. The following pages of the marketing site are tracked: 
- / 
- /about 
- /team 
- /contact-us

{% enddocs %}
