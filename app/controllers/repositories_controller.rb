class RepositoriesController < ApplicationController
  include HTTParty

  def repo_search
    url = 'https://api.github.com/search/repositories'
    @search_term = search_params
    query_params = { q: @search_term }
    response = HTTParty.get(url, query: query_params)

    unless response.code == 200
      flash[:warning] = "Error #{response.code}: Could not fetch GitHub repositories"
    end

    @repositories = JSON.parse(response.body)
    render :index
  end

  private

  def search_params
    params.require(:search)
  end
end
