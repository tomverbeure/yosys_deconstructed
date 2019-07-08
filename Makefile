
DESIGNS = \
	error_design \
	check_fails_design \
	add_const_design \
	sb_io_pads_design \
	tribuf_design \
	hier_design \
	redundant_ffs_design \
	add_ff_design \
	simple_design

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


hier_design: hier_design.ys
	yosys -s hier_design.ys

hier_design.ys: create_ys.rb
	./create_ys.rb hier_design > $@


tribuf_design: tribuf_design.ys
	yosys -s tribuf_design.ys

tribuf_design.ys: create_ys.rb
	./create_ys.rb tribuf_design > $@


sb_io_pads_design: sb_io_pads_design.ys
	yosys -s sb_io_pads_design.ys

sb_io_pads_design.ys: create_ys.rb
	./create_ys.rb sb_io_pads_design > $@


add_const_design: add_const_design.ys
	yosys -s add_const_design.ys

add_const_design.ys: create_ys.rb
	./create_ys.rb add_const_design > $@


check_fails_design: check_fails_design.ys
	yosys -s check_fails_design.ys

check_fails_design.ys: create_ys.rb
	./create_ys.rb check_fails_design > $@


error_design: error_design.ys
	yosys -s error_design.ys

error_design.ys: create_ys.rb
	./create_ys.rb error_design > $@

