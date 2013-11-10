# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skill.find_or_create_by name: "Fotografia", level: 1
Skill.find_or_create_by name: 'Angielski', level: 1
Skill.find_or_create_by name: 'Hiszpański', level: 1
Skill.find_or_create_by name: 'Wrotki', level: 1
Skill.find_or_create_by name: 'Żeglarstwo', level: 1
Skill.find_or_create_by name: 'Programowanie', level: 1


