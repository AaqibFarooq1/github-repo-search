require "test_helper"

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should return a success response' do
    get :index
    assert_response :success
  end

  test 'should render the index template' do
    get :index
    assert_template :index
  end

  test 'should populate the repositories variable with search results' do
    get :index, params: { search: 'rails' }
    repositories = assigns(:repositories)

    assert_kind_of Array, repositories
    assert_not_empty repositories
    assert repositories.first.is_a?(Hash)
    assert repositories.first.key?(:name)
    assert repositories.first.key?(:owner)
    assert repositories.first.key?(:description)
  end
end
