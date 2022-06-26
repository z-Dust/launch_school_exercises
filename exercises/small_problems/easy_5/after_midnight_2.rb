MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440
HOURS_PER_DAY = 24

def parse_hour(time)
  time[0, 2].to_i
end

def parse_min(time)
  time[3, 2].to_i
end

def after_midnight(time)
  hour = parse_hour(time)
  min = parse_min(time)
  if hour == 24 || hour == 0
    0
  else
    (hour * MINUTES_PER_HOUR) + min
  end
end

def before_midnight(time)
  hour = parse_hour(time)
  min = parse_min(time)
  if hour == 24 || hour == 0
    0
  else
    ((HOURS_PER_DAY - (hour + 1)) * MINUTES_PER_HOUR) + (MINUTES_PER_HOUR - min)
  end
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

# p parse_hour('12:34')
# p parse_min('12:34')
