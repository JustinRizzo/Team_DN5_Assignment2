How the Data Pipelines Were Built: A Step-by-Step Guide

This document explains the process of creating and running the data pipelines for both the sales (train.csv) and stores (stores.csv) datasets using Apache Beam on Google Cloud Dataflow. The goal was to read these files from Google Cloud Storage, perform basic cleaning and transformation, and load the data into BigQuery tables.

Step 1: Setting Up the Configuration

First, important configuration settings were defined at the top of each pipeline script (pipeline_sales.py and pipeline_stores.py). This centralizes the settings and makes the scripts reusable across different environments or projects by simply changing these values.

PROJECT_ID: Set to "fischproj2". This is the main Google Cloud project ID where the Dataflow jobs would run and the BigQuery dataset resides.
GCS_BUCKET: Set to "fischproject2". This specifies the Google Cloud Storage bucket where the input CSV files are located (Data_Folder) and where Dataflow will store temporary and staging files.
BIGQUERY_DATASET: Set to "data_stores1". This is the name of the BigQuery dataset where the processed data would be stored.
BIGQUERY_TABLE: This was set specifically for each pipeline: "Train_Table_Raw" for the sales data and "Store_Table_Raw" for the stores data. These are the destination table names within the BigQuery dataset.
REGION: Set to "us-central1". This specifies the Google Cloud region where the Dataflow jobs and BigQuery resources are located.
File and Table Paths: Using the settings above, full paths were created for the input files on GCS (e.g., gs://fischproject2/Data_Folder/train.csv) and the final tables in BigQuery (e.g., fischproj2:data_stores1.Train_Table_Raw). Temporary (TEMP_LOCATION) and staging (STAGING_LOCATION) locations within the GCS bucket were also defined for Dataflow's internal use.
Step 2: Creating the Data Parsing Functions

Functions were created to handle each line from the input CSV files. These are the "Transform" part of the process, converting raw text lines into structured records suitable for BigQuery.

parse_train_csv(line) (for train.csv):
Input: Takes one line of text from the train.csv file.
Splitting the Line: It splits the line by commas to get the individual values (id, date, store_nbr, family, sales, onpromotion).
Checking for Errors:
It checks if there are exactly 6 values (the expected number of columns). If not, it logs a warning and returns an empty list, effectively skipping the malformed line.
It then tries to convert the values to the right data type (e.g., id, store_nbr, onpromotion to integer; sales to float). The date is kept as a string initially, as BigQuery's DATE type can handle the 'YYYY-MM-DD' format directly.
If the type conversion fails (e.g., a non-numeric value in a sales column), it logs another warning with the specific error and skips the line. This prevents individual data errors from stopping the entire pipeline.
Output: If successful, it returns a list containing a dictionary representing the structured row, with keys matching the desired BigQuery column names and values converted to the appropriate Python types. Returning a list (even with one element) is standard practice for FlatMap.
parse_stores_csv(line) (for stores.csv):
This function works similarly to parse_train_csv but is tailored for the stores.csv schema.
Input: Takes one line of text from stores.csv.
Splitting the Line: Splits the line by commas (store_nbr, city, state, type, cluster).
Checking for Errors: Checks for exactly 5 fields and handles type conversions for store_nbr and cluster to integer, with error logging for malformed lines.
Output: Returns a list containing a dictionary for the structured store record.
Step 3: Defining the Pipeline

Within each script, the Apache Beam pipeline was defined using a with beam.Pipeline(options=options) as p: block. This sets up the pipeline execution environment.

Reading from GCS: beam.io.ReadFromText(INPUT_FILE, skip_header_lines=1) was used as the starting point (the "Source"). This reads the text file line by line from the specified GCS path and is configured to skip the first line, which is assumed to be the header.
Applying Transformation: The parsed text lines (after skipping the header) were then passed to the parsing function using the | 'ParseData' >> beam.FlatMap(...) transform. The FlatMap applies the function to each element (line) and potentially flattens the result (useful if the parsing function returned multiple elements or an empty list for skipped rows).
Writing to BigQuery: The structured dictionaries output by the parsing function were sent to the | 'WriteToBigQuery' >> beam.io.WriteToBigQuery(...) transform (the "Sink"). This transform handles formatting the data and loading it into the specified BigQuery table, using the defined schema, create disposition, and write disposition.
Step 4: Running the Pipeline

Finally, the script includes a standard Python if __name__ == '__main__': block. This ensures that the run() function, which contains the pipeline definition and execution logic, is called when the script is executed directly.

PipelineOptions: PipelineOptions were created, specifying the runner='DataflowRunner', the configuration details (project, job_name, staging_location, temp_location, region), and save_main_session=True to make local functions available to Dataflow workers.
Execution Command: The pipelines were launched from the Colab notebook using shell commands like !python pipeline_sales.py and !python pipeline_stores.py. This command executes the Python script, which in turn initiates the Dataflow job in your Google Cloud project.
Monitoring: The output of the !python command includes a link to the Dataflow monitoring console, allowing you to track the job's progress, status, and resource usage.
In summary, the pipelines were built by clearly defining configurations, creating robust parsing functions with error handling, assembling these components within a Beam pipeline structure, and then launching the pipeline execution on Google Cloud Dataflow via simple script execution commands from the notebook.