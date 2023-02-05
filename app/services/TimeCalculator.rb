class TimeCalculator
  attr_accessor :current_time

  def initialize
    @current_time = Time.now
  end

  def elapsed_time
    Time.now - @current_time
  end
end
