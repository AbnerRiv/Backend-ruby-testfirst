def time_helper(seconds)
  hour = seconds / 3600
  minute = (seconds - (hour*3600) ) / 60
  second = ( seconds - ((hour * 3600) + (minute * 60)) )

  hour_str = hour.to_s.split("").length > 1 ? hour.to_s : "0" + hour.to_s
  minute_str = minute.to_s.split("").length > 1 ? minute.to_s : "0" + minute.to_s
  second_str = second.to_s.split("").length > 1 ? second.to_s : "0" + second.to_s

  hour_str + ":" + minute_str + ":" + second_str
end

class Timer
  #write your code here
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    time_helper(seconds)
  end

end
