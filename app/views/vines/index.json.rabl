collection @vines

attributes :id, :name
node(:photos_count) { |vine| vine.photos.count }
code :photos do |vine|
  vine.photos.limit(5).map { |photo| { id: photo.id, url: photo.image.url(:a) } }
end