## Multiple NgModules

Here we split up an early example program in to more than one module.

### Inter-module dependencies

### Imports and Exports

### entryComponents

There is one important bit of the API which never appears in the
examples but is worth a mention: a field of the model definition
called `entryComponents`. Entry components are those which Angular
should "compile" even though they will not be invoked using their
selector.

The obvious and common use of entry components is components that are
routed to using the router configuration. The router module mechanism
automatically sets up these components in the entry components list.

Most applications never need to set up entry components directly; the
exception would be creating a custom routing mechanism of some kind or
similar.
