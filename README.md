# docker-letsencrypt-manager
A docker image allowing you to manage your domains and certificates and automatically renews them. It is based on the [official letsencrypt docker image](https://letsencrypt.readthedocs.org/en/latest/using.html#running-with-docker). It uses the [ACME webroot method](http://letsencrypt.readthedocs.org/en/latest/using.html#webroot) to perform domain validation, allowing zero-downtime certificate renewals.

## Environment Variables

* ```LE_EMAIL```: Set the email-address used by letsencrypt. **(mandatory)**
* ```LE_RSA_KEY_SIZE```: Set the RSA key size used by letsencrypt (optional).

## Volumes

* ```/etc/letsencrypt```: The configuration directory of the letsencrypt client.
* ```/var/lib/letsencrypt```: The working directory of the letsencrypt client.
* ```/var/acme-webroot```: This is the directory where letsencrypt puts data for ACME webroot validation.
