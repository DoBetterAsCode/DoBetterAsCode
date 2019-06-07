require 'awspec'
require 'pry'
Awsecrets.load(secrets_path: File.expand_path('./secrets.yml', File.dirname(__FILE__)))
