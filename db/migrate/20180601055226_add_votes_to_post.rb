class AddVotesToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :votes, :integer, default: 0
  end
end
