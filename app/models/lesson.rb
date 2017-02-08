class Lesson < ActiveRecord::Base
  belongs_to :section

  validates :title, :presence => true

    def next_lesson
      return Lesson.find_by_number(self.number+1)
    end

end
