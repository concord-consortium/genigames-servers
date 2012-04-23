To use this repository you need two tools: littlechef and librarian-chef

=== Get Started

Install littlechef

    pip install littlechef
    
Install librarian-chef

    rvm --rvmrc --create use 1.9.3@genigames-servers
    gem install librarian
    
Run initial librarian install

    librarian-chef install

Setup the `auth.cfg` file to know about your genigames.pem file.

=== Updating the Server

To add a new recipe or attribute to one of the servers, you edit the `nodes/SERVER_NAME.json` file, then run

    fix node:SERVER_NAME

If you need to use an additional cookbook, edit the file `Cheffile` then run

    librarian-chef install
