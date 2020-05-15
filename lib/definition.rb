class Definition
  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions ={}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @album_id = attributes.fetch(:album_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end
end