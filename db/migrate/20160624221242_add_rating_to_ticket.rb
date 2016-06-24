class AddRatingToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :rating, :integer, default: 0
    add_column :tickets, :comment, :string
  end
end
