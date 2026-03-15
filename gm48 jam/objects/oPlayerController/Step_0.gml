aud_volume = min(aud_volume + 0.003, 0.7)

if !audio_is_playing(mus_inst) { mus_inst = audio_play_sound(mus_music,4,1, 0) }
audio_sound_gain(mus_inst,aud_volume,0)

script_execute(state)

