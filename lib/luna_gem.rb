require 'httparty'
require 'json'

class LunaGem
  include HTTParty

  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    JSON.parse(response.body)
  end

private

  def api_url(end_point)
    "https://www.bloc.io/api/v1/#{end_point}"
  end
end
