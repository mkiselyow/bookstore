Aws::VERSION =  Gem.loaded_specs["aws-sdk"].version
Aws.config.update(
  access_key_id:      Rails.application.secrets['access_key_id'],
  secret_access_key:  Rails.application.secrets['secret_access_key'],
  # bucket:             Rails.application.secrets['s3_bucket_name']
)