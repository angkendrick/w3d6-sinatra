# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  #'Message List here' <- displays as a string 
  @messages = Message.all # retrieves all messages from the db makes it available to erb in this block
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

get '/messages/author/:author' do
  #@author = Message.where author: params[:author]
  @messages = Message.where author: params[:author]
  erb :'messages/author'
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

post '/messages' do #handles http posts comming from form
  @message = Message.new(
    content: params[:content],
    author: params[:author],
    url: params[:url]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

