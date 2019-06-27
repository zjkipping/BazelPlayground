def copy_project(source, target = None):
  if target == None:
    target = source + ".OUT"

  copy_directory(
    name = source + ".COPY",
    source = source,
    output = target
  )

  # this won't work since they both have the same declared output...
  # It might come down to declaring a new folder/directory from this macro (need to convert to an implementation/rule to get a ctx)
  # Then the copy_directory can declare all the files in the directory it's copying using a filegroup (with a glob)?

  copy_directory(
    name = source + ".TEMPLATE",
    source = "template",
    output = target,
    deps = [":" + source + ".COPY"]
  )

def _copy_directory_impl(ctx):
  in_directory = ctx.file.input
  out_directory = ctx.actions.declare_file(ctx.outputs.output)

  ctx.actions.run_shell(
    inputs = [in_directory],
    outputs = [out_directory],
    # Might want to change this to "cp %s/* %s" so that the contents of the source go to the target folder (provided it exists)
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
