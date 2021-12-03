class Player
  DEFAULT_HIT_POINTS = 60
  attr_reader :paralysed

  def initialize(name, hit_points = DEFAULT_HIT_POINTS )
    @name = name
    @health = hit_points 
    @paralysed = false
  end

  def name
    @name
  end

  def health
    @health
  end

  def paralyse
    @paralysed = true 
  end
  
  def un_paralyse
    @paralysed = false
  end

  def reduce_health
    @health -= rand(1...10)
  end
end