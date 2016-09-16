require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Shine < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'activity'

      option :client_options, {
        :site => 'https://api.misfitwearables.com',
        :authorize_url => '/auth/dialog/authorize',
        :token_url => '/auth/tokens/exchange'
      }

      # provider does not really ignore state, but am getting
      # error when returning via the moves: scheme link.
      # option :provider_ignores_state, true


      # uid { raw_info['userId'] }
      uid { '12345' }
      # info do { :firstDate => (raw_info['profile'] || {})['firstDate'] } end
      info do { :foo => 'fee' } end
      extra do { :raw_info => raw_info } end

      def request_phase
        options[:authorize_params] = client_params.merge(options[:authorize_params])
        super
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, client_params.merge({:grant_type => 'authorization_code'}))
      end

      def raw_info
        # @raw_info ||= access_token.get('https://api.misfitwearables.com/move/v1/user/me/profile').parsed
        @raw_info
      end

      def callback_url
        options[:callback_url] || (full_host + script_name + callback_path)
      end

      private

      def client_params
        {:client_id => options[:client_id], :redirect_uri => callback_url ,:response_type => "code", :scope => DEFAULT_SCOPE}
      end
    end
  end
end


# REQUEST->
# https://api.misfitwearables.com/auth/dialog/authorize?client_id=2NkGXtz09DBjffJK & redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Fauth%2Fshine%2Fcallback & response_type=code & state=3958ee59df5e8376e109109409046be64cad30ecbf4384fe
