def combine_step_with_template_impl(ctx):
  source_directory = ctx.attr.step_directory
  target_directory = ctx.actions.declare_directory(ctx.attr.step_directory + ".OUT")

  ctx.actions.run_shell(
    outputs = [target_directory],
    # Might want to change this to "cp %s/* %s" so that the contents of the source go to the target folder (provided it exists)
    command = "mkdir %s && cp %s/* %s" % (ctx.attr.step_directory + ".OUT", source_directory, ctx.attr.step_directory + ".OUT")
  )

  return [DefaultInfo(files = depset([target_directory]))]

combine_step_with_template = rule(
  implementation = combine_step_with_template_impl,
  attrs = {
    "step_directory": attr.string(),
    "deps": attr.label_list()
  }
)
