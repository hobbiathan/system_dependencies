# System Dependencies

## Usage

To run what exists of this program, clone locally, and execute the following:

```
ruby lib/main.rb input.txt
```

Feel free to modify the contents of `input.txt`.

Testing of the Package and Dependency models was done using RSpec; running `rspec` in the root directory of the project will run the test cases and show the results. You'll also see some text saying stuff like `Installing SSH`, that was a component used in to try to keep `main.rb` a bit cleaner.

## Methodology

I spent about a day thinking about what necessarily this project even was, and for a little bit I was stumped. I think often times its significantly easier to look at a problem and instantly feel overwhelmed, and I think that's probably something that I want to focus and work on given my current position as a junior developer. However, after spending the night reading the task at hand, and doing some psuedocoding to play around with some ideas, the concept of what I was actually building clicked during work; it's really just a package manager. For some reason, reading "system dependencies" feels much more ambiguous than it really is, but hearing "package manager" doesn't. Funny how that works.



Anywho, the structure is relatively straightforward; You have packages, and dependencies. Technically, packages can also be dependencies, and so on and so forth, but I tried to restrict the idea and definitions in a way I thought would work for the task at hand. That being said, Packages contain 3 attributes; Name, Installation Status, and an array of dependency names. Dependencies also contain 3 attributes; Name, Installation Status, and Installation (or more accurately, Dependency) count. 

When met with the `DEPEND` command, a package object is initialized with its name and an empty array. All dependencies listed in the line will then be stored first as name in the array of the package, then as their own dependency object being stored inside a dependency hash. The dependency hash is listed so that the name of a dependency (say, SSH) will point to the object of that dependency. The object itself is not initially installed, and the dependency count will be 0 by default; this will be modified accordingly on packages that require a dependency; so if I install another package that requires dependency X, it'll check the dependency has, and if it exists, it'll simply update the dependency count, otherwise it'll create that dependency object and add +1 to the dependency count.

When installing, the installation status of the package is first checked; if, for whatever reasonm, the package is already installed (checking the `installation_status` atribute), then the user is notified. Otherwise, we iterate through the dependency array we made for our package against our dependency hash; we check to see if its installed, and if so, we add one to the dependency count, otherwise we install it, then add one to the dependency count. After iterating through our dependency array for our package, we then install the package itself.

The plan for `REMOVE` would've been in relation to the dependency count; if the thing in question was a package attempting to be uninstalled, it would be uninstalled without any issue. However, if the item in question had packages dependent on it, we wouldn't be able to install. Simply put, the counter in the dependency object would have to be at 0 in-order for the uninstall method to be used on it, and therein changing the `installation_status` of the dependency object. The logic for this wasn't built out as I hit my two hour limit.

The `LIST` command would've just the names of all keys in the package and dependency array, flattened them and printed each name on a new line.

The `END` command would've just been a `return`
