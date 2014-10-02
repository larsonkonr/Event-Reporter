require_relative 'test_helper'

class CLITest < Minitest::Test
  attr_reader :cli, :input

  def setup
    fake_stdout = StringIO.new
    @cli = CLI.new(fake_stdout)
    @input = InputParser.new
    @repository = EntryRepository.load_entries("./test/fixtures/small_event_attendees.csv")
  end

  def test_lookup_first_name
    attribute = "first_name"
    criteria = "allison"
    unexpected_criteria = "viki"
    cli.stub :repository, @repository do
      assert_equal criteria, cli.find(attribute, criteria).first.first_name
      assert_equal [], cli.find(attribute, unexpected_criteria)
    end
  end

  def test_lookup_last_name
    attribute = "last_name"
    criteria = "davis"
    unexpected_criteria = "harrod"
    cli.stub :repository, @repository do
      assert_equal criteria, cli.find(attribute, criteria).first.last_name
      assert_equal [], cli.find(attribute, unexpected_criteria)
    end
  end

  def test_has_input
    assert cli.respond_to?(:input)
  end

  def test_cli_can_start
    assert cli.respond_to?(:start)
  end

  def test_can_quit
    assert cli.respond_to?(:quit?)
  end
end
