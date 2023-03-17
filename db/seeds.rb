# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create a parent and child folder
Folder.create!(name: 'Parent folder').folders.create!(name: "Child folder")

#Create a page on the last folder
Folder.last!.pages.create!(title: "Page 1")

#Create a couple blocks on the last page
Page.last!.blocks.create!(type: "Blocks::Text", body: "Block 1")
Page.last!.blocks.create!(type: "Blocks::Text", body: "Block 2")
