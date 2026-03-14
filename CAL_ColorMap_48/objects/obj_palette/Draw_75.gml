
var _tex = sprite_get_texture(sPalettes, 0);
shader_set(shPalette);

	
	texture_set_stage(shPalette_palette_spr, _tex);
	shader_set_uniform_f_array(shPalette_size, [texture_get_texel_width(_tex), texture_get_texel_height(_tex)]);
	shader_set_uniform_f(shPalette_color_num, 5);
	shader_set_uniform_f(shPalette_palette_ind, palette_ind);
	var lay_id = layer_get_id("Tiles_1");
shader_reset();

if (palette_ind >= sprite_get_height(sPalettes)) palette_ind = 0;