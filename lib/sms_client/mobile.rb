module SmsClient
  class Mobile
    def initialize(to)
      @mobile = case to
                when String
                  to.split(',')
                when Array
                  to
                end
    end

    def mobile
      @mobile && @mobile.select {|x| x =~ /^1\d{10}$/}
    end

    def valid?
      mobile.present?
    end
  end
end
