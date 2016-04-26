#Active Record Lite

Active Record Lite is a lightweight Object Relational Mapping system constructed with Ruby, mimicking the core functionality of ActiveRecord within Rails.

##Functionality
* SQLObject class directly interacts with sqlite3 database via `heredoc`s and `db_connection.rb`
* SQLObject class creates getter and setter methods for column names within table
* SQLObject class dynamically generates methods via `Associatable` module, to respond to `belongs_to` && `has_many` method calls
* SQLObject class contains `where` function via `Searchable` module to search database for specific entries

##Breakdown of Code

### Class `SQLObject`

* `#all`: Returns an array of all records of itself within database
* `#find(id)`: Returns single instance via database lookup with given key
* `#insert`: Inserts single instance of SQLObject as a new row into database
* `#update`: Updates single instance of SQLObject within database
* `#save`: Saves or updates single instance of SQLObject within database

### Class `BelongsToOptions` < `AssocOptions` && `HasManyOptions` < `AssocOptions`

* `#model_class`: Utilizes `active_support/inflector` library to constantize self
* `#initialize`: Utilizes metaprogramming to define method and set variables to track `foreign_key`, `class_name`, and `primary_key`

### Module `Associatable`

* `#belongs_to` && `#has_many`: Utilizes metaprogramming to define dynamic methods and `Searchable` module to pull record from database
* `#has_one_through`: Grabs information and utilizes a `heredoc` to manually `JOIN` tables to pull correct record from database

### Module `Searchable`

* `#where` Receives a params hash to locate row within database, and returns row as an instance of SQLObject
