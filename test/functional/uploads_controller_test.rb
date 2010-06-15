require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Upload.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Upload.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Upload.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to upload_url(assigns(:upload))
  end
  
  def test_edit
    get :edit, :id => Upload.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Upload.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Upload.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Upload.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Upload.first
    assert_redirected_to upload_url(assigns(:upload))
  end
  
  def test_destroy
    upload = Upload.first
    delete :destroy, :id => upload
    assert_redirected_to uploads_url
    assert !Upload.exists?(upload.id)
  end
end
