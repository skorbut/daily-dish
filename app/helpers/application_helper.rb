# frozen_string_literal: true

module ApplicationHelper
  def markdown(text)
    return if text.nil?

    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, autolink: true, no_intra_emphasis: true)
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe # rubocop:disable Rails/OutputSafety
  end
end
