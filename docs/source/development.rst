Development
===========


Making the docs
---------------

Building the docs uses sphinx and pdflatex.
If you don't have pdflatex, try :code:`brew cask installbasictex` (taken from `this answer <https://tex.stackexchange.com/a/319572>`_).
If you then execute :code:`make docs` (again using the root directory of this repository as the working directory), the docs will be built.
If you get errors about missing latex :code:`.sty` files, packages can be installed on a mac with :code:`sudo tlmgr install <package>`.


Other notes
-----------

:code:`touch f` will create an empty file (that is not of any type) called :code:`f`.
Files that are created within the container in the mounted directory will persist even once the container is stopped the local directory.

To exit the container, use :code:`exit`.


Updating the git repository
---------------------------

  #. Check :code:`git status`
  #. Use :code:`git add .` to add all files or :code:`git add <file>` for specific files

    #. Note that any files in the .gitignore file will be ignored during all git commits and pushes

  #. :code:`git commit -m <message>` to commit changes which have already been added into the repository
  #. :code:`git push` to push local changes up to the remote repository
