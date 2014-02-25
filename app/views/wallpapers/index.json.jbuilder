json.page @page
json.count @count
json.wallpaper do
  json.author @wallpaper.author 
  json.name @wallpaper.name
  json.url @wallpaper.picture.url
  json.thumbnail_url @wallpaper.picture.url :thumb
  json.copyright_link @wallpaper.copyright_link
  json.created_at @wallpaper.created_at
end
