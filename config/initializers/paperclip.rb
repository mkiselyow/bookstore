Paperclip::Attachment.default_options.merge!(
  url:                    ':s3_domain_url',
  path:                   ':class/:attachment/:id/:style/:filename',
  storage:                :s3,
  bucket:                 Rails.application.secrets['s3_bucket_name'],
  s3_credentials: {
    access_key_id:        Rails.application.secrets['access_key_id'],
    secret_access_key:    Rails.application.secrets['secret_access_key']
  },
  s3_permissions: {
    original:              "public-read"
  },
  s3_protocol:            'https',
  s3_region:              Rails.application.secrets['region']
)