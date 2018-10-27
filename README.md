# Js::Packer::Rails
The Packer allows you to easily include JavaScript bundle into your Rails project.
JavaScript world offers a lot of great tools for bundling, uglifying, minifying... So, use it in your Rails app!
It could be Webpack or Grunt or Gulp or Any New Awesome JS tool :)
I believe the choice of the tools should depend on the issues you want to solve, so use JS tool to bundle your source JS code.

The Packer:
* doesn't care how do you bundle your JavaScript
* doesn't use Rails assets pipeline
* is dedicated only for Rails
* requires JavaScript manifest file
* adds 3 helper methods to your views:
```
js_bundle_tag(*sources)
js_bundle_hash(source)
js_bundle_name(source)
```

## Example

How to use `js-packer-rails` gem in Rails app with:

* Webpack
* Babel
* React

[https://github.com/jcieslar/js_packer_rails_example](JS packer Rails example)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'js-packer-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install js-packer-rails

## Usage

### JavaScript manifest file

Generate manifest:

```json
/* admin-bundle.json */
{
  "admin-bundle.js": "admin-bundle-f65a6b9fb09ba93b7ea6.js"
}
```

So if your JS bundle name is: `bundle-example-name` then you have to generate the following manifest:
`bundle-example-name.json`

```json
{
  "bundle-example-name.js": "bundle-example-name-[bundle hash].js"
}
```

### Rails view

#### js_bundle_tag

Use `js_bundle_tag` helper in your view/layout by passing your JS bundle name as an argument.
It returns the script tag with the proper path to your JS bundle:

```
<%= js_bundle_tag 'admin-bundle' %>
# => <script src='bundle/javascripts/admin-bundle-f65a6b9fb09ba93b7ea6.js'></script>
```

If you would like to include more than one JS bundle, just add another argument:

```
<%= js_bundle_tag 'admin-bundle', 'user-bundle' %>
```

#### js_bundle_hash

Use `js_bundle_hash` helper to get your JS bundle code version:

```
<%= js_bundle_hash 'admin-bundle' %>
# => f65a6b9fb09ba93b7ea6
```

### js_bundle_name

Use `js_bundle_name` helper to get your JS bundle full name with a hash:

```
<%= js_bundle_name 'admin-bundle' %>
# => admin-bundle-f65a6b9fb09ba93b7ea6.js
```

### Bundle JavaScript

Put your JSON manifest and JS bundle in `public/bundles/javascripts/` directory.

### Configuration

You can change the default directory of your manifest and bundle via YAML file: `config/packer.yml`

You can define paths by two params: `manifest_path` and `bundle_path`.
The manifest and bundle should be in the public directory.
`manifest_path` should contain the path starting from `public/` while the `bundle_path` should skip `public/`

For example:

```yml
default: &default
  manifest_path: public/js/bundles
  bundle_path: js/bundles

development:
  <<: *default
test:
  <<: *default
production:
  <<: *default
```

### Example Webpack setup

Use webpack plugin `webpack-manifest-plugin`

```js
const path = require('path')
const ManifestPlugin = require('webpack-manifest-plugin')

module.exports = {
  entry: {
    'admin-bundle': path.resolve(__dirname, 'src', 'index.js'),
  },
  output: {
    filename: 'admin-bundle-[hash].js',
    sourceMapFilename: 'admin-bundle-[hash].js.map',
    path: path.resolve('../../public/bundles/javascripts/'),
  },
  plugins: [
    new ManifestPlugin({
      fileName: 'admin-bundle.json',
    }),
  ],
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jcieslar/js-packer-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
