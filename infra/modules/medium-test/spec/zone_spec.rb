require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe route53_hosted_zone(outputs[:zone_name][:value]), region: 'ap-southeast-2' do
  it { should exist }
end

