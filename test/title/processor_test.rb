# frozen_string_literal: true

require 'test_helper'

class Title::ProcessorTest < Minitest::Test
  def test_get_all_titles_from_link
    links = read_fixtures('urls.txt')
    expected = read_fixtures('expected.txt')

    stub_links

    result = Title::Processor.process!(links)

    assert_equal result.sort, expected.sort
  end

  def test_when_response_redirect
    links = read_fixtures('redirect_urls.txt')
    expected = read_fixtures('redirect_expected.txt')

    body = '<html><title>302 Moved</title></html>'
    stub_request(:get, 'https://google.com')
      .to_return(status: 302, body: body, headers: {})

    result = Title::Processor.process!(links)

    assert_equal result.sort, expected.sort
  end

  def test_when_response_error
    links = read_fixtures('error_urls.txt')
    expected = read_fixtures('error_expected.txt')

    body = '<html><title>500 Internal Server Error</title></html>'
    stub_request(:get, 'https://google.com')
      .to_return(status: 500, body: body, headers: {})

    result = Title::Processor.process!(links)

    assert_equal result.sort, expected.sort
  end

  private

  def stub_links
    titles_by_links = read_fixtures('titles_by_links.txt')
    titles_by_links.each do |value|
      link, title = value.split(' | ')
      body = "<html><title>#{title}</title></html>"

      stub_request(:get, link)
        .to_return(status: 200, body: body, headers: {})
    end
  end
end
