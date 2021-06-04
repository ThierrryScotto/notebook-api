class Contact < ApplicationRecord

  #assossiations
  belongs_to :kind, optional: true
  has_many :phones
  
  accepts_nested_attributes_for :phones, allow_destroy: true

  def get_date
    Time.now.to_s
  end

  def kind_descrption
    self.kind.description unless self.kind.nil?
  end

  def default_locale
    I18n.default_locale
  end

  def as_json (options={})
    h = super(
      except: [:kind_id],
      methods: [:kind_descrption, :default_locale],
      include: :phones
    )

    h[:birthdate] = I18n.l(self.birthdate) unless self.birthdate.blank?
    h
  end
end
