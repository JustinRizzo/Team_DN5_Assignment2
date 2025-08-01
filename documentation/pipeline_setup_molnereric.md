## **Sales Data Pipeline**
**Script:** `assign_sales_dataflow_pipeline.py`

### Purpose
This pipeline processes a CSV file containing sales data and loads it into a BigQuery table named `sales_info`.

### Input
- **Source:** Google Cloud Storage (GCS)
- **File:** `gs://molneeric_assign2_bucket/kaggle-store-sales/train.csv`
- **Format:** CSV with columns:
  - `id`
  - `date`
  - `store_nbr`
  - `family`
  - `sales`

### Processing Steps
1. **Match Files:** Locate the CSV file in GCS.
2. **Read Matches:** Read matched file metadata and content.
3. **Read Content:** Extract file path and UTF-8 content.
4. **Log File Content:** Log the file path for traceability.
5. **Split Lines:** Split content into lines, skipping the header.
6. **Parse CSV:** Convert each line into a dictionary with proper types.
7. **Filter Valid Records:** Remove malformed or empty records.
8. **Write to BigQuery:** Load the cleaned data into the `sales_info` table.

### BigQuery Schema
```plaintext
id: INTEGER
date: TIMESTAMP
store_nbr: INTEGER
family: STRING
sales: FLOAT
```

### Pipeline Configuration
- **Runner:** DataflowRunner
- **Region:** us-central1
- **Job Name:** `molneeric-assign2-sales-pipeline`
- **Write Disposition:** `WRITE_TRUNCATE`
- **Create Disposition:** `CREATE_IF_NEEDED`

---

## **Store Data Pipeline**
**Script:** `assign_store_dataflow_pipeline.py`

### Purpose
This pipeline processes a CSV file containing store metadata and loads it into a BigQuery table named `store_info`.

### Input
- **Source:** Google Cloud Storage (GCS)
- **File:** `gs://molneeric_assign2_bucket/kaggle-store-sales/stores.csv`
- **Format:** CSV with columns:
  - `store_nbr`
  - `city`
  - `state`
  - `type`
  - `cluster`

### Processing Steps
1. **Match Files:** Locate the CSV file in GCS.
2. **Read Matches:** Read matched file content.
3. **Read Content:** Read UTF-8 content directly.
4. **Split Lines:** Split content into lines, skipping the header.
5. **Parse CSV:** Convert each line into a dictionary with proper types.
6. **Filter Valid Records:** Remove malformed or empty records.
7. **Write to BigQuery:** Load the cleaned data into the `store_info` table.

### BigQuery Schema
```plaintext
store_nbr: INTEGER
city: STRING
state: STRING
type: STRING
cluster: INTEGER
```

### Pipeline Configuration
- **Runner:** DataflowRunner
- **Region:** us-central1
- **Job Name:** `molneeric-assign2-store-pipeline`
- **Write Disposition:** `WRITE_TRUNCATE`
- **Create Disposition:** `CREATE_IF_NEEDED`