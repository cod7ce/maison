require 'coderay'
module GistsHelper
 def coderay snippet
  CodeRay.scan(snippet.code, snippet.language).div(:line_numbers => :inline)
 end
end
