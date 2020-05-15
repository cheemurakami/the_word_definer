require "rspec"
require "pry"
require "word"
require "definition"

describe "#Definition" do
  
  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new({:name => "define", :id => nil})
    @word.save()
  end


  describe("initialize") do
    it("creates a new definition") do
      definition1 = Definition.new({:name => "is a fruit", :word_id => @word.id, :id => nil})
      expect(definition1.name).to eq("is a fruit")
    end
  end

  describe(".all") do
    it("shows shows an empty array when there are no definitions") do
      expect(Definition.all).to eq([])
    end
    it("shows all of the definitions") do
      definition1 = Definition.new({:name => "define", :word_id => @word.id, :id => nil})
      definition1.save
      expect(Definition.all).to eq([word1])
    end
  end


end