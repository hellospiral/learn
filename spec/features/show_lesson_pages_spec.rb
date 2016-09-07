require 'rails_helper'

describe 'viewing the next lesson process' do
  it 'shows the next lesson numerically' do
    lesson1 = Lesson.create(:name => "Something", :content => "something else", :number => "1")
    lesson2 = Lesson.create(:name => "Something2", :content => "something else again", :number => "2")
    visit lesson_path(lesson1)
    click_on "Next Lesson"
    expect(page).to have_content "Something2"
  end
end
