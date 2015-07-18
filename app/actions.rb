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

post '/messages' do #handles http posts comming from form
  @message = Message.new(
    content: params[:content],
    author: params[:author]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end


