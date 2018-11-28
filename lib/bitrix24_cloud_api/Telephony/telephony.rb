module Bitrix24CloudApi
  module Telephony
    module Telephony
      def self.const_missing(c)
        if %i[ExternalCall].any? { |x| x == c }
          target_class = Bitrix24CloudApi::CRM.const_get(c)
          target_class.define_singleton_method(:resource_path) { "telephony.#{c.downcase}" }
          target_class
        end
      end
    end

    class Telephony < Bitrix24CloudApi::Telephony
      %i[register finish].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end
