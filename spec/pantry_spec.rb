require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'


RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Pantry Spec Harness' do
  before :each do
    @cheese = Ingredient.new("Cheese", "oz", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
  end

  describe 'Iteration 1' do
    it '1. Ingredient ::new' do
      expect(Ingredient).to respond_to(:new).with(3).argument
      expect(@cheese).to be_instance_of(Ingredient)
    end

    it '2. Ingredient #name' do
      expect(@cheese).to respond_to(:name).with(0).argument
      expect(@cheese.name).to eq('Cheese')
    end

    it '3. Ingredient #unit' do
      expect(@cheese).to respond_to(:unit).with(0).argument
      expect(@cheese.unit).to eq('oz')
    end

    it '4. Ingredient #calories' do
      expect(@cheese).to respond_to(:calories).with(0).argument
      expect(@cheese.calories).to eq(100)
    end
  end

  describe 'Iteration 2' do
    it '1. Recipe ::new' do
      expect(Recipe).to respond_to(:new).with(1).argument
      expect(@mac_and_cheese).to be_instance_of(Recipe)
    end

    it '2. Recipe #name' do
      expect(@mac_and_cheese).to respond_to(:name).with(0).argument
      expect(@mac_and_cheese.name).to eq('Mac and Cheese')
    end

    it '3. Recipe #ingredients_required' do
      expect(@mac_and_cheese).to respond_to(:ingredients_required).with(0).argument
      expect(@mac_and_cheese.ingredients_required).to eq({})
    end

    it '4. Recipe #add_ingredient' do
      expect(@mac_and_cheese).to respond_to(:add_ingredient).with(2).argument
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)
      expect(@mac_and_cheese.ingredients_required).to eq({@cheese => 2, @mac => 8})
    end

    it '5. Recipe #amount_required' do
      expect(@mac_and_cheese).to respond_to(:amount_required).with(1).argument
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)
      expect(@mac_and_cheese.amount_required(@cheese)).to eq(2)
      expect(@mac_and_cheese.amount_required(@mac)).to eq(8)
    end

    it '6. Recipe #ingredients' do
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)

      expect(@mac_and_cheese).to respond_to(:ingredients).with(0).argument
      expect(@mac_and_cheese.ingredients).to eq([@cheese, @mac])
    end

    it '7. Recipe #total_calories' do
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)

      expect(@mac_and_cheese).to respond_to(:total_calories).with(0).argument
      expect(@mac_and_cheese.total_calories).to eq(440)
    end
  end

  describe 'Iteration 3' do
    before :each do
      @pantry = Pantry.new
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)
    end

    it '1. Pantry ::new' do
      expect(Pantry).to respond_to(:new).with(0).argument
      expect(@pantry).to be_instance_of(Pantry)
    end

    it '2. Pantry #stock' do
      expect(@pantry).to respond_to(:stock).with(0).argument
      expect(@pantry.stock).to eq({})
    end

    it '3. Pantry #stock_check' do
      expect(@pantry).to respond_to(:stock_check).with(1).argument
      expect(@pantry.stock_check(@cheese)).to eq(0)
    end

    it '4. Pantry #restock' do
      expect(@pantry).to respond_to(:restock).with(2).argument
      @pantry.restock(@cheese, 5)
      @pantry.restock(@cheese, 10)
      expect(@pantry.stock_check(@cheese)).to eq(15)
    end

    it '5. Pantry #enough_ingredients_for?' do
      expect(@pantry).to respond_to(:enough_ingredients_for?).with(1).argument
      @pantry.restock(@cheese, 5)
      expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to eq(false)
      @pantry.restock(@mac, 7)
      expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to eq(false)
      @pantry.restock(@mac, 2)
      expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to eq(true)
    end
  end
end
