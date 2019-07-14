require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

tf_state = Helpers::State::load_state_for_module("acm_certificate")

certificate_name = tf_state['modules'][0]['outputs']['certificate_name']['value']

describe acm(certificate_name), region: 'ap-southeast-2' do
  it { should exist }
  it { should be_issued }
end