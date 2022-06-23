require "test_helper"

class PaintingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @painting = paintings(:one)
  end

  test "should get index" do
    get paintings_url, as: :json
    assert_response :success
  end

  test "should create painting" do
    assert_difference("Painting.count") do
      post paintings_url, params: { painting: { description: @painting.description, name: @painting.name, order: @painting.order, user_id: @painting.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show painting" do
    get painting_url(@painting), as: :json
    assert_response :success
  end

  test "should update painting" do
    patch painting_url(@painting), params: { painting: { description: @painting.description, name: @painting.name, order: @painting.order, user_id: @painting.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy painting" do
    assert_difference("Painting.count", -1) do
      delete painting_url(@painting), as: :json
    end

    assert_response :no_content
  end
end
