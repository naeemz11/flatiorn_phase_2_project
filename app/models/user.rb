class User < ActiveRecord::Base

    has_many :orders
    #orders reader returns all orders in array
    #orders << save to the database 
    #orders.delete(order obj)
    #orders.destroy(order obj)
    #orders = []
    #order_ids 
    #order_ids=[1,2 etc]
    #orders.empty?
    #orders.find
    #orders.find()
    #orders.exists()

    #orders.build(attr) wont save automatically
    #orders.create(attr) will save


    has_secure_password #created by the bcrypt gem
    validates :email, uniqueness: true

    



end 