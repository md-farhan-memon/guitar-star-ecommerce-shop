module ProductElasticity
  extend ActiveSupport::Concern

  SELECT_ATTRS = %i[
    id p_type name number_of_strings
    brand model price category_name
  ].freeze
  PER_PAGE = 16

  def elastic_search(params = {})
    @params = params
    search(
      @params[:query].presence || '*',
      fields: %i[name brand model], match: :word_start, load: false,
      select: SELECT_ATTRS, where: conditionals,
      page: @params[:page], per_page: PER_PAGE
    )
  end

  private

  def conditionals
    {
      p_type: filtered_type,
      published: true
    }.compact
  end

  def filtered_type
    @params[:type] if @params[:type].present? && !@params[:type].eql?('All')
  end
end
