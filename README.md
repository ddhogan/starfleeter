# README

## Starfleeter
### Rails+JS portfolio project for the Flatiron School

## Overview
This app borrows a similar interface to the database Starfleet is always using on various StarTrek series.  In addition to managing content related to various starships, users can also assign crew to different ships and note the mission type, see what the current fastest ship in the fleet is, and slightly more!
### Now with JavaScript and AJAX!

* [Watch](https://www.youtube.com/watch?v=nfABtDst394) the tour of the newest version!
* [Watch](https://www.youtube.com/watch?v=STRKKznhV9Y) the tour of the older, Rails only version.
* ~~Or try it here: https://starfleeter.herokuapp.com/~~ :warning: The Heroku hosted version is still in development.  Several features do not work as intended.  But you can still look around, try logging in as "Roger", (pw: cilantro)
## Installation
1. Fork and clone this repository, and then within the main directory execute
```
$ bundle install
$ rake db:migrate
```
2. Seed some data to start with:
```
$ rake db:seed
```
3. Then run:
```
$ rails s
```
4. Open up a new browser tab and navigate to:
```
localhost:3000
```
5. Press `ctrl+C` in your terminal to shut it down.

This was made with Ruby 2.3.4, Rails 5.1.4, JavaScript ES6, AJAX, and moderate amounts of love.

### Contributors
Contributions are welcome, and can be made by either opening an issue or making a pull request to this repo.

### License
The full [MIT license](https://github.com/ddhogan/starfleeter/blob/master/LICENSE) can be found in this repo.
