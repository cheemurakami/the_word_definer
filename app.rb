require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
also_reload('lib/**/*.rb')

get ('/') do
  @words = Word.all
  erb(:words)
end

get ('/words') do
  @words = Word.all
  erb(:words)
end

get ('/words/new') do
  erb(:add_new_word)
end

post ('/words/new') do
  added_word = params[:word]
  word = Word.new({:name => added_word, :id => nil})
  word.save
  @words = Word.all
  erb(:words)
end

get ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:a_word)
end


