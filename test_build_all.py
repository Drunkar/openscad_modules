#!/usr/bin/env python
# coding: utf-8
import os
from glob import glob
import subprocess

CMD = "openscad -o ${CIRCLE_ARTIFACTS}/"


def test_build_all():
    for file in glob("modules/*.scad"):
        output_file = os.path.splitext(os.path.basename(file))[0]
        function_stdout = subprocess.check_output(
            ["openscad", "-o", "${CIRCLE_ARTIFACTS}/" + output_file + ".stl", file])
        error_count = function_stdout.count(b"ERROR")
        warning_count = function_stdout.count(b"WARNING")
        expect = 0
        try:
            assert error_count + warning_count == expect
        except AssertionError:
            print(function_stdout)
            raise Exception("ERROR or WARNING exists!")
