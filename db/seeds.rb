# encoding: utf-8

# User.create(
#   [
#     {
#       username: 'xxd',
#       email: 'xxd@gmail.com',
#       password: 'xxdxxd'
#     },
#     {
#       username: 'vvdpzz',
#       email: 'vvdpzz@gmail.com',
#       password: 'vvdpzz'
#     }
#   ]
# )
# 
# Vine.all.each do |vine|
#   if vine.photos.count > 0
#     photo = vine.photos.last
#     vine.cover = photo.image.url(:a)
#     vine.save
#   end
# end