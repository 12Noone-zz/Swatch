class SessionsController < ApplicationController
	skip_before_filter :require_login
	def new
	end

	def create
		puts "in create session ctrl"
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to houses_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
