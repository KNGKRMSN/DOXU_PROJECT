varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 currentColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(1.0 - currentColor.r, 1.0 - currentColor.g, 1.0 - currentColor.b, currentColor.a);
}
