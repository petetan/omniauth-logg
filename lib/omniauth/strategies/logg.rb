require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class LOGG < OmniAuth::Strategies::OAuth2
      option :name, :synctree

      option :client_options, {
        :site => "https://logg.com",
        :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info["id"]
      end

      info do
        {
          :email => raw_info["email"],
          :name => raw_info["name"],
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end