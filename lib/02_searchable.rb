require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ?"}.join(" AND ")

    objects = DBConnection.execute2(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{where_line}
    SQL

    parse_all(objects.drop(1))
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
