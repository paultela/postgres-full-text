# PostgreSQL Full Text Search Example

A look at using full text searching in PostgreSQL.  Prepared for
[NEWPATH](https://cse.osu.edu/current-students/newpath).

## Getting Setup

You'll need [Virtualbox](https://www.virtualbox.org/) and
[Vagrant](https://www.vagrantup.com/) installed. If you're on a Mac I recommend
installing [Homebrew](http://brew.sh/) and
[homebrew-cask](https://github.com/caskroom/homebrew-cask).  Then you can
simply run `brew cask install virtualbox vagrant`  

Then just clone this repo, cd into it and run `vagrant up`.

The first time this runs it will download the base box and run all updates on
it.  This may take a while, try to do it ahead of time if possible.

## Loading the Data

We'll need some data to work with.  We're going to use a public dataset of MSDS
data.  This dataset contains ~230,000 MSDS sheets, which results in ~1.1GB of
plain text.

You can download the dataset from here:
https://s3.amazonaws.com/paultela.com/msds_data.sql.gz (in SQL form) or in
`pg_dump` format: https://s3.amazonaws.com/paultela.com/msds_data.psql

SSH into the running vagrant box (`vagrant ssh`) cd to `/vagrant`, and run
`sudo -u postgres createdb msds` to create the msds database.  Then you can run

```
gunzip --stdout msds_data.sql.gz | sudo -u postgres psql -d msds
```

to load the dataset into the `msds` database.

## Query the Data

You can run queries on the data using the `psql` client.  The `postgres` user
has superuser privileges by default.  You can start the client by running:

``` sudo -u postgres psql -d msds ```

Type `\d` to see a list of tables and relations.  You can type `\d+ chemicals`
to see the schema for our chemicals table.

We are particularity interested in query times, so type `\timing` to turn
timing on.  This will report execution times for each query we run.
