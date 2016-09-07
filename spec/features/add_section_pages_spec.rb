require 'rails_helper'

describe 'the add a section process' do
  it "adds a new section" do
    visit sections_path
    click_link "Add a section"
    fill_in "Name", :with => "Something"
    click_on "Create Section"
    expect(page).to have_content "Something"
  end

  it "gives error when no fields are filled out" do
    visit new_section_path
    click_on "Create Section"
    expect(page).to have_content "errors"
  end
end
