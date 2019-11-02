require 'test_helper'

class InvoiceProfilesControllerTest < ActionController::TestCase
  setup do
    @invoice_profile = invoice_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_profile" do
    assert_difference('InvoiceProfile.count') do
      post :create, invoice_profile: { address1: @invoice_profile.address1, address2: @invoice_profile.address2, bank_name: @invoice_profile.bank_name, dic: @invoice_profile.dic, iban: @invoice_profile.iban, icdph: @invoice_profile.icdph, ico: @invoice_profile.ico, name: @invoice_profile.name }
    end

    assert_redirected_to invoice_profile_path(assigns(:invoice_profile))
  end

  test "should show invoice_profile" do
    get :show, id: @invoice_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_profile
    assert_response :success
  end

  test "should update invoice_profile" do
    patch :update, id: @invoice_profile, invoice_profile: { address1: @invoice_profile.address1, address2: @invoice_profile.address2, bank_name: @invoice_profile.bank_name, dic: @invoice_profile.dic, iban: @invoice_profile.iban, icdph: @invoice_profile.icdph, ico: @invoice_profile.ico, name: @invoice_profile.name }
    assert_redirected_to invoice_profile_path(assigns(:invoice_profile))
  end

  test "should destroy invoice_profile" do
    assert_difference('InvoiceProfile.count', -1) do
      delete :destroy, id: @invoice_profile
    end

    assert_redirected_to invoice_profiles_path
  end
end
