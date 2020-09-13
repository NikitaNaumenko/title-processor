# frozen_string_literal: true

require 'title/processor/version'
require 'net/http'
require 'nokogiri'

module Title
  module Processor
    def self.process!(links = [])
      threads = []
      titles = []
      title_mutex = Mutex.new

      links.each do |link|
        threads << Thread.new(link, titles) do |l_link, l_titles|
          uri = URI(l_link)
          response = Net::HTTP.get(uri)
          title = Nokogiri::HTML::Document.parse(response).title

          title_mutex.synchronize { l_titles << title }
        end
      end

      threads.each(&:join)
      titles
    end
  end
end
