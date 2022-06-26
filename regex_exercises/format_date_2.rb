def format_date(date)
  p date.sub(/\A(\d{4})(-|\/)(\d{2})\2(\d{2})\z/, '\4.\3.\1')
end

# def format_date(original_date)
#   original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
#                .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
# end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'
format_date('2015/01-31') # -> '2015/01-31' (no change)
