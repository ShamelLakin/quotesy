class QuoteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quote, :author, :tag, :category_id, :category
end
