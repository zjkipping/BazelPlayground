## Lazy loading

### Routes as the unit of lazy loading

#### Why?

TODO: Update this wording to reflect LL as default loading approach

The purpose of lazy loading is to defer loading the source code for
portions of an application until they are needed. It makes little
difference on a small application, but makes a very big difference on
a large application.

For optimal user experience, lazy load nontrivial subsections of an
application - by default. Lazy loading works well enough that you can
"build it right the first time".

#### How?

This example shows the particular variation of routing syntax
needed to work with the CLI lazy loading support. The syntax can be
slightly different if you are using a different tooling approach.

### Preloading: eager lazy routes

Initially, lazy loading is often perceived as a feature only for the
largest, most complex applications. However, it may be best seen as a
default way of loading portions of an application, suitable for nearly
all applications.

To understand the benefit, consider the additional feature of
pre-loading: with this setting, Angular will begin (asynchronously)
loading modules configured for lazy loading, even before the user
needs them. The sequence of operations is then:

* Load the page, with the minimum of code needed to start.
* Render the page, so the user can see and interact with it.
* Asynchronously, while no user is waiting, load other code that might
  be needed.
* When the user needs more of that code, when they navigate to such a
  route, it is immediately ready.

For a deeper explanation, see this blog post by a core Angular team member:

https://vsavkin.com/angular-router-preloading-modules-ba3c75e424cb#.fay3a7ak5

#### Lazy loading during class

Although most of our in-class example don't lazy load, for workshop
code (and for real work) we recommend lazy loading. That way, you get
practice with the details.
