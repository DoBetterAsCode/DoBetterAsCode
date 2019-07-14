require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

state_file = 'terraform/cloudfront_distribution/terraform.tfstate.d/kitchen-terraform-cloudfront-distribution-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)

distribution_domain = tf_state['modules'][0]['outputs']['distribution_domain']['value']

describe cloudfront_distribution(distribution_domain), region: 'ap-southeast-2' do
  it { should exist }
end

