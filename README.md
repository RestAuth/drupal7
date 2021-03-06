RestAuth for Drupal7
====================

This is a RestAuth module for [Drupal 7](https://www.drupal.org/).

The module supports login, synchronization of a users e-mail address and roles,
user registration and password reset functionality (even if the user has never
logged in at the specific Drupal site before).

Installation
------------

The module is not yet hosted on drupal.org. So clone the repository, symlink
the ``restauth`` repository into your modules directory and enable it in the
webinterface. You need to configure a RestAuth server and credentials before
the module does anything.

Once the module is enabled and configured, Drupal uses RestAuth as its only
source for login validation and for roles. If you enable this plugin on an
existing installation, you should take care to export existing users to
RestAuth first or users won't be able to log in.

RestAuth server configuration
-----------------------------

First, you need to configure credentials that the RestAuth module can use. For
a reference server, this would mean:

    # Create service, generate password
    restauth-service add --gen-password www.example.com
    # Allow Drupal to connect from this address:
    restauth-service set-hosts www.example.com 192.168.0.2
    # Allow it to perform these operations
    restauth-service set-permissions www.example.com user_create \
        user_verify_password user_change_password \
        props_list prop_get prop_set \
        get_groups_for_user group_create group_add_user group_remove_user

Drupal roles are directly mapped to standard RestAuth groups with the same
name. Drupal updates user roles from RestAuth when a user logs in or when the
users profile is updated. In general, it is best to migrate roles to RestAuth
before enabling the module, e.g. for the standard administrator role:

    restauth-group add --service www.example.com administrator
    restauth-group add-user --service www.example.com administrator username
    # add further users...

Configure with drush
--------------------

If you shut yourself out of your drupal installation, it might be useful to
configure the plugin from the command line with drush:

    # print all variables:
    drush -l restauth.net variable-get restauth_server
    # e.g. set the RestAuth server:
    drush -l restauth.net variable-set restauth_server https://auth.restauth.net

ToDo
----

* Publich module on drupal.org
* Mass-editing of roles
* Password reset functionality should only (or just first?) query the RestAuth
  database.

