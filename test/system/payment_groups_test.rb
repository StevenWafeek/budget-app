require 'application_system_test_case'

class PaymentGroupsTest < ApplicationSystemTestCase
  setup do
    @payment_group = payment_groups(:one)
  end

  test 'visiting the index' do
    visit payment_groups_url
    assert_selector 'h1', text: 'Payment groups'
  end

  test 'should create payment group' do
    visit payment_groups_url
    click_on 'New payment group'

    fill_in 'Group', with: @payment_group.group_id
    fill_in 'Payment', with: @payment_group.payment_id
    click_on 'Create Payment group'

    assert_text 'Payment group was successfully created'
    click_on 'Back'
  end

  test 'should update Payment group' do
    visit payment_group_url(@payment_group)
    click_on 'Edit this payment group', match: :first

    fill_in 'Group', with: @payment_group.group_id
    fill_in 'Payment', with: @payment_group.payment_id
    click_on 'Update Payment group'

    assert_text 'Payment group was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Payment group' do
    visit payment_group_url(@payment_group)
    click_on 'Destroy this payment group', match: :first

    assert_text 'Payment group was successfully destroyed'
  end
end
