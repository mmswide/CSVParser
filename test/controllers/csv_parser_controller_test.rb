require 'test_helper'

class CsvParserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csv_parser_index_url
    assert_response :success
  end

  test "should get new" do
    get csv_parser_new_url
    assert_response :success
  end

end
