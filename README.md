# bashlib

[![Build Status](https://travis-ci.org/vergissberlin/bashlib.svg?branch=master)](https://travis-ci.org/vergissberlin/bashlib)

````
	 _               _     _ _ _
	| |             | |   | (_) |
	| |__   __ _ ___| |__ | |_| |__
	| '_ \ / _` / __| '_ \| | | '_ \
	| |_) | (_| \__ \ | | | | | |_) |
	|_.__/ \__,_|___/_| |_|_|_|_.__/

````

You wanna create your own bash script, and don't start on ground zero?
That library is made for you! It helps to improve bash your bash scripts.

## Including

1. UI components
  - Colored messages ``[ OK ]``
  - Progress annimation ``[ / ]``
2. Validation helper
4. Math helper
5. Remote ssh command execution

## Supported operating systems

- MacOS
- Debian
- Ubuntu
- OpenSuse
- CentOS
- Fedora (In addition to plain installation the package ``findutils`` is required)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

### Testing

````
bash test/suite.sh
````
### CI

```
fly set-pipeline \
	-t bashlib \
	-p bashlib \
	-c ci/pipeline.yml \
	-l ci/variables/message.yml \
	-l ci/variables/message.yml -n
```


### Support or Contact

You can contact me (@vergissberlin) on GitHub. Use the issue tracker to report bugs.


## Thank you

- *tlatsas* for inspire to a bash spinner https://github.com/tlatsas/bash-spinner/blob/master/spinner.sh


---

*Made with love and*

[![Atom.IO](http://github-atom-io-herokuapp-com.global.ssl.fastly.net/assets/logo-4e073dbd4c0ce67ece1b30a6b31253b9.png)](https://atom.io/)
