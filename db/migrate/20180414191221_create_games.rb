class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string   :title,           :null => false
      t.string   :description,     :null => false
      t.string   :address,         :null => false
      t.string   :team_one_name,   :null => false
      t.string   :team_two_name,   :null => false
      t.integer  :team_one_score  
      t.integer  :team_two_score
      t.integer  :creator_id,      :null => false
      t.datetime :start_time,      :null => false
      t.string   :state,           :null => false, :default => "Not Started"
      t.timestamps
    end
  end
end
