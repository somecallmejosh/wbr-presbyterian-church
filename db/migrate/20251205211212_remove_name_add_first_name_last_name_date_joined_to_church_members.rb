class RemoveNameAddFirstNameLastNameDateJoinedToChurchMembers < ActiveRecord::Migration[8.0]
  def change
    remove_column :church_members, :name
    add_column :church_members, :first_name, :string
    add_column :church_members, :last_name, :string
    add_column :church_members, :date_joined, :date
  end
end
