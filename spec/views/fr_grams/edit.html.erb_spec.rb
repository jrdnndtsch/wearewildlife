require 'rails_helper'

RSpec.describe "fr_grams/edit", type: :view do
  before(:each) do
    @fr_gram = assign(:fr_gram, FrGram.create!(
      :image_url => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit fr_gram form" do
    render

    assert_select "form[action=?][method=?]", fr_gram_path(@fr_gram), "post" do

      assert_select "input#fr_gram_image_url[name=?]", "fr_gram[image_url]"

      assert_select "input#fr_gram_text[name=?]", "fr_gram[text]"
    end
  end
end
