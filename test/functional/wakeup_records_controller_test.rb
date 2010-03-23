require 'test_helper'

class WakeupRecordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wakeup_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wakeup_record" do
    assert_difference('WakeupRecord.count') do
      post :create, :wakeup_record => { }
    end

    assert_redirected_to wakeup_record_path(assigns(:wakeup_record))
  end

  test "should show wakeup_record" do
    get :show, :id => wakeup_records(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wakeup_records(:one).to_param
    assert_response :success
  end

  test "should update wakeup_record" do
    put :update, :id => wakeup_records(:one).to_param, :wakeup_record => { }
    assert_redirected_to wakeup_record_path(assigns(:wakeup_record))
  end

  test "should destroy wakeup_record" do
    assert_difference('WakeupRecord.count', -1) do
      delete :destroy, :id => wakeup_records(:one).to_param
    end

    assert_redirected_to wakeup_records_path
  end
end
