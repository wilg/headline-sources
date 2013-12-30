# Headline Sources

Sources of headlines and fetcher code for various news sources.

### Adding New Sources

1.  Fork this repository.
2.  Clone it to your computer.
3.  Install dependencies with [Bundler](http://bundler.io).
    
    If you don't have Bundler installed, try `gem install bundler` or `sudo gem install bundler` to install it.

    Once you have bundler, just `cd` to your download path, and run `bundle`.
    
4. Look in `src/fetchers` to see some example fetchers. Copy one that looks good or create your own.
5. Run it with `ruby src/fetchers/myfetcher.rb`. This will run until you cancel it with CTRL+C.
6. Commit your changes and open a pull request.
