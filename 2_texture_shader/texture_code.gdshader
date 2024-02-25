shader_type canvas_item;

uniform sampler2D mask_texture;
uniform sampler2D noise_texture;
uniform sampler2D gradient_texture;
uniform float gradient_size: hint_range(0.0, 1.0) = 0.2;

void fragment() {
	// color
	vec3 gradient_color = texture(gradient_texture, UV).rgb;
	float noise_alpha = step(gradient_size,texture(noise_texture, UV).r);
	vec3 texture_color = texture(TEXTURE, UV).rgb;
	COLOR.rgb = mix(gradient_color, texture_color, noise_alpha);

	// alpha
	COLOR.a = 1.0 - texture(mask_texture, UV).r;
	
}
