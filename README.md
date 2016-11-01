[![Build Status](https://travis-ci.com/opendatakosovo/feride.svg?token=NdK2LpoSQCrxKSRGPAzj&branch=master)](https://travis-ci.com/opendatakosovo/feride)

The Application installation and deployment process

1. Install Apache Virtual Hosts
   - sudo apt-get update
   
   - sudo apt-get install apache2
   
    After installing apache than there are created directories var/www
    Clone the app on the www directory:
    
    sudo git clone https://github.com/opendatakosovo/feride.git
    
2. Enter now inside the feride directory 
3. Run the bash script in order to install the libraries that should be installed
       sudo bash install.sh
       
4. Check where the virtualenv is created as a directory venv

5. Installation and configuration of apache:

    - Install module mod_wsgi, this is a module of Apache HTTP Server that provides services for hosting Python apps that are       web based .
    
        sudo apt-get install libapache2-mod-wsgi
        
    - After installation of this module there is created a file in our app as:
    
      app.wsgi

    - Configure the Server:
      There is a configuration file inside the directory of apache2 and the path to find this file is : 
      
        etc/apache2/sites-available
      
        sudo nano feride.conf

          <VirtualHost *:80>
                          ServerName 138.68.85.130
                          ServerAdmin admin@mywebsite.com
                          WSGIScriptAlias / /var/www/feride/app.wsgi
                          <Directory /var/www/feride/>
                                  Order allow,deny
                                  Allow from all
                          </Directory>
                          Alias /static /var/www/feride/app/static
                          <Directory /var/www/feride/app/static/>
                                  Order allow,deny
                                  Allow from all
                          </Directory>
                          ErrorLog ${APACHE_LOG_DIR}/error.log
                          LogLevel warn
                          CustomLog ${APACHE_LOG_DIR}/access.log combined
          </VirtualHost>

7. Install mongo
      sudo apt-get update
      sudo apt-get install -y mongodb-org
      
      
      
