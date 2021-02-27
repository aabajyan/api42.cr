require "./api42"

class Api42::Client
  def initialize(@client_id : String, @client_secret : String)
    @client = HTTP::Client.new(API_URL, tls: true)
    @expires_in = Time.utc

    get_token
  end

  def user(username : String)
    User.from_json(get "/v2/users/#{username}")
  end

  def coalition(username : String)
    Array(Coalition).from_json(get "/v2/users/#{username}/coalitions")
  end

  def cursus(username : String)
    Array(CursusUser).from_json(get "/v2/users/#{username}/cursus_users")
  end

  private def post(url : String, params = {} of String => String)
    handle_response @client.post(url, body: HTTP::Params.encode(params))
  end

  private def get(url : String, params = {} of String => String)
    url += "?#{HTTP::Params.encode(params)}" unless params.empty?
    handle_response @client.get(url)
  end

  private def handle_response(response : HTTP::Client::Response)
    case response.status_code
    when 200..299
      response.body
    else
      raise "#{response.status_code} - #{response.body}"
    end
  end

  private def get_token
    result = post("/oauth/token", {
      grant_type:    "client_credentials",
      client_id:     @client_id,
      client_secret: @client_secret,
    })

    # Can't pass params individually,
    # Error: can't instantiate abstract class OAuth2::AccessToken on @scope
    access_token = OAuth2::AccessToken.new(JSON::PullParser.new(result))
    access_token.authenticate(@client)
    if expire_seconds = access_token.expires_in
      @expires_in = Time.utc + expire_seconds.seconds
    end
  end

  # TODO: It's currently broken
  private def check_token
    if @expires_in < Time.utc
      get_token
    end
  end
end
