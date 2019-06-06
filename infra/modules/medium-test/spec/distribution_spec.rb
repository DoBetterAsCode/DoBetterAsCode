require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe cloudfront_distribution(outputs[:distribution_domain][:value]), region: 'ap-southeast-2' do
  it { should exist }
  it { should be_deployed }
end

