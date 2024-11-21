class CreateRewardHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :reward_histories do |t|
      t.integer :points
      t.string :given_by
      t.string :given_to

      t.timestamps
    end
  end
end
