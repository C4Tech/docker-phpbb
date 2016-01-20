This is a fork of vimagick/phpbb. 

You will find 2 images, 1 that is used to install, use with the "install" tag, The other image is the main production image. Only difference is that the prodcution image has the install directory removed.

Mini How-To:
Start a container using the the image with the "install" tag. Make sure to setup the volumes. You will need a mysql or mariadb container as well.
Volumes needed is somthing like:
    - ./phpbb/data/config.php:/var/www/html/config.php
    - ./phpbb/data/images:/var/www/html/images
    - ./phpbb/data/files:/var/www/html/files
    - ./phpbb/data/store:/var/www/html/store
Go through the install. Once finished stop and rm the container. now create a new container with the same setup, but use the "lastest" tag.


Why fork?
It could be my lack of understanding how Vimagick wanted his image to be used, but it apappears that you have to remove the install dir from the container after installing,which would require you to go through the setup again everytime you recreated your continer. I wanted to be able to be able to recreate the container and not have to go through a setup again.


TODO
* Clean up documentation with a better howto.
