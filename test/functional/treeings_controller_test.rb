# -*- encoding : utf-8 -*-
require 'test_helper'

class TreeingsControllerTest < ActionController::TestCase
  setup do
    @treeing = treeings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treeings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treeing" do
    assert_difference('Treeing.count') do
      post :create, treeing: {  }
    end

    assert_redirected_to treeing_path(assigns(:treeing))
  end

  test "should show treeing" do
    get :show, id: @treeing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treeing
    assert_response :success
  end

  test "should update treeing" do
    put :update, id: @treeing, treeing: {  }
    assert_redirected_to treeing_path(assigns(:treeing))
  end

  test "should destroy treeing" do
    assert_difference('Treeing.count', -1) do
      delete :destroy, id: @treeing
    end

    assert_redirected_to treeings_path
  end
end
