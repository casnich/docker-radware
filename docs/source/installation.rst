Installation
============

Docker
------

Before continuing, ensure that you have Docker installed.
Instructions can be found on the `Docker installation page <https://docs.docker.com/install/>`_.


Building the docker container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Building the docker container can then be done using (using the root directory of this repository as the working directory):

.. code-block:: sh

   docker build -t radware .

You can check that the installation has worked by running the container (again using the root directory of this repository as the working directory):

.. code-block:: sh

   docker run -it --rm radware /bin/bash

Once in the container, run the command :code:`which gf3`.
If you get any output then installation was successful and the container is ready to use.


Using the GUI
~~~~~~~~~~~~~

If you wish to use the graphical user interface (GUI) then you will likely require extra steps.

OSx
+++

We have summarised the steps presented on `this blog <https://blogs.oracle.com/oraclewebcentersuite/running-gui-applications-on-native-docker-containers-for-mac>`_.

  #. change X11 security settings (XQuartz --> Preferences --> Security) so that it allows connections from network clients
  #. record IP address (or put it in environment variable e.g. :code:`export IP=ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'`)
  #. add IP address to xhost (:code:`xhost + ${IP}`)

To run the container including display forwarding, run the container as shown below:

.. code-block:: sh

   docker run -it --rm -e DISPLAY=<ip-address>:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/work:/data radware /bin/bash

Once in the container, you can see an example of how :code:`gf3` works with the following command

.. code-block:: sh

   gf3 /root/data/gamma.spe

If installation and display forwarding has succeeded, running this command will open a graphical user interface.

Linux
+++++

If you would like to contribute information about how to run the GUI on Linux, please make a `pull request <https://github.com/casnich/honours/pulls>`_.

Windows
+++++++

If you would like to contribute information about how to run the GUI on Windows, please make a `pull request <https://github.com/casnich/honours/pulls>`_.
