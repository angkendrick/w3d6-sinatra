# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  #'Message List here' <- displays as a string 
  @messages = Message.all
  erb :'messages/index'
end

