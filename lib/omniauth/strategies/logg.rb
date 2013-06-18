require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Logg < OmniAuth::Strategies::OAuth2
      option :name, :logg

      option :client_options, {
        :site => "https://logg.com",
        :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info["uid"]
      end

      info do
        {
          :email => raw_info["info"]["email"],
          :name => raw_info["info"]["name"],
          :first_name => raw_info["info"]["first_name"],
          :last_name => raw_info["info"]["last_name"],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end