require_relative 'test_helper'

class EntryRepositoryTest < Minitest::Test
  attr_reader :entries, :repository
  
  def setup
    @entries = [
      { first_name: 'Alice', last_name: 'Smith', homephone: '111.111.1111' },
      { first_name: 'Bob', last_name: 'Smith', homephone: '222.222.2222' },
      { first_name: 'Cindy', last_name: 'Johnson', homephone: '333.333.3333' }
    ].map { |row| Entry.new(row) }
    @repository = EntryRepository.new(entries)
  end

  def test_find_by_last_name
    entries = repository.find_by("last_name", "Smith").sort_by { |e| e.first_name }
    assert_equal 2, entries.length
    alice, bob = entries
    assert_equal "alice", alice.first_name
    assert_equal "1111111111", alice.phone_number
    assert_equal "bob", bob.first_name
    assert_equal "2222222222", bob.phone_number
  end
end
