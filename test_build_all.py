#!/usr/bin/env python
# coding: utf-8
import os
from glob import glob
import subprocess

CMD = "openscad -o "
OUTPUT_PATH = os.environ["CIRCLE_ARTIFACTS"]

def test_build_all():
    for file in glob("modules/*.scad"):
        print("----------------------------------------------------")
        print(file)
        output_file = os.path.splitext(os.path.basename(file))[0]
        function_stdout = subprocess.check_output(
            ["openscad", "-o", OUTPUT_PATH + "/" + output_file + ".stl", file])
        error_count = function_stdout.count(b"ERROR")
        warning_count = function_stdout.count(b"WARNING")
        expect = 0
        print(error_count)
        print(warning_count)
        try:
            assert error_count + warning_count == expect
        except AssertionError:
            print(function_stdout)
            raise Exception("ERROR or WARNING exists!")
