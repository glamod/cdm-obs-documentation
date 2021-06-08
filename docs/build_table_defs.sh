#!/bin/bash
work_dir=`mktemp -d`
#work_dir="/var/folders/4_/vwm34dfx22x0scq_fjf6wh_m0000gq/T/tmp.LRBfcvAB/"
echo "${work_dir}"
pushd "${work_dir}"
# First download current version of tables from github
svn checkout https://github.com/glamod/common_data_model/trunk/table_definitions/
pushd ./table_definitions
echo "Table definitions" > index.rst
echo "=================================" >> index.rst
echo ".. toctree::" >> index.rst
# now need to convert from tab seperated to csv
FILES=`ls *.csv`
table_count=1
for f in $FILES
do
  tablename=`echo $f | cut -d'.' -f1`
  echo "${tablename}"
  mkdir "${tablename}"
  cat "${tablename}.csv" | grep -E -v "^#" | perl -pe "s/\"/'/g" | awk '\
  BEGIN {FS="\t"};
  {
    for (i=1; i < NF ; i++){
      printf "\"%s\",", $i
    }
  }
  { printf "\"%s\"\n", $NF }
  END{}
  ' | perl -pe 's/(\\\[)(.*?)(\\])/:math:`\2`/g;s/(\$\{)(.*?)(\}\$)/:math:`\2`/g' > "./${tablename}/${tablename}.csv"
  echo "${tablename}" > "./${tablename}/${tablename}.rst"
  echo "==================================" >> "./${tablename}/${tablename}.rst"
  echo ".. csv-table::" >> "./${tablename}/${tablename}.rst"
	echo "	:file: ${tablename}.csv" >> "./${tablename}/${tablename}.rst"
  echo "	${tablename}/${tablename}" >> index.rst
  ((table_count=table_count+1))
done
rm *.csv
popd
popd
cp -R "${work_dir}/table_definitions/"* ./source/tables/table_defs/

exit 0
