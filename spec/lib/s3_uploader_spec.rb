require 'spec_helper'

describe ProductsFeed::S3Uploader do
  let(:file) {
    File.open File.join(File.dirname(__FILE__), '../fixtures/output.xml'), 'r'
  }
  let(:remote_path) { 'feeds/feed.xml' }
  let(:s3_credentials) {
    {
      aws_access_key_id: 'AWS_KEY',
      aws_secret_access_key: 'AWS_SECRET',
      region: 'us-east-1',
      bucket: 'mybucket'
    }
  }
  let(:uploader) {
    ProductsFeed::S3Uploader.new file, remote_path , s3_credentials
  }

  before do
    Fog.mock!
    Fog::Mock.reset
  end

  after do
    # close opened file
    file.close
  end

  describe '#perform' do
    let(:bucket) {
      Fog::Storage.new(
        provider: 'AWS',
        aws_access_key_id: s3_credentials[:aws_access_key_id],
        aws_secret_access_key: s3_credentials[:aws_secret_access_key],
        region: s3_credentials[:region]
      ).directories.get(s3_credentials[:bucket])
    }

    before do
      uploader.perform
    end

    it 'uploads the file' do
      expect(bucket.files.get(remote_path)).to_not be_nil
    end
  end

end
