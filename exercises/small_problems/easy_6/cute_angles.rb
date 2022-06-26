DEGREE = "\xC2\xB0"

# def dms(float)
#   degrees = float.floor
#   minutes = ((float - degrees) * 60).floor
#   seconds = (((float - degrees) * 60) - minutes) * 60

#   while degrees > 360
#     degrees -= 360
#   end

#   while degrees < 0
#     degrees += 360
#   end

#   p format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

def dms(num)
  num = num % 360
  degrees = num.to_i
  minutes = (num % 1) * 60
  seconds = (((num % 1) * 60) % 1) * 60

  p format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")
