require 'spec_helper'

RSpec.describe Visitor do
  before(:each) do 
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe 'exists and has attributes' do
    it '#is an instance of' do
      expect(@visitor1).to be_a(Visitor)
    end
    
    it '#name' do 
      expect(@visitor1.name).to eq("Bruce")
      expect(@visitor2.name).to eq("Tucker")
    end

    it '#height' do 
      expect(@visitor1.height).to eq(54)
      expect(@visitor2.height).to eq(36)
    end

    it '#spending money' do 
      expect(@visitor1.spending_money).to eq(10)
      expect(@visitor2.spending_money).to eq(5)
    end

    it '#preferences' do 
      expect(@visitor1.preferences).to eq([])
      expect(@visitor2.preferences).to eq([])
    end
  end

  describe 'can add preferences and check if tall enough' do
    it '#add preferences' do
      @visitor1.add_preferences(:gentle)
      @visitor1.add_preferences(:water)

      expect(@visitor1.preferences).to eq([:gentle, :water])
    end

    it '#tall_enough?' do 
      expect(@visitor1.tall_enough?(54)).to be(true)
      expect(@visitor2.tall_enough?(54)).to be(false)
      expect(@visitor3.tall_enough?(54)).to be(true)
      expect(@visitor1.tall_enough?(64)).to be(false)
    end
  end
end