class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.timestamps
    end
  end
end
