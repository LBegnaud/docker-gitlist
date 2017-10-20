
## What is GitList

GitList is an elegant and modern web interface for interacting with multiple git repositories. It allows you to browse repositories using your favorite browser, viewing files under different revisions, commit history, diffs. See [http://gitlist.org/](http://gitlist.org/).

## How to use this image

```
docker run --name gitlist -e TZ=America/Chicago -p 8080:80 -v "$PWD":/home/git/repositories/ radersolutions/gitlist
```
The above will start the gitlist container to map your current directory into the `/home/git/repositories` directory. This directory is presented by the gitlist web app. Inside the container, this is living on port 80. With the above command it would be exposed at port 8080.

Note that the TZ env variable can be any valid [Timezone Name](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones)

Adjust parameters as you see fit. 

*NOTE* By default, this image will do a git pull every 15 minutes for every directory in the `/home/git/repositories` directory. This behavior can be avoided by blanking out the `/etc/cron.d/crontabs` file by symlinking some other blank file there: `-v /path/to/blank/file:/etc/cron.d/crontabs`


- [github](https://github.com/RaderSolutions/docker-gitlist)
- [docker hub](https://hub.docker.com/r/radersolutions/gitlist/)
