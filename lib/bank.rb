class Bank
  attr_accessor :slug, :name, :transfers

  def initialize(slug, name)
    @slug = slug
    @name = name
    @transfers = []
  end

  def add_transfer(transfer)
    @transfers << transfer
  end
end
