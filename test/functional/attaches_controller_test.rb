# -*- encoding : utf-8 -*-
require 'test_helper'

class AttachesControllerTest < ActionController::TestCase
  setup do
    @attach = attaches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attach" do
    assert_difference('Attach.count') do
      post :create, attach: {  }
    end

    assert_redirected_to attach_path(assigns(:attach))
  end

  test "should show attach" do
    get :show, id: @attach
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attach
    assert_response :success
  end

  test "should update attach" do
    put :update, id: @attach, attach: {  }
    assert_redirected_to attach_path(assigns(:attach))
  end

  test "should destroy attach" do
    assert_difference('Attach.count', -1) do
      delete :destroy, id: @attach
    end

    assert_redirected_to attaches_path
  end
end
