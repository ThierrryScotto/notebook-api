class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  def get_date
    Time.now.to_s
  end

  def kind_descrption
    self.kind.description unless self.kind.nil?
  end

  def default_locale
    I18n.default_locale
  end

  def to_br
    { 
      id: self.id,
      name: self.name,
      birthdate: I18n.l(self.birthdate),
      email: self.email
    }
  end

  def as_json (options={})
    super(
      root: true, 
      except: [:kind_id],
      methods: [:kind_descrption, :default_locale]
      # include: { kind: { only: :description } } Dessa forma a hash é aninhada dentro da estrutura
      # include: :kind
    )
  end
end
