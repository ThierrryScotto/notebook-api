class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  #assossiations
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  meta do
    { 
      locale: I18n.locale
    } 
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
