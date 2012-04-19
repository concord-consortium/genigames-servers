To use this repository you need two tools littlechef and librarian-chef

Install littlechef

    pip install littlechef
    
Install librarian-chef

    rvm --rvmrc --create use 1.9.3@genigames
    gem install librarian
    
To update to the genigames server you need to setup the auth.cfg file to know about the genigames.pem file.

To add a new recipe or attribute to one of the servers, you edit the `nodes/SERVER_NAME.json` file, then run

    fix node:SERVER_NAME

If you need to use an additional cookbook, edit the file `Cheffile` then run

    librarian-chef install
