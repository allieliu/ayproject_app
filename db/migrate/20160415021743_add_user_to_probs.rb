class AddUserToProbs < ActiveRecord::Migration
  def change
    add_reference :probs, :user, index: true, foreign_key: true
  end
end
