require 'test_helper'

class TestRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_rule = test_rules(:one)
  end

  test "should get index" do
    get test_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_test_rule_url
    assert_response :success
  end

  test "should create test_rule" do
    assert_difference('TestRule.count') do
      post test_rules_url, params: { test_rule: { mTestTypeId: @test_rule.mTestTypeId, maxPoint: @test_rule.maxPoint, maxScore: @test_rule.maxScore, midPoint: @test_rule.midPoint, midScore: @test_rule.midScore, minPoint: @test_rule.minPoint, minScore: @test_rule.minScore, ruleUserId: @test_rule.ruleUserId, testCount: @test_rule.testCount } }
    end

    assert_redirected_to test_rule_url(TestRule.last)
  end

  test "should show test_rule" do
    get test_rule_url(@test_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_rule_url(@test_rule)
    assert_response :success
  end

  test "should update test_rule" do
    patch test_rule_url(@test_rule), params: { test_rule: { mTestTypeId: @test_rule.mTestTypeId, maxPoint: @test_rule.maxPoint, maxScore: @test_rule.maxScore, midPoint: @test_rule.midPoint, midScore: @test_rule.midScore, minPoint: @test_rule.minPoint, minScore: @test_rule.minScore, ruleUserId: @test_rule.ruleUserId, testCount: @test_rule.testCount } }
    assert_redirected_to test_rule_url(@test_rule)
  end

  test "should destroy test_rule" do
    assert_difference('TestRule.count', -1) do
      delete test_rule_url(@test_rule)
    end

    assert_redirected_to test_rules_url
  end
end
