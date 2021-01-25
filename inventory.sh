#!/bin/bash
# This script creates a list of 4G network equipment whenever installed 
# The script can't answer what hardware is currently installed, but whether or when it's been installed
# -u — user, -p — pswd, -N means --skip-column-names, cm_t_invt — inventory table in EMS
RESULT=`mysql -ulsm -plsm -N  mc_db <<select * from cm_t_invt;`
echo $RESULT > /home/makuznet/inventory.txt