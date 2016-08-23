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
        p = subprocess.Popen(["openscad", "-o", OUTPUT_PATH + "/" + output_file + ".stl", file],
                           stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        function_stdout, function_stderr = stdout_data, stderr_data = p.communicate()
        error_count = function_stdout.count(b"ERROR")
        warning_count = function_stdout.count(b"WARNING")
        expect = 0
        print(function_stderr)
        print(function_stdout)
        print(error_count)
        print(warning_count)
        try:
            assert error_count + warning_count == expect
        except AssertionError:
            print(function_stdout)
            raise Exception("ERROR or WARNING exists!")
