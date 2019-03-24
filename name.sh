#!/bin/bash
function changeName(){
  filename=`echo $1`
  extension="${filename##*.}"
  filename="${filename%.*}"
  array=(${filename//-/ })
  len=${#array[@]} 
  if [ $len = 2 ]
  then
    new=${array[1]}-${array[0]}.${extension}
    echo $new
    mv $1 $new
  fi
}
function travFolder() { 
  flist=`ls $1`
  cd $1
  #echo $flist
  for f in $flist
  do
    if test -d $f
    then
      #echo "dir:$f"
      travFolder $f
    else
      #echo "file:$f"
      changeName $f
    fi
  done
  cd ../ 
}
dir=`pwd`
travFolder $dir