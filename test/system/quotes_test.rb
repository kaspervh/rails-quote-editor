require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first)
  end

  test "Creating quote " do 
    visit quote_path
    assert_selector 'h1', text: 'Quote'

    click_on 'new quote'
    assert_selector 'h1', text: 'New Quote'

    fill_in 'Name', with: 'this is a test'
    click_on 'create quote'

    assert_selector 'h1', text: 'quotes'
    assert_text 'this is a test'
  end  

  test "showing a quote" do 
    visit quote_path
    click_link @quote.name
    assert_selector 'h1', text: @quote.name

  end

  test "Updating a quote" do 
    visit quotes_path
    assert_selector 'h1', text: "Quotes"

    click_on 'edit'
    assert_selector 'h1', text: 'edit quote'

    fill_in 'Name', with: 'updated quote'
    click_on 'update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'updated quote'
  end

  test 'destroying a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'delete', match: :first
    assert_no_text @quote.name
  end
 
end
