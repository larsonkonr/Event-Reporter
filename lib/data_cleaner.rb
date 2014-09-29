def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, "0")[0..4]
end

def clean_phone_number(phone_number)
  phone_number.to_s.gsub!((/\D/), "")
  if bad_phone_number?(phone_number)
    nil
  elsif correct_prefix?(phone_number)
    phone_number[1..11]
  else
    phone_number
  end
end

def bad_phone_number?(phone_number)
  incorrect_prefix?(phone_number) || incorrect_length?(phone_number)
end

def incorrect_length?(phone_number)
  too_long?(phone_number) || too_short?(phone_number)
end

def too_long?(phone_number)
  phone_number.length > 11
end

def too_short?(phone_number)
  phone_number.length < 10
end

def correct_prefix?(phone_number)
  phone_number.length == 11 && phone_number[0] == "1"
end

def incorrect_prefix?(phone_number)
  phone_number.length == 11 && phone_number[0] != "1"
end

# contents.each do |row|
#   id = row[0]
#   name = row[:first_name]
#   phone_number = clean_phone_number(row[:homephone])
#   zipcode = clean_zipcode(row[:zipcode])
#   puts "#{name} #{zipcode} #{phone_number}"
# end
