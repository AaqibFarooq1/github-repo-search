class RepositoriesController < ApplicationController
  include HTTParty

  def repo_search
    url = 'https://api.github.com/search/repositories'
    search_term = params.require(:search)
    query_params = { q: search_term }
    response = HTTParty.get(url, query: query_params)

    raise "Error #{response.code}: Error fetching GitHub repositories" unless response.code == 200

    @repositories = JSON.parse(response.body)
    render :index
  end
end
