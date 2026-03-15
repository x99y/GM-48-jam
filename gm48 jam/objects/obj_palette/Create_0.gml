surf_palette = -1;
palette_ind = 1;

shPalette_palette_spr = shader_get_sampler_index(shPalette, "palette_spr");
shPalette_palette_ind = shader_get_uniform(shPalette, "palette_ind");
shPalette_color_num = shader_get_uniform(shPalette, "color_num");
shPalette_size = shader_get_uniform(shPalette, "size");