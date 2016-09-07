class ResumeLink < ActiveRecord::Migration
  def change
    add_column :utilities, :resume_link, :text
  end
end
