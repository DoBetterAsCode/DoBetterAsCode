require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe s3_bucket(outputs[:bucket_name][:value]), region: 'ap-southeast-2' do
  it { should exist }
  it { should have_acl_grant(grantee: 'http://acs.amazonaws.com/groups/global/AllUsers', permission: 'READ') }
  it "should have public read policy for all objects" do
    policy = JSON.parse(subject.policy.policy.read)
    public_read_statement = policy["Statement"].find { |p|
      p["Effect"] == "Allow" &&
      p["Principal"] == "*" &&
      p["Action"] == "s3:GetObject" &&
      /\/*$/ =~ p["Resource"]
    }
    expect(public_read_statement).not_to be_nil
  end
end

