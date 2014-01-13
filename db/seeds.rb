# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

IdentityType.create(identity_kind: 'GitHub')
IdentityType.create(identity_kind: 'LinkedIn')
IdentityType.create(identity_kind: 'Twitter')
IdentityType.create(identity_kind: 'Hometown')
IdentityType.create(identity_kind: 'Interests')
