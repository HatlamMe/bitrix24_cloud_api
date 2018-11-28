module Bitrix24CloudApi
  class Telephony < Base
    %i[add delete update].each do |action|
      define_singleton_method(action) do |client, query = {}|
        client.make_post_request(resource_url(client, action), query)
      end
    end

    %i[get list fields].each do |action|
      define_singleton_method(action) do |client, query = {}|
        client.make_get_request(resource_url(client, action), query)
      end
    end
  end
end

require 'bitrix24_cloud_api/Telephony/telephony'
