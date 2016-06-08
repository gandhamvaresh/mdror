class AddClaimProcessingRecipientEmailToClient < ActiveRecord::Migration
  def change
    add_column :clients, :claim_recipient_email, :string, :default => 'trushal@mdmanage.com'
  end
end
