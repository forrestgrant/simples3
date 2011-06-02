require 'aws/s3'

module Simples3
  
  def self.about( path = '/', bucket = 'preponline' )
    AWS::S3::S3Object.about( path, bucket )
  end

end