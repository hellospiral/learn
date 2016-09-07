require 'rails_helper'

describe 'the add a lesson process' do
  it "adds a new lesson" do
    visit lessons_path
    click_link "Add a lesson"
    fill_in "Name", :with => "Something"
    fill_in "Content", :with => "Something else"
    fill_in "Number", :with => "0"
    click_on "Create Lesson"
    expect(page).to have_content "Something"
  end

  it "gives error when no fields are filled out" do
    visit new_lesson_path
    click_on "Create Lesson"
    expect(page).to have_content "errors"
  end
end
