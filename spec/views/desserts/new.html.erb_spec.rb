require 'rails_helper'

RSpec.describe "desserts/new", type: :view do
  before(:each) do
    assign(:dessert, Dessert.new(
      name: "MyString"
    ))
  end

  it "renders new dessert form" do
    render

    assert_select "form[action=?][method=?]", desserts_path, "post" do

      assert_select "input[name=?]", "dessert[name]"
    end
  end
end
