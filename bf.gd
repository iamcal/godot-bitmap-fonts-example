extends FontFile
class_name BitmapFont

@export var texture: Texture2D:
	set(new_texture):
		texture = new_texture
		update_texture()
		
@export var line_height: int:
	set(new_line_height):
		line_height = new_line_height
		update_texture()

var _fixed_size = 10
var _cache_index = 0
var _texture_index = 0
var _size = Vector2i(_fixed_size, 0)

func update_texture():
	var image = texture.get_image()
	set_texture_image(_cache_index, _size, _texture_index, image)
	set_cache_ascent(_cache_index, _size.x, line_height)
	set_cache_descent(_cache_index, _size.x, 0)
	#update_glyphs()

#func add_glyphs(characters: String, offset_x: int, offset_y: int, width: int, height: int):
#
	#for i in range (0, characters.length()):
#
		#var glyph = characters.to_ascii_buffer()[i]
		#var advance = width
		#var rect = Rect2(offset_x+(i*width), offset_y, width, height)
		#
		#font.set_glyph_uv_rect(_cache_index, _size, glyph, rect)
		#font.set_glyph_texture_idx(_cache_index, _size, glyph, _texture_index)
		#font.set_glyph_offset(_cache_index, _size, glyph, Vector2(0, -height))
		#font.set_glyph_size(_cache_index, _size, glyph, rect.size)
		#font.set_glyph_advance(_cache_index, _size.x, glyph, Vector2(advance, 0))
