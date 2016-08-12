#!/usr/bin/env python
# coding: utf-8
import os
from glob import glob
import commands

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/"
GREP = " | egrep -c 'ERROR|WARNING'"

for file in glob("modules/*.scad"):
    output_file = os.path.splitext(os.path.basename(file))[0]
    function = commands.getoutput(CMD + output_file + ".stl modules/" + file + GREP)
    expect = "0"
    try:
        assert function == expect
    except AssertionError:
        print("Expect " + str(expect) + ", but the result was " + str(function) + ".")