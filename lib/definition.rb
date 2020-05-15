class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions ={}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def ==(definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values
  end

  def save
    @@definitions[self.id] = Definition.new({:name => self.name, :word_id => self.word_id, :id => self.id})
  end
  
  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

end