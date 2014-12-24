class Board

  def initialize
    @ships = []
  end

  def receive_hit position
    @ships.map{|ship| ship.hit(position)}.include?(:hit) ? :hit : :miss
  end

  def place ship
    raise 'collides with existing ship' if collision? ship
    raise 'cannot place ship outside board' if illegal_position? ship
    @ships << ship
  end

  def ships
    @ships
  end

  def all_sunk? 
    return false if @ships.empty?
    !@ships.map(&:sunk?).include? false
  end

  private

  def collision? ship
    @ships.map(&:position).include?(ship.position)
  end

  def illegal_position? ship
    position = ship.position
    position = position.join if position.respond_to? :join 
    !(position =~ /^([A-Z][0-9])+$/)
  end
end