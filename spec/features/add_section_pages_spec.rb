require 'rails_helper'

describe "the add a section process" do
  it "adds a new section" do
    visit chapters_path
    click_link 'New Chapter'
    fill_in 'Name', :with => 'Ruby'
    click_on 'Create Chapter'
    click_on 'Ruby'
    click_on 'New Section'
    fill_in 'Name', :with => 'Week 1'
    click_on 'Create Section'
    expect(page).to have_content 'Week 1'
  end

  it "gives error when no name is entered" do
    visit chapters_path
    click_link 'New Chapter'
    fill_in 'Name', :with => 'Ruby'
    click_on 'Create Chapter'
    click_on 'Ruby'
    click_on 'New Section'
    fill_in 'Name', :with => ''
    click_on 'Create Section'
    expect(page).to have_content 'errors'
  end
end
