
DESIGNS = \
	redundant_ffs_design \
#	add_ff_design \
#	simple_design \

all: $(DESIGNS)

clean:
	rm -fr *.il *.dot *.svg *.ys

simple_design: simple_design.ys
	yosys -s simple_design.ys

simple_design.ys: create_ys.rb
	./create_ys.rb simple_design > $@


add_ff_design: add_ff_design.ys
	yosys -s add_ff_design.ys

add_ff_design.ys: create_ys.rb
	./create_ys.rb add_ff_design > $@


redundant_ffs_design: redundant_ffs_design.ys
	yosys -s redundant_ffs_design.ys

redundant_ffs_design.ys: create_ys.rb
	./create_ys.rb redundant_ffs_design > $@

