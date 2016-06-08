class AddDigitialSignatureColumnsToUser < ActiveRecord::Migration
  def change
    add_attachment :users, :digital_signature
  end
end
