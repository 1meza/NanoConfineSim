# coding: utf-8

import numpy as np
import re, yaml
import matplotlib.pyplot as plt



# Function to plot only graph and pass in 2 np arrays
def plot_graph(x, y, xlabel, ylabel, filename, color):
      # check if figure is already open
      if plt.fignum_exists(1):
            plt.close()

      # check if figure is not clear
      if plt.gca():
            plt.clf()
            plt.cla()
      # Plotting
      plt.figure(figsize=(12, 8), dpi=720)
      plt.plot(x, y, linestyle='-', color=color)

      # Add vertical lines for different phases
      initial_equil_end = 2
      further_equil_end = 4
      nve_switch_end = 6
      axFontSize = 20
      labelFontSize = 24

      plt.axvline(x=0, color='gray', linestyle='--', label='Initial Equilibration Start')
      plt.axvline(x=initial_equil_end, color='gray', linestyle='--', label='Initial Equilibration End')
      plt.axvline(x=further_equil_end, color='gray', linestyle='--', label='NVE Start')
      plt.axvline(x=nve_switch_end, color='gray', linestyle='--', label='NVT Start')

      plt.xlabel(xlabel, fontsize=labelFontSize)
      plt.ylabel(ylabel, fontsize=labelFontSize)
      plt.xticks(fontsize=axFontSize)
      plt.yticks(fontsize=axFontSize)
      plt.grid(False)
      plt.savefig(filename, dpi=720, bbox_inches='tight')
      plt.close()
      


with open("output (7).yaml") as f:
   data = yaml.load(f, Loader=yaml.FullLoader)

data = np.array(data)

timesteps = np.array([entry['timestep'] for entry in data])
timesteps_10ps = [t / 10000 for t in timesteps]
ke = np.array([entry['ke'] for entry in data])
pe = np.array([entry['pe'] for entry in data])
temp = np.array([entry['temp'] for entry in data])
etot = np.array([entry['etotal'] for entry in data])

plot_graph(timesteps_10ps, ke, 'Time (10 ps)', 'Kinetic Energy (Kcal/mol)', 'ke.png', 'b')
plot_graph(timesteps_10ps, pe, 'Time (10 ps)', 'Potential Energy (Kcal/mol)', 'pe.png', '#e1a900')
plot_graph(timesteps_10ps, temp, 'Time (10 ps)', 'Temperature (K)', 'temp.png', '#00313c')
plot_graph(timesteps_10ps, etot, 'Time (10 ps)', 'Total Energy (Kcal/mol)', 'etot.png', '#e1a900')