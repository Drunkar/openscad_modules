#!/usr/bin/env python
# coding: utf-8
import commands

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/ArcOfCylinder.stl "
GREP = " | egrep -c 'ERROR|WARNING'"

function = commands.getoutput(CMD + "modules/ArcOfCylinder.scad" + GREP)
expect = "0"
try:
    assert function == expect
except AssertionError:
    print("Expect " + str(expect) + ", but the result was " + str(function) + ".")