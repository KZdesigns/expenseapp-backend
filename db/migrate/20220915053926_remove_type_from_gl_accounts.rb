class RemoveTypeFromGlAccounts < ActiveRecord::Migration[7.0]
  def change
    remove_column :gl_accounts, :type, :string
  end
end
