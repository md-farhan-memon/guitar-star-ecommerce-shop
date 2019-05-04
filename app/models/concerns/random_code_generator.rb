module RandomCodeGenerator
  extend ActiveSupport::Concern

  TYPES = {
    alpha: [*'A'..'Z'],
    numeric: [*'0'..'9'],
    alpha_numeric: [*'0'..'9', *'A'..'Z']
  }.freeze

  class << self
    def produce(length: 6, type: :alpha_numeric)
      list = TYPES[type]
      Array.new(length || LENGTH) { list.sample }.join
    end
  end
end
