require 'coderay'
module GistsHelper
 def coderay snippet
  CodeRay.scan(snippet.code, snippet.language).div(:line_numbers => :inline)
 end

 def raw_snippet_path snippet
  "#{gist_path(snippet.gist)}/raw/#{snippet.id}/#{snippet.filename}"
 end
end
