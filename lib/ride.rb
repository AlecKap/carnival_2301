class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement, 
              :ride_log

  def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]
    @ride_log = {}
  end

  def total_revenue
    total_revenue = 0
    if @ride_log.empty?
      total_revenue = 0
    else
      total_revenue = @ride_log.values.sum * @admission_fee 
    end
    total_revenue
  end

  def board_rider(visitor)
    if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
      visitor.spending_money = visitor.spending_money - @admission_fee
      @ride_log = Hash.new(0)
      @ride_log[visitor] += 1
    end
    visitor
    # check height and preferences
    # if height passes and they have the preference, reduce visitor spending money and add visitor to rider log
  end
end
