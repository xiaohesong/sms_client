module SmsClient
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.expand_path("../../templates", __FILE__)

			def copy_initializer
				template "sms_client.yml.example", "config/sms_client.yml.example"
        template "sms_client.rb", "config/initializers/sms_client.rb"
			end

		end
	end
end
