require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

state_file = 'terraform/certificate/terraform.tfstate.d/kitchen-terraform-certificate-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)

certificate_name = tf_state['modules'][0]['outputs']['certificate_name']['value']

describe acm(certificate_name), region: 'ap-southeast-2' do
  it { should exist }
  it { should be_issued }
end