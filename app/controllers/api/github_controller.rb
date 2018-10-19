class Api::GithubController < ApplicationController
  def contributions
     HTTParty::Basement.default_options.update(verify: false)
     url = "#{base_url}/events"
     data = HTTParty.get(url)
     render json: data.select { |d| d['payload'].has_key?('push_id') && d['payload']['ref'] == 'refs/heads/master' } || []
  end

  private
    def base_url
      "https://api.github.com/users/#{current_user.gh_name}"
    end
end
