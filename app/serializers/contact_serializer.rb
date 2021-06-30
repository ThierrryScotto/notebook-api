class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  #assossiations
  belongs_to :kind, optional: true do
    link(:kind) { kind_url(object.kind.id) }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }

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
