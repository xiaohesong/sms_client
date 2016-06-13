require "sms_client/version"

module SmsClient
  class << self
    extend Forwardable

    def_delegators :config, :root
    def_delegators :publisher, :publish, :connected?

    def setting
      @setting ||= SmsClient::Setting.load_source(SmsClient.root)
    end

    def publisher
      return @publisher if (@publisher and @publisher.connected?)
      @publisher = SmsClient::Publisher.new(setting.connect)
    end

  end
end

require 'sms_client/configurable'
require 'sms_client/errors'
require 'sms_client/setting'
require 'sms_client/publisher'
require 'sms_client/mobile'
