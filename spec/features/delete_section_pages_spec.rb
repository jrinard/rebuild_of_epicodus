require 'rails_helper'

describe "delete sections process" do
  it "delete a section" do
    chapter = Chapter.create(:name => 'Ruby')
    section = Section.create(:name => 'Week 1', :chapter_id => chapter.id)
    visit chapter_path(chapter)
    click_on 'Delete'
    expect(page).to_not have_content 'Week 1'
  end
end
