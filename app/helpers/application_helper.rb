module ApplicationHelper
  def markdown(text)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    md.render(h(text))
  end
end

class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
end
