class Product < ApplicationRecord
  extend ProductElasticity

  has_many :product_units, dependent: :destroy
  belongs_to :category

  scope :live, -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  before_save :decide_publishing_status
  after_commit :reindex

  searchkick(
    word_start: %i[name brand model]
  )

  def search_data
    as_json(
      except: %i[category_id created_at updated_at],
      methods: %i[category_name p_type]
    )
  end

  def category_name
    category.name
  end

  def p_type
    type
  end

  def purchasable_quantity
    available_quantity > 10 ? 10 : available_quantity
  end

  def sold!(quantity)
    case type
    when 'Guitar'
      selling_time = Time.now
      product_units.order(:bought_on).limit(quantity).each { |unit| unit.update_attribute(:sold_on, selling_time) }
    else
      update_attributes(
        available_quantity: (available_quantity - quantity)
      )
    end
  end

  private

  def decide_publishing_status
    self.published = available_quantity.zero? ? false : true
  end
end
