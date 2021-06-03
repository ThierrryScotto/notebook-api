class Contact < ApplicationRecord
  belongs_to :kind

  def get_date
    Time.now.to_s
  end

  def kind_descrption
    self.kind.description
  end

  def as_json (options={})
    super(
      root: true, 
      exclude: [:kind_id],
      methods: [:kind_descrption]
      # include: { kind: { only: :description } } Dessa forma a hash é aninhada dentro da estrutura
    )
  end
end
