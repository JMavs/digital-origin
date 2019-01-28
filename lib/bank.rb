class Bank
  attr_accessor :slug, :name

  def initialize(slug, name)
    @slug = slug
    @name = name
  end
end
