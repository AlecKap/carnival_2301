class Visitor
  attr_reader :name, 
              :height, 
              :preferences
  attr_accessor :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money
    @preferences = []
  end

  def spending_money
    @spending_money.slice!(0)
    @spending_money.to_i
  end

  def add_preference(preference)
    @preferences << preference
    @preferences
  end

  def tall_enough?(min_height_limit)
    if @height >= min_height_limit
      true
    else
      false
    end
  end
end
