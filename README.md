# BIG WARNING: as of 2016-08-02 17:30

This is Alpha code that will change rapidly throughout 2016 as I work on it.  Do not use this in a production system until it has reached a stable 1.0.0 version (sometime near the end of 2016).

# Dlegr250MaterialDesign

This is a custom implementation of the [Google Material Design Spec](http://www.google.com/design/spec/material-design/introduction.html).

It is built from the ground-up trying to use best practices but is still a work-in-progress.  I extracted this code to a gem so I could use it in several projects simultaneously without updating code in each of them.

It is only engineered to support the latest browser versions that auto-update. Basically that means Internet Explorer 10+ and Edge, because all other major browsers already auto-update and usually follow the specs set forth for `CSS`.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'dlegr250_material_design'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dlegr250_material_design

## Usage

Add this line to your application's `app/assets/javascripts/application.js`:

```js
//= require dlegr250_material_design
```

Add this line to your application's `app/assets/stylesheets/application.scss`:

```css
@import "dlegr250_material_design";
```

Note that this assumes you renamed the default `application.css` to `application.SCSS` to utilize SASS/SCSS.

Using the `.scss` extension lets you control the order in which files are loaded/imported, which is a very good thing. This lets you use variables later on that were defined once in a previous file.

If you aren't using `.scss` extensions on all your stylesheets, you're doing it wrong ;)p

## Application Default Variables

The gem uses `SASS` variables to set standard defaults for your application. This allows you to change major colors by simply changing a single variable.

In your `application.scss` file, *before* you import the library, set your variables. This mechanism relies upon [SASS default variables](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#variable_defaults_) that fall back to standard defaults if you do not specify them.

```css
$body-background-color: #eee;
$primary-color: blue;
$secondary-color:  red;
$hover-color: grey;
$appbar-text-color: #fff;
$appbar-button-color: darkblue;

@import "dlegr250_material_design";
```

This changes the defaults for major layout elements or colored components by changing the `color("primary")` SASS map value.

Note that you can always override an element's color or background color using the `color-{COLOR}` or `background-color-{COLOR}` CSS classes that override whatever other defaults the element has.

## Todo

* Finalize components that will be implemented
* Test in major browser versions and mobile devices
* Styleguide to demo usage and components
* Optimize file sizes
* Create custom Snackbar component instead of using third-party
* Update JS/CoffeeScript to use ES6 when that becomes mainstream, and IF the Rails Core is going to adopt ES6 as a standard; this gem is more about building Rails applications than using a specific JavaScript implementation
* Remove jQuery dependency (requires updating any 3rd-party plugins that depend on jQuery, so may take a while)

## Development

Note that there are no specs for this UI library yet, and I'm
not entirely sure how I would write "specs" for a UI...I think the styleguide will mostly be my "spec" checker.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dlegr250/dlegr250_material_design.
