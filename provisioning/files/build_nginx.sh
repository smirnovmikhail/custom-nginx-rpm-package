#!/bin/bash
pushd ~/rpmbuild/SOURCES

#mkdir -p /root/git/
#pushd /root/git/

    #Headers More module
    git clone https://github.com/openresty/headers-more-nginx-module
    pushd headers-more-nginx-module
    git checkout v0.33
    popd


    git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module.git
    pushd ngx_http_substitutions_filter_module
    git checkout v0.6.4
    popd


    git clone https://github.com/vozlt/nginx-module-vts.git
    pushd nginx-module-vts
    git checkout v0.1.16
    popd

#    git clone https://github.com/tony2001/ngx_http_pinba_module.git
#    pushd ngx_http_pinba_module
#    git checkout master
#    popd


    #Accept Language Module
    git clone https://github.com/giom/nginx_accept_language_module.git
    pushd nginx_accept_language_module
    git checkout master
    popd

    #nginx_upstream_check_module
    git clone https://github.com/yaoweibin/nginx_upstream_check_module.git
    pushd nginx_upstream_check_module
    git checkout v0.3.0
    popd

#
#    #Fancy Index module
#    git clone https://github.com/aperezdc/ngx-fancyindex.git
#    pushd ngx-fancyindex
#    git checkout ba8b4ec
#    popd
#
#    #AJP module
#    git clone https://github.com/yaoweibin/nginx_ajp_module.git
#    pushd nginx_ajp_module
#    git checkout bf6cd93
#    popd
#
#    #LDAP authentication module
#    git clone https://github.com/kvspb/nginx-auth-ldap.git
#    pushd nginx-auth-ldap
#    git checkout d0f2f82
#    popd
#
#    #Shibboleth module
#    git clone https://github.com/nginx-shib/nginx-http-shibboleth.git
#    pushd nginx-http-shibboleth
#    git checkout development
#    popd
#
popd

#Prep and patch the nginx specfile for the RPMs
pushd ~/rpmbuild/SPECS
#    patch -p1 < nginx-eresearch.patch
#    spectool -g -R nginx.spec
#    yum-builddep -y nginx.spec
    rpmbuild -ba nginx.spec

    if ! [ $? -eq 0 ]; then
        echo "RPM build failed. See the output above to establish why."
        exit 1
    fi
popd


