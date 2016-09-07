require 'rails_helper'

describe 'the edit a section process' do
  it "edits a section" do
    section = Section.create(:name => "Something")
    visit section_path(section)
    click_link "Edit Section"
    fill_in "Name", :with => "Something cool"
    click_on "Update Section"
    expect(page).to have_content "Something cool"
  end

  it "gives error when no fields are filled out" do
    section = Section.create(:name => "Something")
    visit section_path(section)
    click_link "Edit Section"
    fill_in "Name", :with => ""
    click_on "Update Section"
    expect(page).to have_content "errors"
  end
end
