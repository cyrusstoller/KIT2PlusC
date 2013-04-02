class AddCreditsCompletedToDemographics < ActiveRecord::Migration
  def change
    add_column :demographics, :credits_completed, :integer
  end
end
