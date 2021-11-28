class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[x]" : "[ ]"
    "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

end
