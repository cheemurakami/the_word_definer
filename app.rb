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

