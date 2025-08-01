-- Check model performance
SELECT * FROM ML.EVALUATE(MODEL `molneericbigdata.assign2_dataflow.sales_forecast_model`);


-- For time series model
SELECT * FROM ML.FORECAST(MODEL `molneericbigdata.assign2_dataflow.sales_forecast_model`,
                          STRUCT(14 AS horizon));