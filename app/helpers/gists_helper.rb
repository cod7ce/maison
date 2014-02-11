require 'coderay'
module GistsHelper
 def raw_snippet_path snippet
  "#{gist_path(snippet.gist)}/raw/#{snippet.id}/#{snippet.filename}"
 end
end
