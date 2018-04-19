class TileMap < SF::Transformable
  include SF::Drawable

  def initialize(tileset, tile_size, tiles, width, height)
    super()

    # load the tileset texture
    @tileset = SF::Texture.from_file(tileset)

    @vertices = SF::VertexArray.new(SF::Quads)

    tiles_per_row = @tileset.size.x / tile_size.x

    # populate the vertex array, with one quad per tile
    (0...height).each do |y|
      (0...width).each do |x|
        # get the current tile number
        tile_index = tiles[width*y + x]

        # find its position in the tileset texture
        tile_pos = SF.vector2(
          tile_index % tiles_per_row,
          tile_index / tiles_per_row
        )

        destination = SF.vector2(x, y)

        # define its 4 corners and texture coordinates
        { {0, 0}, {1, 0}, {1, 1}, {0, 1} }.each do |delta|
          @vertices.append SF::Vertex.new(
            (destination + delta) * tile_size,
            tex_coords: (tile_pos + delta) * tile_size
          )
        end
      end
    end
  end

  def draw(target, states)
    # apply the transform
    states.transform *= transform()

    # apply the tileset texture
    states.texture = @tileset

    # draw the vertex array
    target.draw(@vertices, states)
  end
end
