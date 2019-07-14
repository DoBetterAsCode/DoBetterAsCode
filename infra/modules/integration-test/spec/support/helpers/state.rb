module Helpers
  module State
    def load_state_for_module(module_name)
      state_file = "terraform/#{module_name}/terraform.tfstate.d/kitchen-terraform-#{module_name.gsub("_", "-")}-aws/terraform.tfstate"
      JSON.parse(File.open(state_file).read)
    end
    module_function :load_state_for_module
  end 
end
