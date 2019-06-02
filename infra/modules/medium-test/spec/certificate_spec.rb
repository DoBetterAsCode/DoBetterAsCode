require 'awspec'
require 'aws-sdk'
require 'json'

outputs = eval(ENV['KITCHEN_KITCHEN_TERRAFORM_OUTPUT'])

describe acm(outputs[:certificate_name][:value]), region: 'ap-southeast-2' do
  it { should exist }
  it { should have_domain_validation_option(domain_name: outputs[:certificate_name][:value], validation_method: 'DNS' )}
end