# Censys-Recon
Hey This is a Fantastic Tool which Uses Censys API to fetch IP address from the depth of internet..

*These are the Requirements:*
```
pip install censys
sudo apt install jq
go install -v github.com/tomnomnom/anew@latest
git clone https://github.com/rahul-verma1/Censys-Recon.git
cd Censys-Recon
chmod +x recon.sh
./recon.sh
```

***Paste the above commands in bash Shell Termminal***

One more thing to do here:

Create a free account on search.censys.io and login, Then Go on profile > API section

Type `censys config` in terminal and fill you API key and API secret from the website 

![abc](https://github.com/rahul-verma1/Censys-Recon/blob/main/censys-account.jpg)

Now you are all done Just type `./recon.sh hackerone.com` and the input will by default saved in `iplist.txt`

If you have any questions you can ask me at my twitter handle: https://twitter.com/mehul_vrma
