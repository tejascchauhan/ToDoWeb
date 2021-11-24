class UsersController < ApplicationController

  skip_before_action:verify_authenticity_token

  def index
    render plain: User.all.map { |user| todo.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(name: name, email: email, password: password)
    response_text = "Welcome #{new_user.name}, \nYour id: #{new_user.id}"
    render plain: response_text
  end

end
