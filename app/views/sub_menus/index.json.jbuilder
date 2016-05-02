json.array!(@sub_menus) do |sub_menu|
  json.extract! sub_menu, :id, :title, :link, :main_menu_id
  json.url sub_menu_url(sub_menu, format: :json)
end
