#!/usr/bin/env python
# coding: utf-8
import invoke

@invoke.task
def test(ctx):
    invoke.run("nosetests -v -s")