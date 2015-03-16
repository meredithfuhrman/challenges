class Airplane
  attr_reader :type, :wingloading, :horsepower, :engine_on, :flying

  def initialize(type, wingloading, horsepower)
    @type = type
    @wingloading = wingloading
    @horsepower = horsepower
    @engine_on = false
    @flying = false
  end

  def start
    if @engine_on == false
      @engine_on = true
      'airplane started'
    else
      'airplane already started'
    end
  end

  def take_off
    if @engine_on && @flying == false
      @flying = true
      'airplane launched'
    elsif @engine_on && @flying
      'airplane already launched'
    else
      'airplane not started, please start'
    end
  end

  def landing
    if @engine_on == false  && @flying == false
      'airplane not started, please start'
    elsif @engine_on == true && @flying == false
      'airplane already on the ground'
    else
      'airplane landed'
    end
  end
end
