var _tex = sprite_get_texture(sPalettes, 0);
var _pal_h = sprite_get_height(sPalettes); // 3

shader_set(shPalette);
    texture_set_stage(shPalette_palette_spr, _tex);
    // Pass 1/width and 1/height so shader can step in UV space
    shader_set_uniform_f_array(shPalette_size, [
        texture_get_texel_width(_tex),
        texture_get_texel_height(_tex)
    ]);
    shader_set_uniform_f(shPalette_color_num, 5);
    // Convert palette_ind to 0.0–1.0 UV space
    shader_set_uniform_f(shPalette_palette_ind, (palette_ind + 0.5) / _pal_h);

    // *** Actually draw something — e.g. the game surface ***
    draw_surface(application_surface, 0, 0);

shader_reset();

if (palette_ind >= _pal_h) palette_ind = 0;