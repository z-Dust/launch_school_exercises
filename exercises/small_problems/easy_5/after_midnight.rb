MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24

def calc_min(int)
  int % MINUTES_PER_HOUR
end

def calc_hour(int)
  hour = int / MINUTES_PER_HOUR
  hour %= HOURS_PER_DAY if hour > HOURS_PER_DAY || hour < -HOURS_PER_DAY # should loop this and the next line
  hour += HOURS_PER_DAY if hour < 0
  hour
end

def time_of_day(int)
  p format('%02d:%02d', calc_hour(int), calc_min(int))
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# DAY_PERIOD = 1440
# MINUTES_IN_HOUR = 60

# # this is the method that is guaranteed to output the same thing periodically...
# def time_of_day(minutes_offset)
#   minutes = convert_to_periodic_range(minutes_offset, DAY_PERIOD)
#   format_time(minutes)
# end

# # and this method actually adds/subtracts the period
# def convert_to_periodic_range(num, period)
#   positive = num > 0
#   loop do
#     if num >= 0 && num < period
#       break
#     end
#   positive ? num -= period : num += period
#   end # modulo makes this a lot faster, this is just strictly following the definition
#   num
# end

# def format_time(num)
#   hours, minutes = num.divmod(MINUTES_IN_HOUR)
#   hours = format("%02d", hours)
#   format('%02d:%02d', hours, minutes)
# end
