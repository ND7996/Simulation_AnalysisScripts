#! /bin/bash

. /software/amber20/amber.sh
rm trajin.in rmsf.dat rmsf.lig.dat
echo "reference ./gpx6humancys.inpcrd" >> trajin.in
for i in `seq 0 20 5000`;do
bzip2 -df gpx6humancys.md$i.rst.bz2
echo "trajin ./gpx6humancys.md'$i'.rst" >> trajin.in
done
echo "autoimage
center origin :1-197
atomicfluct first :1-197@CA out rmsf.dat byres
go" >> trajin.in

cpptraj -p ./gpx6humancys.prmtop < trajin.in
