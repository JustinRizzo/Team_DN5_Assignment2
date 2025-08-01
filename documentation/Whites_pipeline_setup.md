# Pipeline Setup Documentation

**Team:** Option A
**Primary Tool:** Google Colab

This document outlines the process of building a data pipeline to move store sales data from Google Cloud Storage (GCS) to BigQuery.

---

## Part 1: Data Acquisition

### Step 1: Download and Upload CSV Files

The initial step was to acquire the dataset from Kaggle. The required files (`train.csv`, `stores.csv`) were then uploaded to a designated folder in our Google Cloud Storage bucket using `!gsutil` commands within our Colab notebook.

* **GCS Bucket:** `gs://whitese_lab2_bucket`
* **GCS Folder:** `kaggle-store-sales/`

---

## Part 2: Building the Ingestion Pipeline

The goal was to create two tables in BigQuery (`sales_data` and `store_info`) from the CSV files in GCS.

### Initial Approach: Dataflow Template

The initial plan was to use the "Text Files on Cloud Storage to BigQuery" Dataflow template, launched from Colab using `!gcloud` commands. This approach repeatedly failed due to several underlying issues.

### Challenges and Final Method

1.  **Invalid Dataset Name:** The Dataflow and BQML backend services rejected dataset names containing a hyphen (`-`), which caused generic "not found" errors, even though the BigQuery UI allowed the name.
2.  **Data Quality:** The `train.csv` file contained malformed rows. The strict Dataflow template failed on these rows, while the direct BigQuery load tool could be configured to skip them.
3.  **Header Rows:** After cleaning the data by exporting it from BigQuery, the resulting CSV had a header row that also caused the Dataflow template to fail.

The final, successful strategy was to bypass the Dataflow template and use the **direct BigQuery load feature**.

1.  **Create Valid Dataset:** A new dataset with a valid name (`store_sales_team_A`) was created using the `!bq mk` command in Colab.
2.  **Load Table Directly:** The tables were created using the BigQuery "Create table from GCS" feature with key settings: providing the JSON schema, setting **Header rows to skip** to **1**, and setting **Number of errors allowed** to **10**.

---

## Part 3: Data Verification

To confirm the successful data load, a verification query was run from Colab using `!bq query`.

```sql
SELECT
  COUNT(*) AS row_count,
  MIN(date) AS earliest_date,
  MAX(date) AS latest_date
FROM
  `mgmt599-whitese-labs.store_sales_team_A.sales_data`;
