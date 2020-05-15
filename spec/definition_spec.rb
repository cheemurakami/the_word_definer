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
      expect(Definition.all).to eq([definition1])
    end
  end

  describe("#save") do
    it("saves a definition in a hash") do
      definition1 = Definition.new({:name => "define", :word_id => @word.id, :id => nil})
      definition1.save
      expect(Definition.all).to eq([definition1])
    end
  end

  describe(".clear") do
    it("clears all definitions") do
      definition1 = Definition.new({:name => "define", :word_id => @word.id, :id => nil})
      definition1.save
      Definition.clear
      expect(Definition.all).to eq([])
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition1 = Definition.new({:name => "define", :word_id => @word.id, :id => nil})
      definition1.save()
      definition2 = Definition.new({:name => "define", :word_id => @word.id, :id => nil})
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for a word") do
      word2 = Word.new({:name => "define", :id => nil})
      word2.save()
      definition = Definition.new({:name => "Hello", :word_id => @word.id, :id => nil})
      definition.save()
      definition2 = Definition.new({:name => "Hi", :word_id => word2.id, :id => nil})
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to eq([definition2])
    end
  end

  describe('#word') do
    it("finds the word a definition belongs to") do
      definition = Definition.new({:name => "Hello", :word_id => @word.id, :id => nil})
      definition.save()
      expect(definition.word()).to(eq(@word))
    end
  end


end
