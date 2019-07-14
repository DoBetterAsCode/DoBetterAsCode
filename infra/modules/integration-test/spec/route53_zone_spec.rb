require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

tf_state = Helpers::State::load_state_for_module("route53_zone")

zone_name = tf_state['modules'][0]['outputs']['zone_name']['value']

describe route53_hosted_zone(zone_name), region: 'ap-southeast-2' do
  it { should exist }
end

