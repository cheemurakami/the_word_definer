require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word', :with => 'hello')
    click_on('Add!')
    expect(page).to have_content('hello')
  end
end

describe('create a word path', {:type => :feature}) do
  it('updates a word and then goes to words page') do
    word = Word.new({:name => "apple", :id => nil})
    word.save
    visit("/words/#{word.id}/edit")
    fill_in('name', :with => 'banana')
    click_on('Update')
    expect(page).to have_content('banana')
  end
end
