//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 oColor = texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec4 Color = vec4(oColor.r, oColor.g*0.5, oColor.b*0.5, oColor.a);
	
    gl_FragColor = Color;
}
