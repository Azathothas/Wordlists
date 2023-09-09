### Download
```bash
!# Primaries
#----------------------------------------------------------------------#
--> API (Rest)
'[Tiny]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api_tiny.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api_tiny.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api_tiny.txt" | feroxbuster --stdin {other_opts}

'[General]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_api.txt" | feroxbuster --stdin {other_opts}
#----------------------------------------------------------------------#
--> DNS (Subdomain Bruteforcing | vHosts)
'[Tiny]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns_tiny.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns_tiny.txt"
!# FeroxBuster (No Download)
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns_tiny.txt" | feroxbuster --stdin {other_opts}

'[General]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns.txt" | feroxbuster --stdin {other_opts}
#----------------------------------------------------------------------#
--> Spray Pray (Low Hanging Fruits)
'[Mini]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mini.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mini.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mini.txt" | feroxbuster --stdin {other_opts}

'[Mid]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mid.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mid.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_mid.txt" | feroxbuster --stdin {other_opts}

'[Large]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_large.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_large.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_lhf_large.txt" | feroxbuster --stdin {other_opts}
#----------------------------------------------------------------------#
--> Spray Pray (General)
'[Mini]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_mini.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_mini.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_mini.txt" | feroxbuster --stdin {other_opts}

'[Lowercase]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/Misc/lowercase_misc.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/Misc/lowercase_misc.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/Misc/lowercase_misc.txt" | feroxbuster --stdin {other_opts}

'[Massive]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_massive.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_massive.txt"
!# FeroxBuster (No Download)
wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_massive.txt" | feroxbuster --stdin {other_opts}

'[Ports]'
curl -qfsSLJO "https://raw.githubusercontent.com/Azathothas/Wordlists/main/Misc/ports_top_20k.txt"
wget -q "https://raw.githubusercontent.com/Azathothas/Wordlists/main/Misc/ports_top_20k.txt"
```
---
### Methodology : [![💾 Fetch || ⏫ Update Wordlists 📙](https://github.com/Azathothas/Wordlists/actions/workflows/generate_update_wordlists.yaml/badge.svg)](https://github.com/Azathothas/Wordlists/actions/workflows/generate_update_wordlists.yaml)
> ```bash
> Use Wordium and fetch default Wordlists
>  wordium: 'https://github.com/Azathothas/Arsenal/tree/main/wordium'
> ```
---
### Currently Tracked Wordlists
```bash
 ~ >  70K --> https://github.com/reewardius/bbFuzzing.txt
 ~ >   5K --> https://github.com/Bo0oM/fuzz.txt
 ~ > 180K --> https://github.com/thehlopster/hfuzz
 ~ > 1.8K --> https://github.com/ayoubfathi/leaky-paths
 ~ > 760K --> https://github.com/six2dez/OneListForAll
 ~ > 1.1M --> https://github.com/rix4uni/WordList
```
---
### Optimal Goal
```bash
 x_api.txt       --> ~ < 100K [Everything API]
 x_api-tiny.txt  --> ~ <  20K [Top Paths || Objects || Verbs]
 x_dns.txt       --> ~ < 100K [Fuzz || Permutate Subdomains]
 x_dns-tiny.txt  --> ~ <  20K [Most Common Subdomains]
 x_mini.txt      --> ~ <  15K [Juicy || Leaky Paths]
 x_lhf_mini.txt  --> ~ <  50K [Top Low Hanging Fruits]
 x_lhf_mid.txt   --> ~ < 100K [Low Hanging Fruits Medium]
 x_lhf_large.txt --> ~ < 500K [Low Hanging Fruits Comprehensive]
 x_massive.txt   --> ~ <   1M [Low Hanging Fruits All]
```
---

---
```console

--> METADATA
➼Updated Wordlists:
➼ x_api.txt       : 75821 /home/runner/work/Wordlists/Wordlists/main/x_api.txt
➼ x_api_tiny.txt  : 22232 /home/runner/work/Wordlists/Wordlists/main/x_api_tiny.txt
➼ x_dns.txt       : 57778 /home/runner/work/Wordlists/Wordlists/main/x_dns.txt
➼ x_dns_tiny.txt  : 15426 /home/runner/work/Wordlists/Wordlists/main/x_dns_tiny.txt
➼ x_mini.txt      : 13998 /home/runner/work/Wordlists/Wordlists/main/x_mini.txt
➼ x_lhf_mini.txt  : 35611 /home/runner/work/Wordlists/Wordlists/main/x_lhf_mini.txt
➼ x_lhf_mid.txt   : 109397 /home/runner/work/Wordlists/Wordlists/main/x_lhf_mid.txt
➼ x_lhf_large.txt : 264878 /home/runner/work/Wordlists/Wordlists/main/x_lhf_large.txt
➼ x_massive.txt   : 1045723 /home/runner/work/Wordlists/Wordlists/main/x_massive.txt


```


---

