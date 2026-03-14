function layer_shader_start()
{
    if (event_type == ev_draw)
    {
        if (event_number == ev_draw_normal)
        {
			if (instance_exists(obj_palette))
			{
			var _tex = sprite_get_texture(sPalettes, 0);
			shader_set(shPalette)
			
			texture_set_stage(obj_palette.shPalette_palette_spr, _tex);
			shader_set_uniform_f_array(obj_palette.shPalette_size, [texture_get_texel_width(_tex), texture_get_texel_height(_tex)]);
			shader_set_uniform_f(obj_palette.shPalette_color_num, 18);
			shader_set_uniform_f(obj_palette.shPalette_palette_ind, obj_palette.palette_ind);
			
			}
		}
    }
}

function layer_shader_end()
{
    if (event_type == ev_draw)
    {
        if (event_number == ev_draw_normal)
        {
            shader_reset();
        }
    }
}