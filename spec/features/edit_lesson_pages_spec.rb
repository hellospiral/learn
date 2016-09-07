require 'rails_helper'

describe 'the edit a lesson process' do
  it 'edits a lesson' do
    section = Section.create(:name => "Something")
    lesson = Lesson.create(:name => "Something", :content => "something else", :number => "0", :section_id => section.id)
    visit section_lesson_path(section, lesson)
    click_on "Edit"
    fill_in "Name", :with => "A new thing"
    click_on "Update Lesson"
    expect(page).to have_content "A new thing"
  end

  it "gives an error if a field is blank" do
    section = Section.create(:name => "Something")
    lesson = Lesson.create(:name => "Something", :content => "something else", :number => "0", :section_id => section.id)
    visit section_lesson_path(section, lesson)
    click_on "Edit"
    fill_in "Name", :with => ""
    click_on "Update Lesson"
    expect(page).to have_content 'errors'
  end
end
