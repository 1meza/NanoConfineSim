# Select all atoms in the top molecule
set all [atomselect top all]

# Open a file for writing
set filename "//wsl.localhost/Ubuntu-20.04/home/isaiah/NanoConfineSim/minimize/spce-model/new_cnt.xyz"
set fileId [open $filename w]

# Write the number of atoms (first line of XYZ file)
puts $fileId [$all num]

# Write a comment line (second line of XYZ file)
puts $fileId "Carbon Nanotube"

# Get atom data
set names [$all get name]
set coords [$all get {x y z}]

# Write atom data
foreach name $names coord $coords {
    puts $fileId [format "%-2s %12.6f %12.6f %12.6f" $name {*}$coord]
}

# Close the file
close $fileId

puts "XYZ file written to $filename"