require 'rails_helper'

RSpec.describe "fr_blogs/show", type: :view do
  before(:each) do
    @fr_blog = assign(:fr_blog, FrBlog.create!(
      :title => "Title",
      :author => "Author",
      :short_description => "MyText",
      :link => "Link",
      :video_link => "Video Link",
      :approved => false,
      :image_url => "Image Url",
      :wp_id => 1,
      :photo_by => "Photo By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/Video Link/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Photo By/)
  end
end
