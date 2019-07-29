#!/bin/bash

APIKEY=""
MACADDRESS=""

function help() {
    echo    ""
    echo    "This script returns vendor Company Name of provided MAC address"
    echo    "It requires two parameters:"
    echo -e    "\t-k\t<apiKey>\tApi key for https://macaddress.io service"
    echo -e   "\t-m\t<macaddress>\tMac address to be checked"
    echo
    echo    "Usage example:"
    echo    "\$ $0 -k someApiKey -m '44:38:39:ff:ef:57'"
    echo
    echo    "As backend macaddress.io service is used. Check more at https://macaddress.io"
    exit 1
}

function findMacVendor() {
    curl -s "https://api.macaddress.io/v1?apiKey=${1}&output=json&search=${2:0:8}" | jq '.vendorDetails.companyName'
}

while getopts "h:k:m:" arg;
do
    case $arg in
        h)
            help
            ;;
        k)
            APIKEY=$OPTARG
            ;;
        m)
            MACADDRESS=$OPTARG
            ;;
        *)
            help
    esac
done

if [ -z "$APIKEY" ] || [ -z "$MACADDRESS" ];
then
    echo "Params not set"
    help
fi

findMacVendor $APIKEY $MACADDRESS
