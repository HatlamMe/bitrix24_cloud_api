module Bitrix24CloudApi
  module TELEPHONY
    # Bitrix24 telephony API
    module EXTERNALCALL
      def self.const_missing(c)
        target_class = Bitrix24CloudApi::Telephony.const_get(c)
        target_class.define_singleton_method(:resource_path) { "telephony.#{c.downcase}" }
        target_class
      end
    end

    # Bitrix24 telephony external call API
    class ExternalCall < Bitrix24CloudApi::Telephony
      %i[register finish show].each do |action|
        define_singleton_method(action) do |client, query = {}|
          client.make_get_request(resource_url(client, action), query)
        end
      end
    end
  end
end
