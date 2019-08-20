class User < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
:recoverable, :rememberable, :validatable

after_create :update_secret_code
# --------Associations
belongs_to :role, class_name: 'MasterRole'
belongs_to :secret_code, optional: true

# validations
validates_presence_of :l_name, :message => "First Name is required"
validates_presence_of :f_name, :message => "Last Name is required"
validates_presence_of :email, :message =>  "Email is required"
validates_presence_of :secret_code_id, :message =>  "Secret code is required"

def is_admin?
	role.default_name == 'admin'
end

def is_user?
	role.default_name == 'user'
end

def full_name
	"#{f_name + " " + l_name}"
end

def update_secret_code
	secret_code.update(is_active: false)
end

end
