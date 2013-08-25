class AddSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :last_4, :string
    add_column :users, :card_type, :string
    add_column :users, :subscribed, :boolean, default:false
  end
end
