require "./config/environment"

use Rack::MethodOverride

#use UsersController

use SessionsController 
use OrdersController
use UsersController
run ApplicationController