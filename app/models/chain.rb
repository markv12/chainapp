class Chain < ActiveRecord::Base
  belongs_to :user

  def length
    (Date.today - start_date).to_i
  end
end
