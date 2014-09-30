gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'stringio'
require_relative '../lib/cli'
require_relative '../lib/entry_repository'
require_relative '../lib/entry'
require_relative '../lib/printer'
require_relative '../lib/entry_queue'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    fake_stdout = StringIO.new
    @cli = CLI.new(fake_stdout)
    @repository = EntryRepository.load_entries("./test/fixtures/small_event_attendees.csv")
  end

  def test_process_initial_commands
    cli.stub :command, "load" do
      cli.process_initial_commands
      assert_equal EntryRepository.load_entries("./data"), cli.repository
    end

  end

  def test_lookup_first_name
    criteria = "Allison"
    unexpected_criteria = "Viki"
    cli.stub :repository, @repository do
      assert_equal [criteria], cli.lookup_first_name(criteria).map(&:first_name)
      refute_equal [unexpected_criteria], cli.lookup_first_name(unexpected_criteria).map(&:first_name)
    end
  end

  def test_lookup_last_name
    criteria = "Davis"
    unexpected_criteria = "Harrod"
    cli.stub :repository, @repository do
      assert_equal [criteria], cli.lookup_last_name(criteria).map(&:last_name)
      refute_equal [unexpected_criteria], cli.lookup_last_name(unexpected_criteria).map(&:last_name)
    end
  end

  def test_has_a_command
    assert cli.respond_to?(:command)
  end

  def test_command_starts_out_empty
    assert_equal "", cli.command
  end

  def test_cli_can_start
    assert cli.respond_to?(:start)
  end

  def test_can_quit
    assert cli.respond_to?(:quit?)
  end
end
