load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def combine_two_directories(dir1, dir2, target, deps):
  pkg_tar(
    name = target + ".CREATE_TAR",
    srcs = [dir1, dir2],
    deps = deps
  )
