require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Iteration 4' do
  before :each do
    @cookbook = CookBook.new
    @cheese = Ingredient.new("Cheese", "C", 100)
    @mac = Ingredient.new("Macaroni", "oz", 30)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
    @ground_beef = Ingredient.new("Ground Beef", "oz", 100)
    @bun = Ingredient.new("Bun", "g", 1)
    @burger = Recipe.new("Burger")
    @burger.add_ingredient(@ground_beef, 4)
    @burger.add_ingredient(@bun, 100)
  end

  it '1. Cookbook ::new' do
    expect(CookBook).to respond_to(:new).with(0).argument
    expect(@cookbook).to be_instance_of(CookBook)
  end

  it '2. Cookbook #add_recipe' do
    expect(@cookbook).to respond_to(:add_recipe).with(1).argument
  end

  it '3. Cookbook #summary' do
    @cookbook.add_recipe(@mac_and_cheese)
    @cookbook.add_recipe(@burger)

    expected = [
      {
        name: "Mac and Cheese",
        details: {
          ingredients: [
            {ingredient: "Macaroni", amount: "8 oz"},
            {ingredient: "Cheese", amount: "2 C"}
          ],
          total_calories: 440
        }
      },
      {
      name: "Burger",
      details: {
        ingredients: [
          {ingredient: "Ground Beef", amount: "4 oz"},
          {ingredient: "Bun", amount: "100 g"}
        ],
        total_calories: 500
        }
      }
    ]

    expect(@cookbook).to respond_to(:summary).with(0).argument
    expect(@cookbook.summary).to eq(expected)
  end
end
