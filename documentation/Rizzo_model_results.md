Making future sales predictions for the next 14 days...
Forecasted Sales:
forecast_timestamp	forecast_value	standard_error	confidence_level	prediction_interval_lower_bound	prediction_interval_upper_bound	confidence_interval_lower_bound	confidence_interval_upper_bound
0	2017-08-01 00:00:00+00:00	8.733159e+05	38529.864286	0.95	7.979338e+05	9.486980e+05	7.979338e+05	9.486980e+05
1	2017-08-02 00:00:00+00:00	8.757972e+05	41850.341907	0.95	7.939188e+05	9.576757e+05	7.939188e+05	9.576757e+05
2	2017-08-03 00:00:00+00:00	7.232605e+05	43046.816781	0.95	6.390412e+05	8.074798e+05	6.390412e+05	8.074798e+05
3	2017-08-04 00:00:00+00:00	8.345128e+05	44670.516758	0.95	7.471168e+05	9.219088e+05	7.471168e+05	9.219088e+05
4	2017-08-05 00:00:00+00:00	1.016688e+06	46465.512184	0.95	9.257798e+05	1.107595e+06	9.257798e+05	1.107595e+06
5	2017-08-06 00:00:00+00:00	1.107566e+06	48160.776061	0.95	1.013341e+06	1.201791e+06	1.013341e+06	1.201791e+06
6	2017-08-07 00:00:00+00:00	8.088756e+05	49771.712439	0.95	7.114994e+05	9.062519e+05	7.114994e+05	9.062519e+05
7	2017-08-08 00:00:00+00:00	6.901314e+05	51333.093672	0.95	5.897004e+05	7.905625e+05	5.897004e+05	7.905625e+05
8	2017-08-09 00:00:00+00:00	7.022819e+05	52851.191997	0.95	5.988807e+05	8.056830e+05	5.988807e+05	8.056830e+05
9	2017-08-10 00:00:00+00:00	6.155805e+05	54327.037197	0.95	5.092919e+05	7.218691e+05	5.092919e+05	7.218691e+05
10	2017-08-11 00:00:00+00:00	7.738430e+05	55763.556329	0.95	6.647439e+05	8.829420e+05	6.647439e+05	8.829420e+05
11	2017-08-12 00:00:00+00:00	9.740451e+05	57163.946540	0.95	8.622062e+05	1.085884e+06	8.622062e+05	1.085884e+06
12	2017-08-13 00:00:00+00:00	1.069241e+06	58530.866598	0.95	9.547281e+05	1.183755e+06	9.547281e+05	1.183755e+06
13	2017-08-14 00:00:00+00:00	7.991378e+05	59866.590783	0.95	6.820113e+05	9.162643e+05	6.820113e+05	9.162643e+05

## Regression Model Performance

Based on the Linear Regression model trained on the daily sales data, the evaluation metrics are as follows:

- **Mean Squared Error (MSE):** 1301660830.27
- **R-squared (R2) Score:** 0.6873

### Interpretation of Metrics

- The **MSE** of 1301660830.27 represents the average squared difference between the actual daily sales and the predicted daily sales. A lower MSE indicates a better fit of the model to the data.
- The **R2 Score** of 0.6873 indicates that approximately 68.73% of the variance in daily sales can be explained by the features used in the Linear Regression model. An R2 score closer to 1 suggests that the model explains a large proportion of the variance in the target variable.

This evaluation provides insights into how well the Linear Regression model captures the patterns in the daily sales data based on the selected features, including time-based components and the sales from the previous day.

## Summary:

### Data Analysis Key Findings

*   The Mean Squared Error (MSE) for the Linear Regression model is approximately 1.3 billion (\$1,301,660,830.27), which represents the average squared difference between actual and predicted daily sales.
*   The R-squared (R2) score is approximately 0.6873, indicating that the Linear Regression model explains about 68.73% of the variance in daily sales using the selected features.

### Insights or Next Steps

*   While the R2 score suggests a reasonable fit, the high MSE indicates that the model's predictions still have a significant average squared error. Further feature engineering or exploring alternative models might improve accuracy.
*   Investigate the residuals of the model to understand where the largest prediction errors occur and identify potential areas for model improvement.
