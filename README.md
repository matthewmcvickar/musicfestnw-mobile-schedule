<img width="280" src="src/img/mafew.png">

<b>M</b>atthew <b>A</b>aron's <b>F</b>ront <b>E</b>nd <b>W</b>eb Template<br><br>


---

This is my starting point for front end web development projects. It's mostly just a Grunt setup. Feel free to use this for your own projects, but these instructions rely on my own personal setup, and this may be confusing and not fit your workflow.

The name is pronounced 'Maff-yoo', like a toddler saying my name.

---


## Features

- [HTML5 Boilerplate](http://html5boilerplate.com/)
- [Normalize.css](http://necolas.github.io/normalize.css/)
- [Grunt](http://gruntjs.com/)
- [Bower](http://bower.io/)
- [SASS](http://sass-lang.com/)
- [CoffeeScript](http://coffeescript.org)


## Configuration and Initialization

1. [Download a copy of this template.](https://github.com/matthewmcvickar/mafew/archive/master.zip)

1. Set the `name`, `codename`, `version`, and `homepage` in the `package.json` file.

1. Open the Gruntfile (`Gruntfile.coffee`) and search for all instances of `TODO` to make sure it's set up right for this project.

    **Deployment:**

    If using the `ftp-deploy` task, grab a copy of the `!ftppass` file from the `/Applications/MAMP/htdocs/matthewmcvickar/` directory. Rename it `.ftppass` and put it in the project directory. Make sure the `.gitignore` file is set to ignore `.ftppass`.

    If this project should be deployed to GitHub Pages, change the `deploy` Grunt task to `gh-pages`.

    Delete the deployment task that isn't being used to avoid confusion.

1. Open `src/_header.html` and `src/_footer.html` and do the same for the `TODO`s there.

1. Open a terminal window.

1. Install NodeJS if you don't have it already:

    ```sh
    brew install node
    ```

1. Set correct permissions for NodeJS to not require `sudo` for commands.

    ```sh
    $ sudo chown -R `whoami` ~/.npm
    $ sudo chown -R `whoami` /usr/local/lib/node_modules
    ```

1. Install Grunt if you don't have it already.

    ```sh
    $ npm install -g grunt-cli
    ```

1. Install Bower if you don't have it already.

    ```sh
    $ npm install -g bower
    ```

1. Install the SASS gem:

    ```sh
    $ gem install sass
    ```

    (You may need to `sudo` this.)

1. Navigate to project folder.

1. Install project dependencies:

    ```sh
    $ npm install
    ```

1. Fetch frontend JavaScript library dependencies with Bower:

    ```sh
    $ bower install
    ```

1. Start Grunt, which concatenates and minifies the frontend libraries that Bower fetched, then starts a webserver, then watches for changes in and builds JS and CSS files, and does autoreloads.

    ```sh
    $ grunt
    ```

    Make changes to files in the `src/` directory and they will be processed into the `/build` directory.

1. Go to [http://localhost:5000](http://localhost:5000) to see the running site.

1. ***Get started!***


### Changing Libraries

External libraries are fetched and maintained with [Bower](http://bower.io). Changing these dependencies (which are stored in the `bower_components/` folder) means updating the `Gruntfile.coffee` to include or exclude libraries (see the libraries listed under the `uglify:` task to see where this is happening). Once your changes are complete, stop the running `grunt` command and re-run `grunt` to re-concatenate the libaries and start the Grunt watcher again.
