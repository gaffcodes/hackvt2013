class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	attr_accessible :email, :password, :password_confirmation, :reset_password_token, :reset_password_sent_at, 
	:remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :address, :zip, 
	:demographics, :type, :featured, :created_at, :updated_at, :name
end
