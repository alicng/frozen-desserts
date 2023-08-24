require 'rails_helper'

RSpec.describe "desserts/show", type: :view do
  before(:each) do
    assign(:dessert, Dessert.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
