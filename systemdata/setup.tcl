set pdbfile "//wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/systemdata/water-cylinder-2.pdb"
mol new $pdbfile type pdb

molinfo top set a 80
molinfo top set b 80
molinfo top set c 34 

# Assign charges
set sel [atomselect top "name C"]
$sel set charge 0.0

set sel [atomselect top "name H"]
$sel set charge 0.52

set sel [atomselect top "name M"]
$sel set charge -1.04

set sel [atomselect top "name O"]
$sel set charge 0.0

topo guessbonds

topo retypebonds 1 C-C
topo retypebonds 2 H-M
topo retypebonds 3 O-H
topo retypebonds 4 O-M


topo guessangles
topo guessdihedrals

topo writelammpsdata //wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/systemdata/water_in_cnt-next.data full
