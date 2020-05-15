require('sinatra')
require('sinatra/reloader')
require('pry')
require('./lib/word')
require('./lib/definition')
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

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i())
  erb(:edit_word)
end

patch ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.update(params[:name])
  @words = Word.all
  erb(:words)
end

delete ('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @words = Word.all
  erb(:words)
end






get ('/words/:id/definitions/:definition_id') do
  @definition = Definition.find(params[:definition_id].to_i)
  erb(:definition)
end

post('/words/:id/definitions') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new({:name => params[:definition_name], :word_id => @word.id, :id => nil})
  definition.save()
  erb(:a_word)
end
