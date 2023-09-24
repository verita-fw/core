{# Macro import #}
{% from 'Muro/Macros/interface.macro' import physical_interface %}
{% if not helpers.empty('Muro.IDS.general.enabled') %}
suricata_setup="/usr/local/opnsense/scripts/suricata/setup.sh"
suricata_enable="YES"
{% if not helpers.empty('Muro.IDS.general.verbosity') %}
suricata_flags="-D -{{Muro.IDS.general.verbosity}}"
{% endif %}
{% if Muro.IDS.general.ips|default("0") == "1" %}
# IPS mode, switch to netmap
suricata_netmap="YES"
{% else %}
# IDS mode, pcap live mode
{% set addFlags=[] %}
{%   for intfName in Muro.IDS.general.interfaces.split(',') %}
{#     store additional interfaces to addFlags #}
{%     do addFlags.append(physical_interface(intfName)) %}
{%   endfor %}
suricata_interface="{{ addFlags|join(' ') }}"
{% endif %}
{% else %}
suricata_enable="NO"
{% endif %}
