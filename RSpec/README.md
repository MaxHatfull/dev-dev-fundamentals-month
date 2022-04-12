# RSpec

[RSpec](https://rspec.info) is a Behaviour Driven Development (BDD) framework for Ruby and is used
in many large Ruby/Rails projects. If you've used Jest in JavaScript, the syntax may look familiar.
With RSpec, we write tests to ensure our code is doing what we want it to.

## Set up

<details>
<summary>Installing Ruby</summary>
<br/>
To install and manage Ruby, the best bet is to use <a
href="https://github.com/rbenv/rbenv#installation">rbenv</a>. Follow the installation steps in
their repo, then run <code>rbenv install</code> in this directory and <code>rbenv</code> will
install the required version of Ruby for you.
</details>

To get this ready to go on your machine, run the following command to install the gems required

```console
bundle install
```

To run the tests, we use

```console
bin/rspec
```

Run this now — you should see a failing spec in the `spec/noughts_and_crosses_spec.rb` file. If you want to
run a specific file you can pass that to RSpec

```console
bin/rspec spec/noughts_and_crosses_spec.rb

# Alternatively, you can run a specific line within the spec file...
bin/rspec spec/noughts_and_crosses_spec.rb:9
```

## Instructions

Your task is to create a class for playing [Noughts and
Crosses](https://en.wikipedia.org/wiki/Tic-tac-toe). We've given you a skeleton to start you off
and a basic test file to fill in as you go along. The initial skeleton is simply a template and
you're free to change it as you see fit!

There are some requirements that this game should handle:

1. A new game can be started at any time;
1. A player may enter a move which updates the board;
1. The game reports if a move is invalid (e.g. a piece is already in the position);
1. The game can be queried to find out if the board is in a winning position and
1. The game can report which player has won.

## Further remarks

For solving this problem, you may wish to engage in pair programming by taking turns to write tests
and code between each person. For instance, one person writes a test for the other to code against,
then they swap. Some tools for enabling this remotely include [the Live Share plugin for VS
Code](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare), [Teletype
for Atom](https://teletype.atom.io/), [Pop](https://pop.com/) or even [ssh+vim (hard
mode)](https://ptc-it.de/pairing-with-tmux-and-vim/).

There are multiple ways to represent a game board; you may wish to use a multi-dimensional array or
write a dedicated class for it. Try both and see which fits better!

You may wish to have your game say whose turn it is after each move (i.e. swapping between noughts
and crosses), but this is not a requirement. If you'd prefer, you can have the player pass in which
piece they're making a move for.

It's not a requirement to add a method to render the grid in a user-friendly manner, but if you've
got time left over, you may wish to do this. When coming to test a printing function, RSpec has a
few test methods relating to output. Have a search for them and try to use them to make testing
easier!
