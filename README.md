# ricerlay

[![Build Status](https://travis-ci.org/azahi/ricerlay.svg?branch=master)](https://travis-ci.org/azahi/ricerlay)

## Purpose

The main Gentoo package tree sometimes lacks *crucial* packages
for ricing. Some of them do exist but, for example, live ebuilds are not
present or broken. This overlay is aimed to fix these issues and promote
Gentoo as a favorable distribution for those who want to customize their
desktop, without polluting and going through a hassle of adding packages
to the main tree (read as: *to avoid responsibility*).

## Installing and Using

With [layman](https://wiki.gentoo.org/wiki/Layman):

``` text
layman -a ricerlay
layman -S
emerge <package>
```

With [eselect-repository](https://github.com/mgorny/eselect-repository):

``` text
eselect repository enable ricerlay
emerge --sync
emerge <package>
```

## Getting Involved

Please do contribute!

If you are willing to help, there is a `TODO.md` list that contains
packages needed to be added or updated. However, you are not limited to
only working with it. You are encouraged to add interesting packages
related to ricing, customization and workflow improvement.

Some packages here I no longer use or maybe even too lazy to bump to
upstream versions. Please report any issues rearding that.

### Making PRs

Make sure you are familiar with how to write and how to format ebuilds
and ebuild repositories. The Gentoo's official and up-to-date guide can
be found [here](https://devmanual.gentoo.org/ebuild-writing/index.html).
In addition, to make a good PR that will surely get accepted, I recommend
reading [this](https://wiki.gentoo.org/wiki/GitHub_Pull_Requests).

Example workflow could look like this (commented out are actions that
you perform outside of your shell):

``` text
### Fork this repository ###
git clone https://github.com/<your github username>/ricerlay.git
### Make changes ###
### Test build everything ###
### Check for QA errors ###
git add <your changes>
git commit -m "<category>/<package>: <Briefly state your changes>"
git push -f origin master
### Create a PR ###
```

Consider commiting changes *per-package*, **don't** commit multiple
packages at once. Make sure you write a **meaningful commit message**
(you can use two or three words if you think that changes are
self-explanatory), for example:

``` text
some-category/some-package: Briefly state yor changes

If needed, explain the reasoning behind your commit or provide information,
changelog, upstream notes and etc. related to the packae in the subsection
of the commit message. Remember to reference GitHub tracked issues if you
are working on a fix, for example: Bug #420, Fixes #69.
```

Check your changes with `app-portage/repoman` and `app-portage/overlint` for
possible QA errors.

If you are submiting a new package, include yourself as a maintainer in
the `metadata.xml` file, for example:

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE pkgmetadata SYSTEM "http://www.gentoo.org/dtd/metadata.dtd">
<pkgmetadata>
    <maintainer type="person">
        <email>YOUR.ACTUAL.WORKING@EMAIL.HERE</email>
        <name>YOUR NAME OR HANDLE</name>
    </maintainer>
</pkgmetadata>
```

And finally, consider using indentation guides from `.editorconfig` file
so that the code in the overlay stays uniform. In short, both `.ebuild`
and `.xml` files are using tabs. You are free to do what you consider the best
in the `${FILESDIR}` with patches and whatnot.

## Links

-   [Development Repository](https://github.com/azahi/ricerlay)
-   [Official Gentoo Mirror](https://github.com/gentoo-mirror/ricerlay)
