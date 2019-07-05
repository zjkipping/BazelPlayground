# Starting with Angular

## JavaScript, TypeScript, Angular

Instructor - consider drawing a grid on the whiteboard.

For classes interested in the differences between ES5, ES2015,
TypeScript, ES.next, draw a grid on the board containing categories for
each technology in the stack.

### ES5

Historically this was the JavaScript supported by browsers; but today
most current browser support at least ES2015.

### ES2015

### ES.next

### TypeScript

Along the way of teaching Angular, we will also teach "just enough
TypeScript" to understand and work on the code.

Since Angular itself is coded in TypeScript, and since TypeScript
appears to be most prominently featured in the examples, we believe
that the great majority of Angular development will happen in
TypeScript. Therefore we also use it here, for the remainder of the
class.

We have been using TypeScript even before Angular at Oasis Digital,
and are very happy with the development process benefits.
We even write most Node code with TypeScript.

## Simplest Angular application

Here is close to the simplest Angular app - just a few libraries and a
bit of JS code.

### Appearance of the in-class examples - CSS

In this instruction kit, we are using "materialize" plus some of our
own custom CSS to create an appearance similar to the Google "material
design" guidance. We intentionally chose not to use any of the
Google-supported implementations, though:

* Angular Material
* Material Design Lite
* Polymer-based elements

All of these add significant JavaScript complexity to a page, making
it difficult to understand what aspects are Angular versus another
library.

### Development tooling for class use

You might be curious what is inside the file abc2.js and the related
files in the minimal_lib directory. Sometimes in class we colloquially
describe it as "magic", but actually it is a combination and use of
these technologies:

* TypeScript compiler
* SystemJS
* Angular
* RxJS
* NgRx
* Lodash
* minor libraries and miscellaneous pieces

abc2.js is most similar to the configuration provided by the "quick
start" described and used and linked from Angular.io. It serves the
needs in class quite well, because it minimizes any need for
server-side tooling while we all make it through Angular itself.

Lodash tips:

```
npm i -S lodash-es @types/lodash-es
```

```
import { whatever } from 'lodash-es';
```

This enables use of the ES6 module packaging of lodash, for effective
tree shaking during bundling.

## The TypeScript module system

### Dividing a program into modules / files

* TypeScript Modules, which are files
* Imports from the same project
* Imports from libraries
* Exports
