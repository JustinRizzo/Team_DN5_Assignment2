Project Summary: Sales Data Analysis and Forecasting Insights

This project involved analyzing store sales data to understand key drivers and build predictive models. We used a structured DIVE approach to guide our investigation and translate findings into potential actions.

Discover:

Our initial exploration revealed clear patterns in total daily sales: a consistent upward trend over time, strong weekly seasonality with higher sales on weekends, and distinct yearly seasonality featuring a significant December peak. We also observed that certain store characteristics (like Type A and Cluster 5) consistently showed higher average sales, and that promotions were associated with increased sales.

Investigate:

We dug deeper to understand why these patterns exist and to quantify their influence. Feature importance from our Random Forest model highlighted that recent sales (previous day's sales) are the most significant predictor, followed by the day of the week and promotional activity. This suggests that daily sales have momentum and are strongly tied to predictable weekly shopping habits and the impact of promotions. While not directly in the daily total sales model features, our EDA showed store characteristics also play a role in the baseline sales level.

Validate:

We assessed the reliability of our forecasting models. The BigQuery ML ARIMA model effectively captured the main trend and seasonality, but residual analysis showed that there are still specific days where the model's predictions are significantly off. This indicates the model has blind spots to external events (like unexpected local issues, major competitor actions, or unusual weather) or uncaptured internal factors that disrupt the usual patterns.

Extend:

Based on our findings, we've outlined potential actions. Tactically, we can adjust staffing and target promotions on key products during predictable peak times (weekends, December). Operationally, we should look at practices in high-performing stores to see what can be applied elsewhere. Strategically, for future growth, areas resembling successful clusters look promising. To improve forecasting and preparedness, we need a system to monitor external risks. We also designed a specific A/B test to empirically measure the impact of high-impact promotions in high-performing store types.

This analysis provides a solid understanding of sales drivers, the capabilities and limitations of our models, and a starting point for data-driven operational and strategic decisions.
