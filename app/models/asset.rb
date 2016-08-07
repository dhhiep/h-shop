class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true

  has_attached_file :attachment,
    :s3_credentials => 
      {
        :access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
        :bucket             => ENV['S3_BUCKET_NAME']
      },
    :s3_region    => ENV['S3_AWS_REGION'],
    :storage      => :s3,
    :s3_headers   => { "Cache-Control" => "max-age=31557600" },
    :s3_protocol  => ENV['S3_PROTOCOL'].present? ? ENV['S3_PROTOCOL'] : "http",
    :bucket       => ENV['S3_BUCKET_NAME'],
    :styles => {
        :mini     => "48x72>",
        :small    => "100x150>",
        :product  => "480x720>",
        :large    => "600x900>"
      },
    :default_style    => "product",
    :path             => "/:class/:id/:style/:basename.:extension",
    :default_url      => "/:class/:id/:style/:basename.:extension",
    :s3_host_alias    => ENV["S3_HOST_ALIAS"],
    :url              => ":s3_alias_url",
    :convert_options  => { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :attachment,
    :presence => true,
    :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
end