def combine_step_with_template_impl(ctx):
  source_directory = ctx.attr.step_directory
  target_directory = ctx.actions.declare_directory(source_directory + ".OUT")

  ctx.actions.run_shell(
    inputs = [],
    outputs = [target_directory],
    arguments = [target_directory.path],
    command = "cp -r abc/SKIP-publish/template/* %s && cp -r abc/%s/* %s/src" % (target_directory.path, source_directory, target_directory.path)
  )

  return [DefaultInfo(files = depset([target_directory]))]

combine_step_with_template = rule(
  implementation = combine_step_with_template_impl,
  attrs = {
    "step_directory": attr.string(),
    "deps": attr.label_list()
  }
)
