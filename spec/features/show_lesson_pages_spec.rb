require 'rails_helper'

describe 'viewing the next lesson process' do
  it 'shows the next lesson numerically' do
    section = Section.create(:name => "Something")
    lesson1 = Lesson.create(:name => "Something", :content => "something else", :number => "1", :section_id => section.id)
    lesson2 = Lesson.create(:name => "Something 2", :content => "something else", :number => "2", :section_id => section.id)
    visit section_lesson_path(section, lesson1)
    click_on "Next Lesson"
    expect(page).to have_content "Something 2"
  end
end
