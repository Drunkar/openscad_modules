#!/usr/bin/env python
# coding: utf-8
import os
from glob import glob
import subprocess

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/"
GREP = " | egrep -c 'ERROR|WARNING'"

def test_build_all():
    for file in glob("modules/*.scad"):
        output_file = os.path.splitext(os.path.basename(file))[0]
        function = subprocess.getoutput(CMD + output_file + ".stl " + file + GREP)
        expect = "0"
        try:
            assert function == expect
        except AssertionError:
            raise Exception("Expect " + str(expect) + ", but the result was " + str(function) + ".")