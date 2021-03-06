# --- Running LAMMPS ---
#  -- Prerequisites: --
# The "run.in.nvt" file is a LAMMPS input script containing
# references to the input scripts and data files
# you hopefully have created earlier with MOLTEMPLATE and PACKMOL:
#   system.in.init, system.in.settings, system.in.coords, system.data,
#   and table_int.dat
# If not, carry out the instructions in "README_setup.sh".
#
#  -- Instructions: --
# Assuming "lmp_mpi" is the name of the LAMMPS binary,
# run lammps in this order:

lmp_mpi -i run.in.min  # Minimize the system (important, and very slow)

lmp_mpi -i run.in.make_uniform  # Trap the lipids between concentric spherical
                                # shells and equilibrate.  This insures
                                # that the lipids are distributed uniformly
                                # on the spherical surface.  (Unfortunately,
                                # PACKMOL does not guarantee this.)

lmp_mpi -i run.in.nvt  # Run a simulation at constant volume (production run)



# If you have compiled the MPI version of lammps, you can run lammps in parallel
#mpirun -np 4 lmp_mpi -i run.in.min
#or
#mpirun -np 4 lmp_mpi -i run.in.nvt
# (assuming you have 4 processors available)
