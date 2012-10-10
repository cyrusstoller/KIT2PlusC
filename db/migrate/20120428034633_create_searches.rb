class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :participant_id
      t.integer :confidence_discrete
      t.text :answer_discrete
      t.text :confidencewhy_discrete

      t.timestamps
    end
  end
end
