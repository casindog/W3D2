require 'sqlite3'
require 'singleton'
require 'byebug'
class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  
  def initialize(name_hash)
    # debugger
    @fname = name_hash['fname']
    @lname = name_hash['lname']
    @id = name_hash['id']

  end


  def self.find_by_id(id)
  var=PlayDBConnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      users 
    WHERE
      id = ?
      
  SQL

  var.map { |data| User.new(data)}
  end

  def self.find_by_name(fname, lname)
  var=PlayDBConnection.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      users 
    WHERE
      fname = ? AND
      lname = ?
  SQL
    # debugger
  var.map { |ele| User.new(ele)}

  end

  def authored_questions

  end

end

class Question
  
  attr_accessor :title, :body, :id, :user_id
  def initialize(data)
    @title = data['title']
    @body = data['body']
    @id = data['id']
    @user_id = data['user_id']

  end

  def self.find_by_id(id)
  var=PlayDBConnection.instance.execute(<<-SQL, id)
    SELECT
      id
    FROM
      questions 
    WHERE
      id = ?
      
  SQL

  var.map { |data| Question.new(data)}
  end


end