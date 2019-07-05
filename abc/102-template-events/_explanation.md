### Events and event bindings

This shows several ways to bind between controls.


Key ideas:

refs: #name or var-name. Either way it makes a new variable. If used
in a string, it is making a new JS variable for repeater or similar.
If used in HTML, it makes a new variable whose value is the DOM
element it was used on.

No such thing as ng-click etc. anymore. One generic replacement to
numerous specific things. In retrospect, it is so obvious that one
wonders why they ever did the old thing.

In the template you can pass `$event` to get the raw event.

The important thing about the alternate syntax is that it lets you use
things like Jade, and the "data-" is valid in HTML5.

#### TypeScript

The type that appears in a function definition parameter list is checked
statically, but not dynamically.
