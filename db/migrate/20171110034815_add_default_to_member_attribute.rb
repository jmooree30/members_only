class AddDefaultToMemberAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :member, :boolean, :default => false
  end
end
