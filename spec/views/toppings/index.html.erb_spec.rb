require 'rails_helper'

RSpec.describe "toppings/index", type: :view do
  before(:each) do
    dessert = Dessert.create!(name: "MyDessert")
    assign(:toppings, [
      Topping.create!(
        name: "Name1",
        dessert: dessert
      ),
      Topping.create!(
        name: "Name2",
        dessert: dessert
      )
    ])
  end

  it "renders a list of toppings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name1".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("Name2".to_s), count: 1
    assert_select cell_selector, text: Regexp.new("MyDessert"), count: 2
  end
end
