require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe s3_bucket(outputs[:bucket_name][:value]), region: 'ap-southeast-2' do
  it { should exist }
  it { should have_acl_grant(grantee: 'http://acs.amazonaws.com/groups/global/AllUsers', permission: 'READ') }
  it {
    should have_policy <<-POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::#{outputs[:bucket_name][:value]}/*"
    }
  ]
}
    POLICY
  }
end

