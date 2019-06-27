def copy_project(source, target = None):
  if target == None:
    target = source + ".OUT"

  copy_directory(
    name = source + ".COPY",
    source = source,
    output = target
  )

  copy_directory(
    name = source + ".TEMPLATE",
    source = "template",
    output = target
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
  in_directory = ctx.file.input
  out_directory = ctx.actions.declare_file(ctx.outputs.output)

  ctx.actions.run_shell(
    inputs = [in_directory],
    outputs = [out_directory],
    command = "cp -r %s %s" % (in_directory, out_directory)
  )

copy_directory = rule(
  implementation = _copy_directory_impl,
  attrs = {
    "source": attr.label(),
    "output": attr.output(),
    "deps": attr.label_list()
  }
)
