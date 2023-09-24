{% if helpers.exists('Muro.proxy.general.enabled') and Muro.proxy.general.enabled|default("0") == "1" %}
squid_setup="/usr/local/opnsense/scripts/proxy/setup.sh"
squid_enable="YES"
{% else %}
squid_enable="NO"
{% endif %}
