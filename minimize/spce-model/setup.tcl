set pdbfile "//wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/minimize/spce-model/water-cylinder-2.pdb"
mol new $pdbfile type pdb

molinfo top set a 80
molinfo top set b 80
molinfo top set c 33.23

# Assign charges
set sel [atomselect top "name C"]
$sel set charge 0.0

set sel [atomselect top "name H"]
$sel set charge 0.4238

set sel [atomselect top "name O"]
$sel set charge -0.8476

topo guessbonds

topo retypebonds 1 C-C
topo retypebonds 2 O-H

topo guessangles
topo guessdihedrals

topo writelammpsdata //wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/minimize/spce-model/water_in_cnt-next.data full
