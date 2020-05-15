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


end
