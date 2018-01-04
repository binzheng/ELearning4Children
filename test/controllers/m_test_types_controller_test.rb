require 'test_helper'

class MTestTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_test_type = m_test_types(:one)
  end

  test "should get index" do
    get m_test_types_url
    assert_response :success
  end

  test "should get new" do
    get new_m_test_type_url
    assert_response :success
  end

  test "should create m_test_type" do
    assert_difference('MTestType.count') do
      post m_test_types_url, params: { m_test_type: { created_id: @m_test_type.created_id, parentTypeId: @m_test_type.parentTypeId, testDesc: @m_test_type.testDesc, testImage: @m_test_type.testImage, testName: @m_test_type.testName, testSize: @m_test_type.testSize, testUrl: @m_test_type.testUrl, updated_id: @m_test_type.updated_id } }
    end

    assert_redirected_to m_test_type_url(MTestType.last)
  end

  test "should show m_test_type" do
    get m_test_type_url(@m_test_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_m_test_type_url(@m_test_type)
    assert_response :success
  end

  test "should update m_test_type" do
    patch m_test_type_url(@m_test_type), params: { m_test_type: { created_id: @m_test_type.created_id, parentTypeId: @m_test_type.parentTypeId, testDesc: @m_test_type.testDesc, testImage: @m_test_type.testImage, testName: @m_test_type.testName, testSize: @m_test_type.testSize, testUrl: @m_test_type.testUrl, updated_id: @m_test_type.updated_id } }
    assert_redirected_to m_test_type_url(@m_test_type)
  end

  test "should destroy m_test_type" do
    assert_difference('MTestType.count', -1) do
      delete m_test_type_url(@m_test_type)
    end

    assert_redirected_to m_test_types_url
  end
end
