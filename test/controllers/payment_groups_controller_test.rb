require 'test_helper'

class PaymentGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_group = payment_groups(:one)
  end

  test 'should get index' do
    get payment_groups_url
    assert_response :success
  end

  test 'should get new' do
    get new_payment_group_url
    assert_response :success
  end

  test 'should create payment_group' do
    assert_difference('PaymentGroup.count') do
      post payment_groups_url,
           params: { payment_group: { group_id: @payment_group.group_id, payment_id: @payment_group.payment_id } }
    end

    assert_redirected_to payment_group_url(PaymentGroup.last)
  end

  test 'should show payment_group' do
    get payment_group_url(@payment_group)
    assert_response :success
  end

  test 'should get edit' do
    get edit_payment_group_url(@payment_group)
    assert_response :success
  end

  test 'should update payment_group' do
    patch payment_group_url(@payment_group),
          params: { payment_group: { group_id: @payment_group.group_id, payment_id: @payment_group.payment_id } }
    assert_redirected_to payment_group_url(@payment_group)
  end

  test 'should destroy payment_group' do
    assert_difference('PaymentGroup.count', -1) do
      delete payment_group_url(@payment_group)
    end

    assert_redirected_to payment_groups_url
  end
end
