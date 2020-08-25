# frozen_string_literal: true

require "jekyll"
require "rinku"

module Jekyll
  class Autolink

    class << self
      # Public: Processes the content.
      #
      # content - the document or page to be processes.
      def process(content)
        return if content['autolink'] === false
        return if content.site.config['autolink'] === false

        config = content['autolink'] || content.site.config['autolink'] || {}
        mode = case config['mode']
          when 'email_addresses'
            :email_addresses
          when 'urls'
            :urls
        else
          :all
        end
        
        content.output = Rinku.auto_link(content.output, mode, config['link_attr'], config['skip_tags'])
      end

      # Public: Determines if the document should be processed.
      #
      # doc - the document being processed.
      def document_processable?(doc)
        (doc.is_a?(Jekyll::Page) || doc.write?) &&
          doc.output_ext == ".html" || (doc.permalink&.end_with?("/"))
      end

    end
  end
end

# Hooks into Jekyll's post_render event.
Jekyll::Hooks.register [:pages, :posts, :documents], :post_render do |doc|
  Jekyll::Autolink.process(doc) if Jekyll::Autolink.document_processable?(doc)
end
