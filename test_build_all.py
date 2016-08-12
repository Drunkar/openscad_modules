#!/usr/bin/env python
# coding: utf-8
import commands

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/ArcOfCylinder.stl "
GREP = " | egrep -c 'ERROR|WARNING'"

assert commands.getoutput(CMD + "modules/ArcOfCylinder.scad" + GREP) == "0"