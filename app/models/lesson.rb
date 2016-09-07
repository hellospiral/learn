class Lesson < ActiveRecord::Base
  belongs_to :section
  default_scope { order ("number ASC")}

  validates :name, :presence => true
  validates :content, :presence => true
  validates :number, :presence => true
end
