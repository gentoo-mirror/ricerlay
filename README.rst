********
ricerlay
********

Purpose
#######

The main Gentoo package tree sometimes is lacking "crucial" packages for ricing.
Some of them do exist but, for example, live ebuilds are not present or broken.
This overlay is aimed to fix these issues and promote Gentoo as a favorable
distribution for those who want to customize their desktop.

Installation
############

::

    layman -a ricerlay
    layman -S
    emerge <package>

Getting Involved
################

Please do contribute!

If you are willing to help, there is a ``TODO.md`` list that contains packages
needed to be added or updated. However, you are not limited to only working
with it. You are encouraged to add interesting packages related to ricing,
customization and workflow improvement.

Some packages here I no longer use or maybe even too lazy to bump to upstream.
Please report any issues rearding that.

Making PRs
**********

Example workflow could look like this (commented out are actions that you
perform outside of your terminal):

::

    ### Fork this repository ###
    git clone https://github.com/<your github username>/ricerlay.git
    ### Make changes ###
    ### Check for QA ###
    git add <your changes>
    git commit -m "<category>/<package>: <Briefly state your changes>"
    git push -f origin master
    ### Create a PR ###

Consider commiting changes *per-package*, **don't** commit multiple packages at
once. Make sure you write a **meaningful commit message** (you can use two or
three words if you think that changes are self-explanatory), for example:

::

    some-category/some-package: Briefly state yor changes

    If needed, explain the reasoning behind your commit or provide information,
    changelog, upstream notes and etc. related to the packae in the subsection
    of the commit message.

It would be really nice if you could also use ``app-portage/repoman`` for QA.

If you are submiting a new package, include yourself as a maintainer in the
``metadata.xml`` file.

And finally, consider using indentation guides from ``.editorconfig`` file so
that the code in the overlay stays uniform. Basically, both ``.ebuild``  and
``.xml`` files are using 4 non-expanded spaces as a tab. You are free to do what
you consider the best in ``${FILESDIR}``.
