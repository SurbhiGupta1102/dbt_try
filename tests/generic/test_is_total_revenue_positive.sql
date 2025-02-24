{% test is_total_revenue_positive(model, column_name) %}

WITH validation AS (

    SELECT
        {{ column_name }} AS revenue_value
    FROM {{ model }}

), 

validation_errors AS (

    SELECT
        revenue_value
    FROM validation
    -- If revenue_value is 0 or negative, it's an error
    WHERE revenue_value <= 0

)

SELECT * 
FROM validation_errors

{% endtest %}
