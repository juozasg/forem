module Forem
  module ApplicationHelper
    include FormattingHelper
    # processes text with installed markup formatter
    def forem_format(text, *options)
      as_formatted_html(text)
    end

    def forem_quote(text)
      as_quoted_text(text)
    end

    def forem_markdown(text, *options)
      #TODO: delete deprecated method
      Rails.logger.warn("DEPRECATION: forem_markdown is replaced by forem_format() + forem-markdown_formatter gem, and will be removed")
      forem_format(text)
    end

    def forem_paginate(collection, options={})
      will_paginate collection, options
    end
  end
end
