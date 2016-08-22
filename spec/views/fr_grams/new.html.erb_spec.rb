require 'rails_helper'

RSpec.describe "fr_grams/new", type: :view do
  before(:each) do
    assign(:fr_gram, FrGram.new(
      :image_url => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new fr_gram form" do
    render

    assert_select "form[action=?][method=?]", fr_grams_path, "post" do

      assert_select "input#fr_gram_image_url[name=?]", "fr_gram[image_url]"

      assert_select "input#fr_gram_text[name=?]", "fr_gram[text]"
    end
  end
end
