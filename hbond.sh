#! /bin/bash                      

. /software/amber20/amber.sh                                            

echo "reference ./humancysgssg.inpcrd" >> trajin.in           #specify the coordinate file for simulation 
for i in `seq 0 20 5000`;do                                   #specify the frames
bzip2 -df humancysgssg.md$i.rst.bz2                           
echo "trajin ./humancysgssg.md'$i'.rst" >> trajin.in          #Read in trajectory restart specified by filename
done
echo "autoimage                                             #Automatically center and image a trajectory with periodic boundaries
center origin :1-197
hbond donormask :1-197 acceptormask :49 avgout hbond2.dat dist 3
go" >> trajin.in

cpptraj -p ./humancysgssg.prmtop < trajin.in                  #specify the prmtop file for simulation 
