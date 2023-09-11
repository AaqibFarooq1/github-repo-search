require "test_helper"

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success response for valid search' do
    get repo_search_path, params: { search: 'rails' }
    assert_response :success
  end

  test 'should display no repositories message when no results found' do
    get repo_search_path, params: { search: 'repo_that_probably_doesnt_exist' }
    assert_response :success
    assert_select 'h1', text: 'No repositories to show'
  end

  test 'should display search results when repositories are found' do
    get repo_search_path, params: { search: 'rails' }
    assert_response :success
    assert_select '.search_result', minimum: 1
  end
end
