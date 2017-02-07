require 'rails_helper'

describe "delete chapter process" do
  it "delete a chapter" do
    chapter = Chapter.create(:name => 'Ruby')
    visit chapter_path(chapter)
    click_on 'Delete Chapter'
    expect(page).to_not have_content 'Ruby'
  end
end
