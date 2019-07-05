## Templates and bindings

### Template binding expressions

`{{variable}}` works as with AngularJS.

[prop] is a one-way binding to the named DOM property.

Specifically, this means a ("JavaScript") property, not an HTML
attribute.

Compared to other common syntaxes used by other libraries, this is:

* short
* stands out more

### Null coalescing / safe traversal

By default, an expression like this will fail if x is null/undefined:

```
{{ x.y }}
```

To avoid this, the following operator performs automatic null
coalescing:

```
{{ x?.y }}
```

#### textContent vs innerText

[textContent] is preferable for performance reasons, according to many
online sources.

#### TypeScript

In this chapter, students are first exposed to various TypeScript
constructs, such as fields and methods. Take time to explain them.
