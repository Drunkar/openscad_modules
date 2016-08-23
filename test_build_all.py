#!/usr/bin/env python
# coding: utf-8
import os
from glob import glob
import subprocess

CMD = "openscad -o "
OUTPUT_PATH = os.environ["CIRCLE_ARTIFACTS"]


def test_build_all():
    for file in glob("modules/*.scad"):
        print("--------------------------------------------------------------")
        print(file)
        output_file = os.path.splitext(os.path.basename(file))[0]
        p = subprocess.Popen(["openscad", "-o", OUTPUT_PATH + "/" + output_file + ".stl", file],
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        out, err = p.communicate()
        error_count = out.count(b"ERROR") + err.count(b"ERROR")
        warning_count = err.count(b"WARNING") + out.count(b"WARNING")
        expect = 0
        print(out.decode("utf-8"))
        print(err.decode("utf-8"))
        try:
            assert error_count + warning_count == expect
        except AssertionError:
            print("stdout: " + out.decode("utf-8"))
            print("stderr: " + err.decode("utf-8"))
            raise Exception("ERROR or WARNING exists!")