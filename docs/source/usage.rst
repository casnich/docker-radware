Usage
=====

Mounting a local directory
--------------------------

If you have a local folder with files to examine/edit, it can be mounted into the container as shown

.. code-block:: sh

   docker run -it --rm -v <local-path>:<path-in-container> radware /bin/

e.g. if we want to mount the local folder `~/work` into `/data` on the container, use


.. code-block:: sh

   docker run -it --rm -v ~/work:/data radware /bin/bash

In the above command:

  - :code:`-it` makes the container run interactively
  - :code:`--rm` means that the container shuts down after it has been exited
  - :code:`-v local:cont` mounts the `local` directory into the path `cont` within the container
  - :code:`/bin/bash` is the command that the container executes in the shell - in this case it is just giving us a bash shell
