def copy_project(source, target = None):
  if target == None:
    target = source + ".OUT"

  copy_directory(
    name = source + ".COPY",
    in_directory = source,
    out_directory = target
  )

  copy_directory(
    name = source + ".TEMPLATE",
    in_directory = "template",
    out_directory = target
  )

  # native.genrule(
  #   name = source + ".COPY",
  #   srcs = [source],
  #   outs = [target],
  #   cmd = "cp -r $(SRCS) $(OUTS)"
  # )

  # native.genrule(
  #   name = source + ".TEMPLATE",
  #   srcs = ["template/*"],
  #   outs = [target],
  #   cmd = "cp -r $(SRCS) $(OUTS)",
  #   deps = [":" + source + ".OUT"]
  # )

def _copy_directory_impl(ctx):
  ctx.actions.run_shell(
    inputs = [ctx.attr]
  )

copy_directory = rule(
  implementation = _copy_directory_impl,
  attrs = {
    "in_directory": attr.string(),
    "out_directory": attr.string(),
    "deps": attr.label_list()
  }
)
