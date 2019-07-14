require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

tf_state = Helpers::State::load_state_for_module("s3_bucket")

bucket_name = tf_state['modules'][0]['outputs']['bucket_name']['value']

describe s3_bucket(bucket_name), region: 'ap-southeast-2' do
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

