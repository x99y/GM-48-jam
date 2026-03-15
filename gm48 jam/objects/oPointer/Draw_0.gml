bob_timer += 0.03;  // speed of bob
y = base_y + sin(bob_timer) * 4;  // 4px range

shader_set(shPalette)
draw_self()
shader_reset()


depth = -70