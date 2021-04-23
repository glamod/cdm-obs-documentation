#!/bin/bash

#work_dir=`mktemp -d`
work_dir="/var/folders/4_/vwm34dfx22x0scq_fjf6wh_m0000gq/T/tmp.LRBfcvAB/"
echo "${work_dir}"
pushd "${work_dir}"
# First download current version of tables from github
svn checkout https://github.com/glamod/common_data_model/trunk/tables
pushd ./tables
echo "Code tables" > index.rst
echo "===========" >> index.rst
echo ".. toctree::" >> index.rst
# now need to convert fromtabseperated to csv
FILES=`ls *.dat`
table_count=1
for f in $FILES
do
  tablename=`echo $f | cut -d'.' -f1`
  mkdir "${tablename}"
  cat "${tablename}.dat" | awk '\
  BEGIN {FS="\t"};
  { for (i=1; i < NF ; i++){printf "\"%s\",", $i } }
  { printf "\"%s\"\n", $NF }
  END{}
  ' > "./${tablename}/${tablename}.csv"
  echo "${tablename}" > "./${tablename}/${tablename}.rst"
  echo "============" >> "./${tablename}/${tablename}.rst"
  echo ".. csv-table::" >> "./${tablename}/${tablename}.rst"
	echo "	:file: ${tablename}.csv" >> "./${tablename}/${tablename}.rst"
  echo "	${tablename}/${tablename}" >> index.rst
  ((table_count=table_count+1))
done
rm *.dat
popd
popd

cp -R "${work_dir}/tables/"* ./source/code_tables/
exit 0
