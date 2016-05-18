json.array!(@main_menus) do |main_menu|
  json.extract! main_menu, :id, :title, :link
  json.url main_menu_url(main_menu, format: :json)
end
