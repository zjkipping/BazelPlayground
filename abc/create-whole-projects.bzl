load(":copy-directory.bzl", "copy_directory")

def create_whole_projects(name):
  [copy_directory(
    name = name + source_file + ".RULE",
    source = source_file
  ) for source_file in steps]

  [copy_directory(
    name = name + "TEMPLATE." + source_file + ".RULE",
    source = "SKIP_publish/template/*",
    target = source_file + ".OUT",
    deps: [source_file + ".RULE"]
  ) for source_file in steps]
