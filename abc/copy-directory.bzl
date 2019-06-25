# def copy_directory(source, target = None, deps = []):
#   if target == None:
#     target = source + ".OUT"
  
#   native.genrule(
#     name = source + ".COPY",
#     srcs = [source],
#     outs = [target],
#     cmd = "cp -r $(SRCS) $(OUTS)",
#     deps = deps
#   )

# def copy_directory_impl(ctx):
#   target = ctx.attr.target
#   if target == '':
#     target = ctx.attr.source + ".OUT"
  
#   native.genrule(
#     name = ctx.attr.source + ".COPY",
#     srcs = [ctx.attr.source],
#     outs = [target],
#     deps = ctx.attr.deps,
#     cmd = "cp -r $(SRCS) $(OUTS)"
#   )

# copy_directory = rule(
#   implementation = copy_directory_impl,
#   attrs = {
#     "source": attr.string(),
#     "target": attr.string(default = ''),
#     "deps": attr.label_list(default = [])
#   }
# )

# def create_whole_projects_impl(ctx):
#   [copy_directory(
#     name = ctx.attr.name + source_file + ".RULE",
#     source = source_file
#   ) for source_file in ctx.attr.srcs]

#   [copy_directory(
#     name = ctx.attr.name + "TEMPLATE." + source_file + ".RULE",
#     source = "SKIP_publish/template/*",
#     target = source_file + ".OUT",
#     deps = [":" + ctx.attr.name + source_file + ".RULE"]
#   ) for source_file in ctx.attr.srcs]

# create_whole_projects = rule(
#   implementation = create_whole_projects_impl,
#   attrs = {
#     "srcs": attr.string_list()
#   }
# )

# copy_directory = genrule(
#   srcs=["100-my-first-angular-app"],
#   outs=["100-my-first-angular-app.OUT"],
#   cmd="cp -r $(SRCS) $(OUTS)"
# )

def copy_project(source, target = None):
  if target == None:
    target = source + ".OUT"

  native.genrule(
    name = source + ".COPY",
    srcs = [source],
    outs = [target],
    cmd = "cp -r $(SRCS) $(OUTS)"
  )

  native.genrule(
    name = source + ".TEMPLATE",
    srcs = ["template/*"],
    outs = [target],
    cmd = "cp -r $(SRCS) $(OUTS)",
    deps = [":" + source + ".OUT"]
  )
