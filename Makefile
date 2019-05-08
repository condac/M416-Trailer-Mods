# make -j for multi threaded
# match "module foobar() { // `make` me"
#TARGETS=$(shell sed '/^module [a-z0-9_-]*().*make..\?me.*$$/!d;s/module //;s/().*/.stl/' print.scad)

all: stl default extra
	rm stl/default.stl stl/extra.stl
	
default: hub_8x12x3_m3 wheelhex_m4 wheelhex_cap_m4 axle_155mm_m3

extra: hub_8x12x3_m2 wheelhex_m3 wheelhex_cap_m3 axle_155mm_m2



%:
	openscad -m make -o stl/$@.stl -D "$@();" makeparts.scad

stl:
	mkdir stl
