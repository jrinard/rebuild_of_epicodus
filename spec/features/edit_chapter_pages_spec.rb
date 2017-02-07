require 'rails_helper'

describe "the edit a chapter process" do
  it "edits a chapter" do
    visit chapters_path
    click_on 'New Chapter'
    fill_in 'Name', :with => 'Rails'
    click_on 'Create Chapter'
    click_on 'Edit'
    fill_in 'Name', :with => 'asdf'
    click_on 'Update Chapter'
    expect(page).to have_content 'asdf'
  end

  it "gives error when no name is entered" do
    visit chapters_path
    click_on 'New Chapter'
    fill_in 'Name', :with => 'Rails'
    click_on 'Create Chapter'
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Chapter'
    expect(page).to have_content 'errors'
  end
end
