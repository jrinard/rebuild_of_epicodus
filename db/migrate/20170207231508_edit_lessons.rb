class EditLessons < ActiveRecord::Migration[5.0]
  def change
    change_table :lessons do |t|
      t.column :number, :integer
    end
  end
end
