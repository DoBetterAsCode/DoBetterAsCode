require 'awspec'
require 'aws-sdk'
require 'json'
require 'rhcl'
require 'httparty'

state_file = 'terraform/cloudfront_distribution/terraform.tfstate.d/kitchen-terraform-cloudfront-distribution-aws/terraform.tfstate'
tf_state = JSON.parse(File.open(state_file).read)

distribution_domain = tf_state['modules'][0]['outputs']['hosted_domain']['value']

describe 'e2e connectivity' do
  response = HTTParty.get("https://#{distribution_domain}/index.html")
  it 'should return 200 when getting an existing file' do
    expect(response.code).to eq(200)
  end
  it 'should return the file contents' do
    expect(response.body).to eq("test")
  end
end