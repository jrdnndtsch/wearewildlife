module ApplicationHelper

	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: 'add_fields button button--primary button--edit as--half', data: {id: id, fields: fields.gsub("\n", "")})
	end

	def embedded_svg filename, options={}
		file = File.read(Rails.root.join('app', 'assets', 'images', filename))
		doc = Nokogiri::HTML::DocumentFragment.parse file
		svg = doc.at_css 'svg'
		if options[:class].present?
		 svg['class'] = options[:class]
		end
		doc.to_html.html_safe
	end

	def meta_description(meta_text)
		content_for(:meta_description){ meta_text }
	end
end
