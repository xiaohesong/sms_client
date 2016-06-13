require 'settingslogic'

module SmsClient
  class Setting < ::Settingslogic
    namespace ( (Rails.env.to_s if defined?(Rails)) || ENV["RAILS_ENV"] || ENV["RACK_ENV"] )

    def self.load_source(root_path)
      source(File.join(root_path, "config/sms_client.yml"))
      reload!
      self
    end
  end
end
