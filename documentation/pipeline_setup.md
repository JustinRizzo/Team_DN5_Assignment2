How the Data Pipeline Was Built: A Step-by-Step Guide
This document explains the process of creating the data pipeline using the pipeline_stores.py script. The goal was to take the stores.csv file from Google Cloud Storage, clean it up, and put it into a BigQuery table.

Step 1: Setting Up the Configuration
First, all the important settings were defined at the top of the script. This makes it easy to change things later without digging through the code.

TEAM_NUMBER: Set to "DN5" to make sure our BigQuery dataset name (store_sales_team_DN5) was unique to our team.

PROJECT_ID: Set to mgmt599-justinrizzo-lab2, which is the main Google Cloud project where everything happens.

GCS_BUCKET: Set to mgmt599-justinrizzo-assignment2. This is the storage bucket where the stores.csv file is located and where Dataflow will store temporary files.

File and Table Paths: Using the settings above, full paths were created for the input file on GCS and the final table in BigQuery.

Step 2: Creating the Data Cleaning Function (parse_stores_csv)
Next, a function was created to handle each line from the stores.csv file. This is the "Transform" part of the process.

Input: The function takes one line of text from the CSV file.

Splitting the Line: It splits the line by commas to get the individual values (like store number, city, state, etc.).

Checking for Errors:

It checks if there are exactly 5 values. If not, it logs a warning and skips the line.

It then tries to convert the values to the right data type. For example, it turns store_nbr and cluster into numbers (integers). If this conversion fails (like if a value that should be a number is text), it logs another warning and skips the line. This prevents one bad line from breaking the whole pipeline.

Output: If the line is good, the function returns a dictionary, which is basically a structured format that Beam and BigQuery can easily use (e.g., {'store_nbr': 1, 'city': 'Quito', ...}).

Step 3: Building and Running the Pipeline (run function)
This is where all the pieces come together to define the actual pipeline steps.

Setting Pipeline Options:

We told Beam to use the DataflowRunner. This means the job will run on Google's powerful Dataflow service, not on our local machine.

We also set save_main_session=True, which is a crucial setting that packages up our parse_stores_csv function and sends it to the Dataflow workers so they know how to process the data.

Defining the Pipeline Steps: The process was defined as a chain of commands:

Read the data: The pipeline starts by reading the stores.csv file from the GCS bucket. We used skip_header_lines=1 to automatically ignore the first line with the column names.

Parse the data: For every line that was read, the pipeline runs our parse_stores_csv function to clean and structure it.

Write to BigQuery: Finally, the cleaned-up data is written to our store_info table in BigQuery. We set it to WRITE_TRUNCATE, which means if the table already has data, it will be wiped clean before the new data is added. This is useful for re-running the pipeline to ensure you always have the latest version of the data.

Once the script is run, it submits this plan to Google Cloud, which then starts a Dataflow job to carry out these steps.
