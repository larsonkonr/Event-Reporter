require_relative 'data_cleaner'
class Entry
  attr_reader :regdate,
              :first_name,
              :last_name,
              :email,
              :phone_number,
              :address,
              :city,
              :state,
              :zipcode,
              :cleaner

  def initialize(data)
    @cleaner        = DataCleaner.new
    @regdate        = data[:regdate]
    @first_name     = cleaner.clean_name(data[:first_name])
    @last_name      = cleaner.clean_name(data[:last_name])
    @email          = data[:email_address]
    @phone_number   = cleaner.clean_phone_number(data[:homephone])
    @address        = cleaner.clean_address(data[:street])
    @city           = cleaner.clean_city(data[:city])
    @state          = cleaner.clean_state(data[:state])
    @zipcode        = cleaner.clean_zipcode(data[:zipcode])
  end

  def self.headers
    ["regdate", "first_name", "last_name", "email_address", "homephone", "street", "city", "state", "zipcode"]
  end

  def to_a
    [regdate, first_name, last_name, email, phone_number, address, city, state, zipcode]
  end
end
