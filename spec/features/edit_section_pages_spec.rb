require 'rails_helper'

describe "the edit a section process" do
  it "edits a section" do
    chapter = Chapter.create(:name => 'Ruby')
    section = Section.create(:name => 'Week 1', :chapter_id => chapter.id)
    visit chapter_path(chapter)
    click_on 'Edit'
    fill_in 'Name', :with => 'Week 2'
    click_on 'Update Section'
    expect(page).to have_content 'Week 2'
  end

  it "gives error when no name is entered" do
    chapter = Chapter.create(:name => 'Rails')
    section = Section.create(:name => 'Week 100', :chapter_id => chapter.id)
    visit chapter_path(chapter)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_button 'Update Section'
    expect(page).to have_content 'errors'
  end
end
