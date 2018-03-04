S3DirectUpload.config do |c|
  c.access_key_id     = Rails.application.secrets[:access_key_id]
  c.secret_access_key = Rails.application.secrets[:secret_access_key]
  # c.bucket            = Rails.application.secrets[:s3_bucket_name]
  c.region            = Rails.application.secrets[:region]
end