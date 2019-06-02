require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe s3_bucket(outputs[:bucket_name][:value]), region: 'ap-southeast-2' do
  it { should exist }
  it { should have_acl_grant(grantee: 'http://acs.amazonaws.com/groups/global/AllUsers', permission: 'READ') }
end

