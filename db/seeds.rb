# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Title.create!(title: 'Get Inspired', section_name: 'generic_stories')
Title.create!(title: 'Get Inspired', section_name: 'blog')
Title.create!(title: 'What you can do for Nature Today', section_name: 'stories')
Title.create!(title: 'Besoin inspiration', section_name: 'fr_blog')