require 'rails_helper'

RSpec.describe "toppings/show", type: :view do
  before(:each) do
    dessert = Dessert.create!(name: "MyDessert")
    assign(:topping, Topping.create!(
      name: "Name",
      dessert: dessert
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
