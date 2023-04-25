
resource "aws_glue_crawler" "crawler_processed" {
  database_name = var.athena_database_name
  name          = "${var.project_name}-crawler-tables-analytics-${var.environment}"
  role          = aws_iam_role.glue_job.arn
  table_prefix = "processed_"


  delta_target {
    delta_tables = ["s3://processed-bootcampde-<ID_CONTA_AWS>/customers/,s3://processed-bootcampde-<ID_CONTA_AWS>/orders/, s3://processed-bootcampde-<ID_CONTA_AWS>/products/"]
    write_manifest = "true"
  }
}