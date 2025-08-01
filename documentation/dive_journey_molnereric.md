# DIVE JOURNEY
# Task: Analyze the provided data and the BigQuery ML model 'molneericbigdata.assign2_dataflow.sales_forecast_model' using the DIVE method.  For the Discover phase, determine the model accuracy, get the next 14-day predictions, and identify key patterns driving sales. For the Investigate phase, identify the top factors driving sales, explain why they are influential, and analyze how store types/locations affect predictions. For the Validate phase, identify potential reasons for prediction errors, data limitations, and scenarios where the model might fail. For the Extend phase, recommend specific actions for store managers for different time horizons, propose methods to measure action effectiveness, and summarize the main story of the results. Summarize questions with data analysis key findings and generate a .md file.

# DISCOVER
	# Subtask Model Accuracy: Query the BigQuery ML model to get evaluation metrics and determine the model's accuracy.
	# Subtask 14-day Predictions: Use the BigQuery ML model to generate sales predictions for the next 14 days.	
	# Subtask Identify Key Patterns: Analyze the model or the underlying data to identify key patterns influencing sales.

# INVESTIGATE
	# Subtask Top Factors for driving sales: Based on the model and data analysis, identify the top factors influencing sales.
	# Subtask Explain why factors drive sales: Provide potential business mechanisms or explanations for why these specific factors strongly influence sales.
	# Subtask Store types/Locations affect predictions: Analyze how store types/locations affect predictions.

# VALIDATE
	# Subtask Prediction Issues: Identify potential reasons for prediction errors, data limitations, and scenarios where the model might fail.

# EXTEND
	# Subtask Actions for Store Managers: Recommend specific actions for store managers for different time horizons (next week, next month, long-term planning), considering the model's insights and limitations.
	# Subtask Measure Effectiveness of Actions: Propose methods to measure the effectiveness of the suggested actions for store managers.

# SUMMARIZE
	# Subtask Key Takeaways: Summarize the main story or key takeaways from the model results and analysis regarding store sales.

# DATA VISUALS
	# Subtask: Extract the day of the week from the date column in df_train and calculate the average sales for each day.
	# Subtask: Generate a plot to visualize the average sales for each day of the week.
	# Subtask: Generate a visual of the 14-Day Sales Forecast
	# Subtask: Add prediction and confidence intervals

# GCP COST OPTIMIZATION
# Task: Develop a Google Cloud Platform cost optimization plan for the BigQuery ML model 'molneericbigdata.assign2_dataflow.sales_forecast_model'.
	# Subtask: Examine the BigQuery job costs associated with training, evaluating, and forecasting with the model.
	# Subtask: Determine which aspects of the model usage (e.g., query complexity, data volume, frequency of use) contribute most to the costs.	
	# Subtask: Research and propose potential cost-saving measures within Google Cloud Platform for BigQuery ML models.	
	# Subtask: Provide actionable recommendations based on the analysis and identified strategies for optimizing the cost of using the sales forecast model.