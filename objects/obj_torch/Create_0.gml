///@desc Init

event_inherited();

z = 0;
height = 40;

image_speed = 0;
image_index = choose(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
alarm[0] = choose(1, 2)*choose(2, 2, 2, choose(1, 3)); //Changes the image index

light_color_percentage = random_range(0.3, 0.7);
light_size_percentage = random_range(0.55, 0.6);