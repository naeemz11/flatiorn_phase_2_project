class OrdersController < ApplicationController


get '/orders' do 
    redirect_if_logged_in
    @orders = current_user.orders
    erb :'orders/index'
end 


get '/orders/new' do
    redirect_if_not_logged_in

    erb :'orders/new'
end

get '/orders/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    erb :'orders/show'
end

#create new order
post '/orders' do
    redirect_if_not_logged_in

    # movie = Movie.new(params["movie"])
    # movie.user_id = session["user_id"]
    order = current_user.orders.build(params["order"])

    if order.save
        redirect "/orders/#{order.id}"
    else
        "Error #{order.errors.full_messages.join(", ")}"
        # redirect "/movies/new"
    end
end

 # UPDATE 1 order (render form)
 get '/movies/:id/edit' do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    erb :'orders/edit'
end

 # UPDATE 1 order (save in db)
 patch '/orders/:id' do
    redirect_if_not_logged_in
    redirect_if_not_authorized
    
    if @order.update(params["order"])
        redirect "/orders/#{@order.id}"
    else
        redirect "/orders/#{@order.id}/edit"
    end
end 

#DELETE  order
delete "/movies/:id" do
    redirect_if_not_logged_in
    redirect_if_not_authorized

    @order.destroy

    redirect "/orders"
end

private

def redirect_if_not_authorized
    @order = order.find_by_id(params[:id])
    if @order.user_id != session["user_id"]
        redirect "/orders"
    end
end


end 