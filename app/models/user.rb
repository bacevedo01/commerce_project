class User < ActiveRecord::Base
	include BCrypt
	has many :orders
  validates :email, uniqueness: true
 	validates :first_name, :last_name, :email, :hashed_password, presence: true

	def authenticate(password)
    user = User.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end 

end