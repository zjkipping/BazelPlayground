def copy_directory(name, source, target = None):
  if target == None:
    target = source + ".OUT"
  
  native.genrule(
    name = name,
    srcs = [source],
    outs = [target],
    cmd = "cp -r $(SRCS) $(OUTS)"
  )
