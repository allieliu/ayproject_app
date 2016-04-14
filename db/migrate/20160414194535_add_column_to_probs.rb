class AddColumnToProbs < ActiveRecord::Migration
  def change
    add_column :probs, :definition, :text
  end
end
