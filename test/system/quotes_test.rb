require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test "Creating quote " do 
    visit quotes_path
    assert_selector 'h1', text: 'Quote'

    click_on 'New quote'

    fill_in 'Name', with: 'Capybara quote'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'
  end  

  test "showing a quote" do 
    visit quotes_path
    click_link @quote.name
    assert_selector 'h1', text: @quote.name

  end

  test "Updating a quote" do 
    visit quotes_path
    assert_selector 'h1', text: "Quotes"

    first('.quote').click_link('edit')

    fill_in 'Name', with: 'updated quote'
    click_on 'Update quote'

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
