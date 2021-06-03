class Contact < ApplicationRecord

  def get_date
    Time.now.to_s
  end
end
