=begin
  -given a set of parameters, determine how many times a nouncing ball will be viewed from a windows
  -parameters are:
    -h is the height from which ball is dropped
    -the bounce parameter is the percetage of h that the ball returns to after bouncing
    -window height is height of window
  -requirements:
    -h must be greater than 0
    -bounce muct be greater than 0 and less than 1
    -window must be less than h
      -if these conditions are not met, return -1
  -input: 1 integer, and 2 float, output: integer

  algorithm-
  -test for requirements, return -1 if not met
        -return num of bounces if height is less than window
          -(times_seen initialized to 1)
        -recurively call, h = h * bounce, times_seen = times_seen + 1
=end

def bouncingBall(h, bounce, window)
  return -1 if h <= window || bounce <= 0 || bounce >= 1 || h <= 0
  times_seen = 1
  bounces(h, bounce, window, times_seen)
end

def bounces(h, bounce, window, times_seen)
  return times_seen - 2 if h <= window
  bounces(h*bounce, bounce, window, times_seen + 2)
end


p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1
p bouncingBall(1, 0.66, 0.66) == 1
p bouncingBall(1, 0.66, 1) == -1
