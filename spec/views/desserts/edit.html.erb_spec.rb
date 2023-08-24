require 'rails_helper'

RSpec.describe "desserts/edit", type: :view do
  let(:dessert) {
    Dessert.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:dessert, dessert)
  end

  it "renders the edit dessert form" do
    render

    assert_select "form[action=?][method=?]", dessert_path(dessert), "post" do

      assert_select "input[name=?]", "dessert[name]"
    end
  end
end
