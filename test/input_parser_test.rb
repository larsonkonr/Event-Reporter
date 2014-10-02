require_relative 'test_helper'

class InputParserTest < Minitest::Test
  attr_reader :input_parser

  def setup
    @input_parser = InputParser.new
  end

  def test_it_starts_with_an_empty_command
    assert_equal "", input_parser.command
  end

  def test_parse_splits_command
    input_parser.command = 'foo bar'
    result = input_parser.parse
    assert_equal ['foo', 'bar'], result
  end
end
