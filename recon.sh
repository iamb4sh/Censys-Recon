#!/bin/bash

echo -e "\e[95m @@@@@@@  @@@@@@@@  @@@  @@@   @@@@@@   @@@ @@@   @@@@@@\e[0m"
echo -e "\e[95m@@@@@@@@  @@@@@@@@  @@@@ @@@  @@@@@@@   @@@ @@@  @@@@@@@\e[0m"
echo -e "\e[95m!@@       @@!       @@!@!@@@  !@@       @@! !@@  !@@\e[0m"
echo -e "\e[95m!@!       !@!       !@!!@!@!  !@!       !@! @!!  !@!\e[0m"
echo -e "\e[95m!@!       @!!!:!    @!@ !!@!  !!@@!!     !@!@!   !!@@!!\e[0m"
echo -e "\e[95m!!!       !!!!!:    !@!  !!!   !!@!!!     @!!!    !!@!!!\e[0m"
echo -e "\e[95m:!!       !!:       !!:  !!!       !:!    !!:         !:!\e[0m"
echo -e "\e[95m:!:       :!:       :!:  !:!      !:!     :!:        !:!\e[0m"
echo -e "\e[95m ::: :::   :: ::::   ::   ::  :::: ::      ::    :::: ::\e[0m"
echo -e "\e[95m :: :: :  : :: ::   ::    :   :: : :       :     :: : :\e[0m"

echo ""

if [ "$1" == "" ] || [ "$1" == "-h" ]
then
        echo -e "\e[96m{+}\e[0m \e[36mUSAGE:\e[0m"
        echo -e ""
        echo -e "\e[93m$0 hackerone.com(Website Name)\e[0m"
        exit
fi




first=`censys search "services.tls.certificates.leaf_data.names: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
second=`censys search "dns.names: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
third=`censys search "services.tls.certificates.leaf_data.subject.common_name: $1" --index-type hosts | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
#--virtual-hosts INCLUDE
fourth=`censys search "services.tls.certificates.leaf_data.names: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`
fifth=`censys search "services.tls.certificates.leaf_data.subject.common_name: $1" --index-type hosts --virtual-hosts INCLUDE | jq -c ".[] | {ip: .ip}" | cut -d '"' -f4 | anew iplist`



echo -e "\e[96m{+}\e[0m \e[36mFirst Dork:\e[0m"
echo $first
echo -e "\e[96m{+}\e[0m \e[36mSecond Dork:\e[0m"
echo $second
echo -e "\e[96m{+}\e[0m \e[36mThird Dork:\e[0m"
echo $third
echo -e "\e[96m{+}\e[0m \e[36mFourth Dork:\e[0m"
echo $fourth
echo -e "\e[96m{+}\e[0m \e[36mFifth Dork:\e[0m"
echo $fifth
