require 'rails_helper'

RSpec.describe "fr_grams/show", type: :view do
  before(:each) do
    @fr_gram = assign(:fr_gram, FrGram.create!(
      :image_url => "Image Url",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/Text/)
  end
end
