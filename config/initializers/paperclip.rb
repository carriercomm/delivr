Paperclip::Attachment.default_options[:use_timestamp] = false

Paperclip.interpolates(:timestamp) do |attachment, style|
  attachment.instance_read(:updated_at).to_i  
end

# if Rails.env.production?
# 	Paperclip::Attachment.default_options.merge!({
# 	  storage: :s3,
# 	  bucket: S3_CREDENTIALS['bucket'],
# 	  s3_credentials: S3_CREDENTIALS,
#     s3_host_alias: S3_CLOUDFRONT,
#     url: ':s3_alias_url',
#     path: ":class/:attachment/:id_:timestamp/:basename_:style.:extension"
# 	})
# else
	Paperclip::Attachment.default_options.merge!({
	    url: '/system/:class/:attachment/:id_:timestamp/:basename_:style.:extension',
	    path: ":rails_root/public/system/:class/:attachment/:id_:timestamp/:basename_:style.:extension"
	})
# end