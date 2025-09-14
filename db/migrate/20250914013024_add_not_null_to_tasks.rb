class AddNotNullToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :title, false
    change_column_null :tasks, :due_date, false
  end
end
