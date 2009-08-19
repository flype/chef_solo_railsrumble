#!/bin/sh

apt-get install wget
wget http://gist.github.com/raw/132506/986dddee9b9c4c14e8de147abc17b95644684219/gistfile1.txt -O - | sh
rake solo
