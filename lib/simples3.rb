require 'aws/s3'

module Simples3
    
  def self.ensure_config
    raise Simples3::Config "boom"
  end
  
  def self.about( path, bucket )
    ensure_config
    AWS::S3::S3Object.about( path, bucket )
  end

end