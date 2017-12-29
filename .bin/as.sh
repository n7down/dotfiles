#!/bin/zsh

# analyze source (as)
# run ctags and cscope
find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -name "*.cc" > cscope.files
cscope -q -R -b -i cscope.files

