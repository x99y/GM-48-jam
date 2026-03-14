varying vec2 v_vTexcoord;

uniform sampler2D palette_spr;
uniform float palette_ind;
uniform float color_num;
uniform vec2 size;

void main() {
      float c = max(0., ceil(texture2D( gm_BaseTexture, v_vTexcoord ).r * color_num) - 1.);
    gl_FragColor = vec4( texture2D( palette_spr, vec2( c, palette_ind ) * size ).rgb, 1. ) * texture2D( gm_BaseTexture, v_vTexcoord ).a;;
}