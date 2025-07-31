require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
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
  # test "visiting the index" do
  #   visit quotes_url
  #
  #   assert_selector "h1", text: "Quotes"
  # end
end
