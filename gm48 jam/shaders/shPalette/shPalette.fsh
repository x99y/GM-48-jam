varying vec2 v_vTexcoord;
uniform sampler2D palette_spr;
uniform float palette_ind; // now 0.0–1.0 UV
uniform float color_num;
uniform vec2 size;         // texel size (1/w, 1/h)

void main() {
    float r = texture2D(gm_BaseTexture, v_vTexcoord).r;
    float c = floor(r * color_num);
    // Sample palette: X steps along colors, Y is palette row
    vec2 pal_uv = vec2((c + 0.5) / color_num, palette_ind);
    gl_FragColor = vec4(texture2D(palette_spr, pal_uv).rgb, 1.0);
}