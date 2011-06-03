require 'aws/s3'

module Simples3
  
  def self.ensure_connection
    @@config = YAML.load(ERB.new(File.read("#{Rails.root}/config/simples3.yml")).result)[RAILS_ENV].symbolize_keys
    @@connection = AWS::S3::Base.establish_connection!(
      :access_key_id     => @@config[:access_key_id],
      :secret_access_key => @@config[:secret_access_key]
    ) if AWS::S3::Base.connections.empty?
    raise Config.new "#{Rails.root}/config/simples3.yml not found." unless File.exists?("#{Rails.root}/config/simples3.yml")
  end
  
  def self.file_exists?(path, bucket = nil)
    ensure_connection
    AWS::S3::S3Object.exists?( path, bucket || @@config[:bucket_name] )
  end

  def self.about( path, bucket = nil )
    ensure_connection
    AWS::S3::S3Object.about( path, bucket || @@config[:bucket_name] )
  end

  def self.delete(path, bucket = nil)
    ensure_connection
    Rails.logger.info "Deleting #{path} from S3..."
    AWS::S3::S3Object.delete(  path, bucket || @@config[:bucket_name] )
  end

  def self.save(path, data, bucket = nil)
    ensure_connection
    Rails.logger.info "Saving #{path} to S3..."
    AWS::S3::S3Object.store( path, data, bucket || @@config[:bucket_name], :access => :public_read, 'cache-control' => 'public', "expires" => (Time.now+20.years).httpdate )
  end

  def self.move(from, to, bucket = nil)
    ensure_connection
    AWS::S3::S3Object.rename(from, to, bucket || @@config[:bucket_name])
  end

  def self.list( path = '', bucket = nil)
    ensure_connection
    AWS::S3::Bucket.objects( bucket || @@config[:bucket_name] ).collect{|o| o.path.gsub("/#{self.bucket_name}",'')}.select{|o| o.match(/^\/#{path}\//)}
  end

  def self.make_public( path = '', bucket = nil)
    ensure_connection
    object = AWS::S3::S3Object.find(path, bucket || @@config[:bucket_name])
    object.acl.grants << AWS::S3::ACL::Grant.grant(:public_read)
    object.acl( object.acl )
  end

  def self.change_content_type( path = '', new_content_type = '', bucket = nil)
    ensure_connection
    object = AWS::S3::S3Object.find(path, bucket || @@config[:bucket_name])
    object.content_type = new_content_type
    object.store
  end

end