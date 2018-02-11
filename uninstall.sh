#!/bin/sh

for in _*
do
	rm -fr "${HOME}/${i/_/.}"
done

