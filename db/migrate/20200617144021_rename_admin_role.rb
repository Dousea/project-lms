# frozen_string_literal: true

class RenameAdminRole < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      ALTER TYPE user_role RENAME VALUE 'admin' TO 'moderator';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TYPE user_role RENAME VALUE 'moderator' TO 'admin';
    SQL
  end
end
