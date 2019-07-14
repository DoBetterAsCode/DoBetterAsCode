require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'

tf_state = Helpers::State::load_state_for_module("cloudfront_distribution")

distribution_domain = tf_state['modules'][0]['outputs']['distribution_domain']['value']

describe cloudfront_distribution(distribution_domain), region: 'ap-southeast-2' do
  it { should exist }
end

