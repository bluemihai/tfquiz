# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Environment variables (ENV['...']) can be set in the file .env file.

all = Tag.create!(name: 'all')
inheritance = Tag.create!(name: 'inheritance')
databases = Tag.create!(name: 'databases')
hashes = Tag.create!(name: 'hashes')
inheritance = Tag.create!(name: 'inheritance')

qs =
[
  {
    tags: [inheritance, all],
    t: "You should only use A > B inheritance when it's reasonable to say 'A is a B.'",
    f: "You should only use A > B inheritance when it's reasonable to say 'A has a B.'"
  },
  { 
    tags: [databases, all],
    t: "The purpose of belongs_to and has_many is to set up some methods, just like attr_accessor",
    f: "The purpose of belongs_to and has_many do is to set up the association"
  },
  { 
    tags: [databases, all],
    t: "If A has_many B, the foreign key goes into B.",
    f: "If A has_many B, the foreign key goes into A."
  },
  { 
    tags: [hashes, all],
    t: "Trying to access a hash with a non-existing key returns nil.",
    f: "Trying to access a hash with a non-existing key raises an error."
  },
  { 
    tags: [databases, all],
    t: "Good database design reduces the need to add table columns.",
    f: "Good database design reduces the need to add table rows."
  },
  { 
    tags: [databases, all],
    t: "The start of a migration file name is the snake case version of the class declared in the migration.",
    f: "The start of a migration file name is the camel case version of the class declared in the migration."
  },
  { 
    tags: [databases, all],
    t: "In SQL, a primary key is optional for join tables",
    f: "In SQL, A primary key is required for all tables"
  },
  { 
    tags: [inheritance, all],
    t: "super yields up the inheritance lookup chain.",
    f: "super yields down the inheritance lookup chain."
  },
  { 
    tags: [databases, all],
    t: "In a one-one association, it doesn't matter in which table you put the foreign key.",
    f: "In a one-one association, there is a method for correctly deciding in which table to put the foreign key."
  },
  { 
    tags: [inheritance, all],
    t: "A module is a reusable bag of behaviors.",
    f: "A module is a reusable bag of objects."
  },
  { 
    tags: [inheritance, all],
    t: "The purpose of inheritance is modeling systems.",
    f: "The purpose of inheritance is sharing code."
  },
  { 
    tags: [inheritance, all],
    t: "The ability to share code is a side effect of inheritance.",
    f: "The ability to share code is the main purpose of inheritance."
  },
  { 
    tags: [hashes, all],
    t: "{id: 5, first_name: 'John'} == {:id => 5, :first_name => 'John'}",
    f: "{'id' => 5, 'first_name' => 'John'} == {:id => 5, :first_name => 'John'}"
  },
  { 
    tags: [databases, all],
    t: "Foreign keys have names like client_id",
    f: "Foreign keys have names like id_client"
  },
  { 
    tags: [databases, all],
    t: "Primary keys have names like id",
    f: "Foreign keys have names like id"
  },
  { 
    tags: [databases, all],
    t: "There are three ways of relating models/tables: one-one, one-many, many-many",
    f: "There are three ways of relating models/tables: one-one, one-many, many-one"
  },
  { 
    tags: [databases, all],
    t: "In a Rails/Sinatra app, there are three places to validate: database level, model, client side.",
    f: "In a Rails/Sinatra app, there are two places to validate: database level, model."
  }
]

qs.each{ |q| Question.create(q) }