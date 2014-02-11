module ApplicationHelper
  def markdown(text)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    md.render(h(text))
  end

  def coderay snippet
    CodeRay.scan(snippet.code, snippet.language).div(:line_numbers => :inline)
  end

  def render_page_title
    site_name = Setting.app_name
    title = @page_title ? "#{site_name} | #{@page_title}" : site_name rescue "SITE_NAME"
    content_tag("title", title, nil, false)
  end

  def seo_friendly_path obj
    obj_mark = obj.aliase ? obj.aliase : obj.id
    "#{obj.class.to_s.downcase.pluralize}/#{obj.user.name}/#{obj_mark}"
  end
end

class HTMLwithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
end
