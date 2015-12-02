module OauthHelper
  def login_with_oauth
    setup_mock_auth
    visit "/auth/google_oauth2"
  end

  def setup_mock_auth
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: "myusa",
      raw_info: {
        "name" => "George Jetson"
      },
      uid: "12345",
      nickname: "georgejetsonmyusa",
      extra: {
        "raw_info" => {
          "email" => "test@cantinaconsulting.com",
          "first_name" => "George",
          "last_name" => "Jetson"
        }
      },
      credentials: {
        "token" => "1a2b3c4d"
      }
    )
  end
end
