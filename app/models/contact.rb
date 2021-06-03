class Contact < ApplicationRecord
  belongs_to :kind

  def get_date
    Time.now.to_s
  end
end
