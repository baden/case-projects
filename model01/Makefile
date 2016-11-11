
TEMP_DIR := $(shell pwd)/tmp


model:
	openscad model-01.scad

$(TEMP_DIR)/model-01.png: model-01.scad Makefile
	mkdir -p $(dir $@)
	openscad $< -o $@ \
		-D 'offset=20' \
		--imgsize=2048,2048 \
		--camera=-3.65,-0.81,25.95,74.60,0.00,92.90,237.09 \
		--colorscheme=Nature

model-01.png: $(TEMP_DIR)/model-01.png
	convert $< -resize 25% $@
