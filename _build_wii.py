#!/usr/bin/env python
import dependencies.buildark.buildark as buildark

buildark.wii_init("./iso", "./_build/wii", "./dependencies/patch")
buildark.build_splitark(
	["./_ark", ["./_songs/songs_wii", "/songs"]],
	"./_build/wii/files/gen",
	"./temp_ark_wii",
	"patch_wii",
	"tbrb",
	"./_build/wii/files/gen/main_wii.hdr",
	[
		r".*\..*_ps3$",
		r".*\.xbv$",
		r".*\..*_xbox$",
		r".*_out.*",
		r".*_dbg\.milo.*",
		r".*_rt\.milo.*",
		r".*\.bak$",
		r".*\.png$",
		r".*\.jpg$",
		r".*\.dds$",
		r".*\.xcf$",
		r".*\.sh$",
		r".*\.py$"
	]
)
buildark.make_wbfs("./_build/wii", "./iso/TBRB Ultimate.wbfs")