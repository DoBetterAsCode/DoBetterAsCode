require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

state_file = 'terraform/zone/terraform.tfstate.d/kitchen-terraform-zone-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)

zone_name = tf_state['modules'][0]['outputs']['zone_name']['value']

describe route53_hosted_zone(zone_name), region: 'ap-southeast-2' do
  it { should exist }
end

