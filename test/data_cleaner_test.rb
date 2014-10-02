require_relative 'test_helper'

class DataCleanerTest < Minitest::Test
  attr_reader :cleaner
  def setup
    @cleaner = DataCleaner.new
  end

  def test_it_pads_a_short_zipcode
    bad_zip = 1902
    assert_equal "01902", cleaner.clean_zipcode(bad_zip)
  end

  def test_it_shortens_a_long_zipcode
    bad_zip = 19902004
    assert_equal "19902", cleaner.clean_zipcode(bad_zip)
  end

  def test_it_replaces_bad_phone_numbers_with_empty_string
    missing_number = ""
    too_long_number = "290-132-1000020"
    too_short_number = "10923u-2"
    assert_equal "", cleaner.clean_phone_number(missing_number)
    assert_equal "", cleaner.clean_phone_number(too_long_number)
    assert_equal "", cleaner.clean_phone_number(too_short_number)
  end

  def test_it_recognizes_good_phone_numbers
    phone1 = "3051112222"
    phone2 = "(203)232-1111"
    phone3 = "230-113-1111"

    assert_equal phone1, cleaner.clean_phone_number(phone1)
    assert_equal "2032321111", cleaner.clean_phone_number(phone2)
    assert_equal "2301131111", cleaner.clean_phone_number(phone3)
  end

  def test_it_removes_prefixes_from_correct_phone_numbers
    phone_number = "1(333)333-3333"
    assert_equal "3333333333", cleaner.clean_phone_number(phone_number)
  end

  def test_it_downcases_names
    first_name = "VIki"
    last_name = "HARROD"

    assert_equal "viki", cleaner.clean_name(first_name)
    assert_equal "harrod", cleaner.clean_name(last_name)
  end

  def test_it_downcases_cities
    city = "METROpolis"

    assert_equal "metropolis", cleaner.clean_city(city)
  end

  def test_it_downcases_addresses
    address = "123 SOmewhere ST"
    assert_equal "123 somewhere st", cleaner.clean_address(address)
  end

  def test_it_downcases_states
    state = "FL"
    assert_equal "fl", cleaner.clean_state(state)
  end
end
