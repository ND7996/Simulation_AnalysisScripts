#! /bin/bash                      

. /software/amber20/amber.sh
rm trajin.in rmsf.dat rmsf.lig.dat
echo "reference ./humancysgssg.inpcrd" >> trajin.in
for i in `seq 0 20 5000`;do
bzip2 -df humancysgssg.md$i.rst.bz2
echo "trajin ./humancysgssg.md'$i'.rst" >> trajin.in
done
echo "autoimage
center origin :1-197
hbond donormask :1-197 acceptormask :49 avgout hbond2.dat dist 3
go" >> trajin.in

cpptraj -p ./humancysgssg.prmtop < trajin.in


