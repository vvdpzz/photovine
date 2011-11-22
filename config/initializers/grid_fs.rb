# encoding: utf-8
require 'mongo'

module CarrierWave
  module Storage
    class GridFS < Abstract
      class File
        def md5
          grid.open(@path, 'r')[:md5]
        end
      end
    end # File
  end # Storage
end # CarrierWave
