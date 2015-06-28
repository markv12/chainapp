class User < ActiveRecord::Base
  has_many :chains

  acts_as_authentic do |c|
    c.login_field = 'email'
  end

end
