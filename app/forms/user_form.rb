class UserForm

  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :password, :role, :email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :role, presence: true
  validates :email, presence: true, length: { minimum: 8 }

  def initialize(params= {})
    @user = User.new
    super(params)
  end

  def submit
    return false if invalid?
    @user.first_name = @first_name,
    @user.last_name = @last_name,
    @user.email = @email,
    @user.role = @role,
    @user.password = @password,
    @user.save
  end
end