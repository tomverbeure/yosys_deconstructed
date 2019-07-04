#! /usr/bin/env ruby

script = <<EOS
# begin:
	read_verilog -lib -D_ABC +/ice40/cells_sim.v
	hierarchy -check -auto-top
	proc

# flatten:
	flatten
	tribuf -logic
	deminout

# coarse:
	opt_expr
	opt_clean
	check
	opt
	wreduce
	peepopt
	opt_clean
	share
	techmap -map +/cmp2lut.v -D LUT_WIDTH=4
	opt_expr
	opt_clean
	alumacc
	opt
	fsm
	opt -fast
	memory -nomap
	opt_clean

# bram:
	memory_bram -rules +/ice40/brams.txt
	techmap -map +/ice40/brams_map.v
	ice40_braminit

# map:
	opt -fast -mux_undef -undriven -fine
	memory_map
	opt -undriven -fine

# map_gates:
	techmap -map +/techmap.v -map +/ice40/arith_map.v
	ice40_opt

# map_ffs:
	dffsr2dff
	dff2dffe -direct-match $_DFF_*
	techmap -D NO_LUT -map +/ice40/cells_map.v
	opt_expr -mux_undef
	simplemap
	ice40_ffinit
	ice40_ffssr
	ice40_opt -full

# map_luts:
	techmap -map +/ice40/latches_map.v
	abc -dress -lut 4
	clean

# map_cells:
	techmap -map +/ice40/cells_map.v
	clean

# check:
	hierarchy -check
	stat
	check -noinit

EOS

def puts_command(command, design_name, label, label_nr, command_nr)
    command_short = command.split(/ /).first
    prefix = "#{design_name}.#{ label_nr }.#{label }.#{command_nr}.#{ command_short }"

    puts command
    puts "write_ilang #{ prefix }.il"
    puts "show -format svg -prefix #{prefix} #{ design_name }"
    puts
end

design_name = ARGV[0]
label_nr = 0
label = "read_verilog"
command = "read_verilog #{ design_name }.v"
command_nr = 0

puts_command(command, design_name, label, label_nr, command_nr)

script.split(/\n/).each do |l|
    l.strip!

    if l =~ /#\s*(.*):/
        label = $1
        label_nr += 1
        command_nr = 0

        puts "#============================================================"
        puts "# #{ label.upcase }"
        puts "#============================================================"
        puts
        next
    end

    next if l == ""

    puts_command(l, design_name, label, label_nr, command_nr)
    command_nr += 1


end
