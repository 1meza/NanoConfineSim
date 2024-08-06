set pdbfile "//wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/minimize/spce-model/co2-water-cylinder.pdb"
mol new $pdbfile type pdb

molinfo top set a 80
molinfo top set b 80
molinfo top set c 33.23

# Assign charges
set sel [atomselect top "resname CNT and name C"]
$sel set type 1
$sel set charge 0.0

set sel [atomselect top "resname HOH and name H"]
$sel set type 2
$sel set charge 0.4238

set sel [atomselect top "resname HOH and name O"]
$sel set type 3
$sel set charge -0.8476

set sel [atomselect top "resname CO2 and name C"]
$sel set type 4
$sel set charge 0.7 

set sel [atomselect top "resname CO2 and name O"]
$sel set type 5
$sel set charge -0.35 

topo guessbonds

topo retypebonds 1 C-C
topo retypebonds 2 O-H
topo retypebonds 3 C-O

topo guessangles

topo retypeangles 1 C-C-C
topo retypeangles 2 H-O-H
topo retypeangles 3 O-C-O

topo guessdihedrals

topo writelammpsdata //wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/minimize/spce-model/co2_water_in_cnt.data full
