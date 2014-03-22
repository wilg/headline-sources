# Headline Sources

Sources of headlines and fetcher code for various news sources.

### Adding New Sources

1.  Fork this repository.
2.  Clone it to your computer.
3.  Install dependencies with [Bundler](http://bundler.io).

    If you don't have Bundler installed, try `gem install bundler` or `sudo gem install bundler` to install it.

    Once you have bundler, just `cd` to your download path, and run `bundle`.

4. Look in `lib/headline_sources/fetchers` to see some example fetchers. Copy one that looks good or create your own. We'll try to determine your class name based on the filename by calling [`camelize`](http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-camelize) on it, so make sure it's named correctly. (For example if your file is named `newsblog_fetcher` your class should be named `NewsblogFetcher`).
5. Add a favicon from the site to `app/assets/images/headline_sources/newsblog.png`.
6. Add the full site name and a category to `db/sources.yml`.
7. Fetch some headlines with `bin/headline-sources fetch newsblog`.
8. Commit your changes and headlines and open a pull request.

### Updating the List

Clone the repo, then run `bin/headline-sources batch`. This will update all the sources in sequence.
