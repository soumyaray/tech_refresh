require 'watir-webdriver'
require 'minitest/autorun'
require 'minitest/rg'


b = Watir::Browser.new

describe 'the page loads' do
  before do
    b.goto 'http://farego.com.tw'
  end

  after do
    # b.close
  end

  it 'has the correct fields' do
  	depCity = b.span(id: 'selDepartureCity')
    depCity.text.must_equal '台北'
  	arrCity = b.span(class: 'sel-tree fixed-w')
    arrCity.text.must_equal '不限定'
    searchBtn = b.input(id: 'btnSearch')
    searchBtn.value.must_equal '搜 尋'
    selday = b.span(id: 'selStay')
    selday.text.must_equal '2'
  end

  it 'quick search' do
    selday = b.span(id: 'selStay')
    selday.click
    day6 = b.li(text:'6')
    day6.click
    selday.text.must_equal '6'

    startDate = b.input(id: 'StartDate')
    startDate.click

    nextMonthBtn = b.a(class: 'ui-datepicker-next ui-corner-all')
    nextMonthBtn.click

    firstDate = b.a(class: 'ui-state-default')
    firstDate.click

    endDate = b.input(id: 'EndDate')
    endDate.click

    nextMonthBtn = b.a(class: 'ui-datepicker-next ui-corner-all')
    nextMonthBtn.click
    nextMonthBtn = b.a(class: 'ui-datepicker-next ui-corner-all')
    nextMonthBtn.click

    secondDate = b.a(class: 'ui-state-default')
    secondDate.click

    searchBtn = b.input(id: 'btnSearch')
    searchBtn.click

    resultCount = b.b(id: 'resultCount');

    if (resultCount.text.to_i > 1)
    	puts resultCount.text
    else
    	puts 'Wrong!'
    end

  end
end

# describe 'submission works' do
#   before do
#     b.goto 'http://farego.com.tw'
#   end

#   # it 'says thank you' do
#   #   b.goto 'bit.ly/watir-webdriver-demo'
#   #   b.text_field(id: 'entry_0').set 'Your Name'
#   #   b.select_list(id: 'entry_1').select 'Ruby'
#   #   b.button(name: 'submit').click
#   #   b.text.must_include 'Thank you'
#   # end
# end