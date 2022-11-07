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
    @user.assign_attributes(first_name: @first_name, last_name: @last_name, email: @email, role: @role, password: @password)
    @user.save
  end
end