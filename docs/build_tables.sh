#!/bin/bash
work_dir=`mktemp -d`
#work_dir="/var/folders/4_/vwm34dfx22x0scq_fjf6wh_m0000gq/T/tmp.LRBfcvAB/"
echo "${work_dir}"
pushd "${work_dir}"
# First download current version of tables from github
svn checkout https://github.com/glamod/common_data_model/trunk/tables
pushd ./tables
echo "Code tables" > index.rst
echo "=================================" >> index.rst
echo ".. toctree::" >> index.rst
# now need to convert from tab seperated to csv
FILES=`ls *.dat`
table_count=1
mkdir all_tables
for f in $FILES
do
  tablename=`echo $f | cut -d'.' -f1`
  mkdir "${tablename}"
  cat "${tablename}.dat" | perl -pe "s/\"/'/g" | awk '\
  BEGIN {FS="\t"};
  {
    for (i=1; i < NF ; i++){
      printf "\"%s\",", $i
    }
  }
  { printf "\"%s\"\n", $NF }
  END{}
  ' | perl -pe 's/(\\\[)(.*?)(\\])/:math:`\2`/g;s/(\$\{)(.*?)(\}\$)/:math:`\2`/g' > "./${tablename}/${tablename}.csv"
  # file converted to csv, also add csv to temporary directory
  cp ./${tablename}/${tablename}.csv ./all_tables/${tablename}.csv
  # build rst file for code table
  echo "${tablename}" > "./${tablename}/${tablename}.rst"
  echo "==================================" >> "./${tablename}/${tablename}.rst"
  echo "Download csv version :download:\`${tablename} <${tablename}.csv>\`" >> "./${tablename}/${tablename}.rst"
  echo " " >> "./${tablename}/${tablename}.rst"
  echo ".. csv-table::" >> "./${tablename}/${tablename}.rst"
	echo "	:file: ${tablename}.csv" >> "./${tablename}/${tablename}.rst"
	echo "	:header-rows: 1" >> "./${tablename}/${tablename}.rst"
  echo "	${tablename}/${tablename}" >> index.rst
  ((table_count=table_count+1))
done

# tar and zip all_tables to create single downloadable version
tar -cf all_tables.tar ./all_tables/*.csv
gzip all_tables.tar
rm -R ./all_tables
rm *.dat
popd
popd
cp -R "${work_dir}/tables/"* ./source/tables/code_tables/

exit 0
