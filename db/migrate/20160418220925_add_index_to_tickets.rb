class AddIndexToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :project, index:true, foreign_key: true, :null => true
  end
end
