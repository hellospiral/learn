require 'rails_helper'

describe 'the edit a lesson process' do
  it 'edits a lesson' do
    lesson = Lesson.create(:name => "Something", :content => "something else", :number => "0")
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in "Name", :with => "A new thing"
    click_on "Update Lesson"
    expect(page).to have_content "A new thing"
  end

  it "gives an error if a field is blank" do
    lesson = Lesson.create(:name => "Something", :content => "something else", :number => "0")
    visit lesson_path(lesson)
    click_on "Edit"
    fill_in "Name", :with => ""
    click_on "Update Lesson"
    expect(page).to have_content 'errors'
  end
end
