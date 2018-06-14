require 'fog-aws'

module ProductsFeed
  class S3Uploader
    def initialize(file, remote_path, s3_credentials)
      file.rewind

      @file = file
      @remote_path = remote_path
      @s3_credentials = s3_credentials
    end

    def perform
      remote_file.body = @file
      remote_file.save
    end

    private

    def bucket
      return @bucket if @bucket

      connection = ::Fog::Storage.new(
        provider: 'AWS',
        aws_access_key_id: @s3_credentials[:aws_access_key_id],
        aws_secret_access_key: @s3_credentials[:aws_secret_access_key],
        region: (@s3_credentials[:region] || 'us-east-1')
      )

      @bucket = connection.directories.get(@s3_credentials[:bucket]) ||
        connection.directories.create(key: @s3_credentials[:bucket])
    end

    def remote_file
      @remote_file ||= bucket.files.create(
        key: @remote_path,
        public: true
      )
    end
  end
end
