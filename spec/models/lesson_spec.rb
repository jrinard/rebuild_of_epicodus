require 'rails_helper'

describe Lesson do
  it { should validate_presence_of :title }
  it { should belong_to :section }

  context '#next_lesson' do
    it 'returns the lesson with the next-highest number than the current lesson' do
      test_section = Section.create({:name => "Ruby", :id=>1, :chapter_id => 1})
      current_lesson = Lesson.create({:title => 'lesson1', :content =>'content', :number => 1, :section_id => test_section.id})
      test_lesson = Lesson.create({:title => 'lesson2', :content =>'content2', :number => 2, :section_id => test_section.id})
      puts test_lesson.inspect
      puts current_lesson.inspect
      expect(current_lesson.next_lesson).to eq test_lesson

    end
  end
end
