require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Actions", with: @order.actions
    fill_in "Approved", with: @order.approved
    fill_in "Approved by", with: @order.approved_by
    fill_in "Closed", with: @order.closed
    fill_in "Closed by", with: @order.closed_by
    fill_in "Description", with: @order.description
    fill_in "Order number", with: @order.order_number
    fill_in "Recieved", with: @order.recieved
    fill_in "Recieved by", with: @order.recieved_by
    fill_in "Remarks", with: @order.remarks
    fill_in "Status", with: @order.status
    fill_in "Title", with: @order.title
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Actions", with: @order.actions
    fill_in "Approved", with: @order.approved
    fill_in "Approved by", with: @order.approved_by
    fill_in "Closed", with: @order.closed
    fill_in "Closed by", with: @order.closed_by
    fill_in "Description", with: @order.description
    fill_in "Order number", with: @order.order_number
    fill_in "Recieved", with: @order.recieved
    fill_in "Recieved by", with: @order.recieved_by
    fill_in "Remarks", with: @order.remarks
    fill_in "Status", with: @order.status
    fill_in "Title", with: @order.title
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
