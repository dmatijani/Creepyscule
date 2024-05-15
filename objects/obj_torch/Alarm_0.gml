///@desc Randomizes the image index and the light

image_index = irandom_range(0, image_number - 1);

light_color_percentage = random_range(0.3, 0.7);
light_size_percentage = random_range(0.55, 0.6);

alarm[0] = choose(1, 2)*choose(2, 2, 2, choose(1, 3)); //Changes the image index