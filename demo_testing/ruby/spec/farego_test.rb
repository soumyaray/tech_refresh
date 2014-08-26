require 'watir-webdriver'
require 'minitest/autorun'
require 'minitest/rg'

describe 'the page loads' do
  before do
    @b = Watir::Browser.new :chrome
    @b.goto 'http://farego.com.tw'
  end

  # after do
  #   @b.close
  # end

  # it 'has the correct fields' do
  #   # set language to Chinese
  #   dwnLang = @b.span(id: 'dwnLang')
  #   dwnLang.click
  #
  #   chinese = @b.li(text: '繁體中文')
  #   chinese.click
  # 	depCity = @b.span(id: 'selDepartureCity')
  #   depCity.text.must_equal '台北'
  # 	arrCity = @b.span(class: 'sel-tree fixed-w')
  #   arrCity.text.must_equal '不限定'
  #   searchBtn = @b.input(id: 'btnSearch')
  #   searchBtn.value.must_equal '搜 尋'
  #   selday = @b.span(id: 'selStay')
  #   selday.text.must_equal '2'
  # end

  # it 'has quick search results' do
  #   selday = @b.span(id: 'selStay')
  #   selday.click
  #   day6 = @b.li(text:'6')
  #   day6.click
  #   selday.text.must_equal '6'

  #   startDate = @b.input(id: 'StartDate')
  #   startDate.click

  #   nextMonthBtn = @b.a(class: 'ui-datepicker-next ui-corner-all')
  #   nextMonthBtn.click

  #   firstDate = @b.a(class: 'ui-state-default')
  #   firstDate.click

  #   endDate = @b.input(id: 'EndDate')
  #   endDate.click

  #   nextMonthBtn = @b.a(class: 'ui-datepicker-next ui-corner-all')
  #   nextMonthBtn.click
  #   nextMonthBtn = @b.a(class: 'ui-datepicker-next ui-corner-all')
  #   nextMonthBtn.click

  #   secondDate = @b.a(class: 'ui-state-default')
  #   secondDate.click

  #   searchBtn = @b.input(id: 'btnSearch')
  #   searchBtn.click

  #   resultCount = @b.b(id: 'resultCount')

  #   resultCount.text.to_i.must_be :>, 1
  # end

  it 'has no result' do
    # set language to Chinese
    @b.span(id: 'dwnLang').click
    @b.li(text: '繁體中文').click

    @b.input(id: 'StartDate').click
    @b.a(class: 'ui-datepicker-next ui-corner-all').click
    @b.a(class: 'ui-state-default').click

    @b.input(id: 'EndDate').click
    @b.a(class: 'ui-datepicker-next ui-corner-all').click
    @b.a(class: 'ui-datepicker-next ui-corner-all').click
    @b.a(class: 'ui-state-default').click

    # change destination
    @b.span(class: 'sel-tree fixed-w').click
    @b.a(rel:'EUR').click
    @b.a(rel:'LON').click

    @b.span(id:'selBudgetAmount').click
    @b.li(text:'最高 10,000').click
    sleep 1   # wait for search button to be uncovered

    @b.input(id: 'btnSearch').click
    sleep 2

    alert_text = nil
    begin
      alert_text = @b.alert.text
      @b.alert.ok
    rescue Watir::Exception::UnknownObjectException => e
      puts e
    end
    alert_text.must_match 'No Results'
  end
end

# describe 'submission works' do
#   before do
#     @b.goto 'http://farego.com.tw'
#   end
#
#   it 'says thank you' do
#     @b.goto 'bit.ly/watir-webdriver-demo'
#     @b.text_field(id: 'entry_0').set 'Your Name'
#     @b.select_list(id: 'entry_1').select 'Ruby'
#     @b.button(name: 'submit').click
#     @b.text.must_include 'Thank you'
#   end
# end
