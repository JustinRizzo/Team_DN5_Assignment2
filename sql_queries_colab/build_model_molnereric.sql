-- Create aggregated training data
CREATE OR REPLACE TABLE `molneericbigdata.assign2_dataflow.daily_sales` AS
SELECT 
  date,
  SUM(sales) as total_sales,
  COUNT(DISTINCT store_nbr) as stores_active,
  AVG(onpromotion) as avg_promo_items
FROM `molneericbigdata.assign2_dataflow.sales_info`
WHERE date < '2017-08-01'  -- Keep last 2 weeks for testing
GROUP BY date;


-- Build time series model
CREATE OR REPLACE MODEL `molneericbigdata.assign2_dataflow.sales_forecast_model`
OPTIONS(
  model_type='ARIMA_PLUS',
  time_series_timestamp_col='date',
  time_series_data_col='total_sales'
) AS
SELECT date, total_sales
FROM `molneericbigdata.assign2_dataflow.daily_sales`;
