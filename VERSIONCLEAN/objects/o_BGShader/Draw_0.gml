// Draw event


shader_set(Shader_expo);
shader_set_uniform_f(u_brightness, brightness);
shader_set_uniform_f(u_contrast, contrast);// Change desired_exposure as needed
draw_self();
shader_reset();