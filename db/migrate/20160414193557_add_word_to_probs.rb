class AddWordToProbs < ActiveRecord::Migration
  def change
    add_column :probs, :word, :string
  end
end
