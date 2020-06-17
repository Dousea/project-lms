# frozen_string_literal: true

module ActiveRecord
  module ConnectionAdapters
    if const_defined?(:PostgreSQLAdapter)
      class PostgreSQLAdapter
        NATIVE_DATABASE_TYPES.merge!(
          enum: { name: 'enum' }
          # there is a chance the above causes conflicts in some cases, you can
          # always be more explicit and actually use your type or names (I am not looking up which)
          # type_priority:    { name: 'enum' }
        )
      end
    end
  end
end
