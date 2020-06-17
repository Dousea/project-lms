class AddAdminToUserRole < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      ALTER TYPE user_role ADD VALUE 'admin';
    SQL
  end
end
