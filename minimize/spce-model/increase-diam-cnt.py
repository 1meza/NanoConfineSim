import numpy as np
from ase import Atoms
from ase.io import read, write

# Read original CNT to get its parameters
original_cnt = read('new_cnt.xyz')  # or .pdb, .data, etc.

# Calculate current CNT parameters
z_length = original_cnt.cell[2, 2]
n_layers = len(set(original_cnt.positions[:, 2]))
layer_spacing = z_length / n_layers

# Count atoms in the original CNT
n_atoms_original = len(original_cnt)

# Calculate new parameters
atoms_per_layer = n_atoms_original // n_layers
new_atoms_per_layer = atoms_per_layer + 4  # Increase by 4 atoms per layer, adjust as needed
new_length = z_length

# Calculate nanotube parameters
r = new_atoms_per_layer * 1.42 / (2 * np.pi)  # 1.42 is typical C-C bond length

# Create new, larger CNT
positions = []
for layer in range(n_layers):
    z = layer * layer_spacing
    for i in range(new_atoms_per_layer):
        theta = 2 * np.pi * i / new_atoms_per_layer
        x = r * np.cos(theta)
        y = r * np.sin(theta)
        positions.append([x, y, z])

# Create the Atoms object
new_cnt = Atoms('C' * len(positions), positions=positions)

# Set the cell
new_cnt.set_cell([2*r, 2*r, z_length])
new_cnt.center()

# Write the new CNT structure
write('larger_cnt.xyz', new_cnt)

print(f"Original CNT: {n_atoms_original} atoms")
print(f"New CNT: {len(new_cnt)} atoms")
print(f"New CNT radius: {r:.2f}")
