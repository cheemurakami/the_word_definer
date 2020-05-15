require "rspec"
require "pry"
require "word"
require "definition"

describe("#Word") do
  
  before(:each) do
    Word.clear()
  end

  describe("initialize") do
    it("creates a new word with a name") do
      word1 = Word.new({:name => "define", :id => nil})
      expect(word1.name).to eq("define")
    end
  end

  describe(".all") do
    it("shows shows an empty array when there are no words") do
      expect(Word.all).to eq([])
    end
    it("shows all of the words") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      expect(Word.all).to eq([word1])
    end
  end

  describe("#save") do
    it("saves a word in a hash") do
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      expect(Word.all).to eq([word2])
    end
    it("saves words in a hash") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      expect(Word.all).to eq([word1, word2])
    end
  end

  describe(".clear") do
    it("clears words in a hash") do
      Word.clear
      expect(Word.all).to eq([])
    end
  end

  describe('#==') do
    it("is the same word if it has the same attributes as another album") do
      word1 = Word.new({:name => "define", :id => nil})
      word2 = Word.new({:name => "define", :id => nil})
      expect(word1).to(eq(word2))
    end
  end

  describe('.find') do
    it("finds a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      expect(Word.find(word1.id)).to eq(word1)
    end
  end

  describe('#update') do
    it("updates a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word1.update("defined")
      expect(word1.name).to eq("defined")
    end
  end

  describe('#delete') do
    it("deletes a word by id") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      word2 = Word.new({:name => "meet", :id => nil})
      word2.save
      word2.delete
      expect(Word.all).to eq([word1])
    end
  end

  describe("#definitions") do
    it("returns a word's definitions") do
      word1 = Word.new({:name => "define", :id => nil})
      word1.save
      definition1 = Definition.new({:name => "state or describe exactly the nature, scope, or meaning of.", :word_id => word1.id, :id => nil})
      definition1.save()
      definition2 = Definition.new({:name => "mark out the boundary or limits of", :word_id => @word.id, :id => nil})
      definition2.save()
      expect(word1.definitions).to eq([definition1, definition2])
    end
  end

end