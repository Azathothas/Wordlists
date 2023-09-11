- #### [Index]()
> - [**API Paths**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#api-paths)
> - [**User-Agents**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#user-agents)
> - [**vHosts**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#vhosts)
---
- #### API Paths
> - [**OpenAPI Spec (JSON | YAML)**](https://editor.swagger.io/)
> ```bash
> !# Using SwagRoutes: https://github.com/amalmurali47/swagroutes
>  pip install swagroutes
> !# Extract FUZZABLE Paths
> swagroutes "/path/to/specs" | grep -iv "{" | awk '{print $2}' | grep -oE '\/[^\ ]+' | sed 's/^\///' 
> ```
> ---
> > - [**Kubernetes**](https://github.com/kubernetes/kubernetes/)
> > > - https://cloud.hacktricks.xyz/pentesting-cloud/kubernetes-security/pentesting-kubernetes-services
> > ```bash
> > !# https://github.com/kubernetes/kubernetes/tree/master/api/openapi-spec
> > curl -qfsSL "https://raw.githubusercontent.com/kubernetes/kubernetes/master/api/openapi-spec/swagger.json" -o "/tmp/kubernetes_api.json"
> > swagroutes "/tmp/kubernetes_api.json" | grep -iv "{" | awk '{print $2}' | grep -oE '\/[^\ ]+' | sed 's/^\///' | anew x_api_tiny.txt | wc -l
> > swagroutes "/tmp/kubernetes_api.json" | grep -iv "{" | awk '{print $2}' | grep -oE '\/[^\ ]+' | sed 's/^\///' | anew x_lhf_mini.txt | wc -l
> > ```
- #### User-Agents
> > Main Source: https://github.com/EIGHTFINITE/top-user-agents/blob/main/index.json
> > Alt: https://github.com/HyperBeats/User-Agent-List
> - [**Chrome**](https://chromereleases.googleblog.com/)
> ---
> ```bash
> --> macOS
> jq -r '.[]' <(curl -qfsSL "https://raw.githubusercontent.com/EIGHTFINITE/top-user-agents/main/index.json") | grep -i 'mac' | grep -i 'chrome' | sort -u | tail -n 1
>
> --> Windows
> jq -r '.[]' <(curl -qfsSL "https://raw.githubusercontent.com/EIGHTFINITE/top-user-agents/main/index.json") | grep -i 'Windows NT 10' | grep -i 'chrome'| grep -iv 'edg\|opr\|ya' | sort -u | tail -n 1
> 
> ```
> ---
> - [**FireFox**](https://www.mozilla.org/en-US/firefox/releases/)
> ```bash
> --> macOS
> jq -r '.[]' <(curl -qfsSL "https://raw.githubusercontent.com/EIGHTFINITE/top-user-agents/main/index.json") | grep -i 'mac' | grep -i 'firefox' | sort -u | tail -n 1
>
> --> Windows
> jq -r '.[]' <(curl -qfsSL "https://raw.githubusercontent.com/EIGHTFINITE/top-user-agents/main/index.json") | grep -i 'Windows NT 10' | grep -i 'firefox' | grep -iv 'edg\|opr\|ya' | sort -u | tail -n 1 
> ```
> ---
> - [**Safari**](https://developer.apple.com/documentation/safari-release-notes)
> ```bash
> jq -r '.[]' <(curl -qfsSL "https://raw.githubusercontent.com/EIGHTFINITE/top-user-agents/main/index.json") | grep -i 'mac' | grep -i 'safari' | sort -u | tail -n 1
> ```
> ---
- #### vHosts
> > ```bash
> > Subdomains --> Just Hostnames without [http|https] PreFixes
> > ```
> 1. Expanding Source [(dsieve)](https://github.com/trickest/dsieve)
> ```bash
> !# Install dsieve
>  sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/dsieve" -o "/usr/local/bin/dsieve" && sudo chmod +xwr "/usr/local/bin/dsieve"
> !# Separate into levels [Level 2 --> main domain + all it's subdomains]
>  dsieve -if "subdomains.txt" -f 2: | anew -q "subdomains.txt"
> ```
> 2. Generating Initial Wordlist [(tok)](https://github.com/tomnomnom/hacks/tree/master/tok)
> ```bash
> #Separate by dots(.) | dash (-) | Underscores (_) And Filter Numerics
>  sed 's/[._-]/\n/g' "subdomains.txt" | tr -s '\n' | grep '^[[:alpha:]]\+$' | anew -q "/tmp/vhosts_wordlist.txt"
> #With Tok
>  cat "subdomains.txt" | tok | anew -q "/tmp/vhosts_wordlist.txt"
> ```
> > ---
> > - Generate a Combined Wordlist [(comb)](https://github.com/tomnomnom/hacks/tree/master/comb) (Optional) 
> > ```bash
> > !# Note: The vhosts wordlist is increased exponentially, so if initial list is 1000, then result will be (1000 X 1000 = 1,000,000)
> > !# Hence, only use this as last resort.
> > !# Instead of all subdomains,
> > !# You could also use subdomains_dead.txt (Those that got resolved but aren't alive) to reduce the output
> > 
> > !# Install Comb
> >  sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/comb" -o "/usr/local/bin/comb" && sudo chmod +xwr "/usr/local/bin/comb"
> > 
> > !# Get words from subdomains
> > !# You could also use subdomains_dead.txt (Those that got resolved but aren't alive) to reduce the output
> >  sed 's/[._-]/\n/g' "subdomains.txt" | tr -s '\n' | grep '^[[:alpha:]]\+$' | anew "/tmp/comb_in.txt"
> > 
> > !# Using `-` as a separator, Generate
> >  comb --separator="-" "/tmp/comb_in.txt" "/tmp/comb_in.txt" > "/tmp/comb_out.txt"
> > 
> > !# Merge & Sort
> >  cat "/tmp/comb_out.txt" | anew -q "/tmp/vhosts_wordlist.txt"
> > ```
> > ---
> 3. Merge & Sort
> ```bash
> !# You may want to skip this, especially if you used comb to generate permutations
> 
> !# With x_dns_tiny.txt [Recommended] : https://github.com/Azathothas/Wordlists/blob/main/x_dns_tiny.txt
>   wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns_tiny.txt" | anew -q "/tmp/vhosts_wordlist.txt"
> 
> !# with x_dns.txt [Huge] : https://github.com/Azathothas/Wordlists/blob/main/x_dns.txt
>   wget -qO- "https://raw.githubusercontent.com/Azathothas/Wordlists/main/x_dns.txt" | anew -q "/tmp/vhosts_wordlist.txt"
>
> !# Sort
>   sort -u "/tmp/vhosts_wordlist.txt" -o "/tmp/vhosts_wordlist.txt"
>   wc -l < "/tmp/vhosts_wordlist.txt"
> ```
> ---
> 4. Fuzz
> > ---
> > - Generate a Target Specific Wordlist [(mgwls)](https://github.com/trickest/mgwls) (Optional)
> > ```bash
> > !# Install
> >  sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/mgwls" -o "/usr/local/bin/mgwls" && sudo chmod +xwr "/usr/local/bin/mgwls"
> >
> > !# Put Individual Words from your subdomain in a text file
> > !# Example: prod-dev-config.admin.example.com
> > !# Words: prod, dev, config, admin, example, com
> >  echo "$domain.tld" | sed 's/[._-]/\n/g' | tr -s '\n' | tee "/tmp/mgwls_in.txt"
> > !# You can crawl the domain and add your own words to "/tmp/mgwls_in.txt"
> > !# You can also something like: https://github.com/d4rckh/gorilla
> > !# or CEWL: https://github.com/digininja/CeWL
> > 
> > !# Generate
> >  mgwls -l "/tmp/mgwls_in.txt" -r "/tmp/vhosts_wordlist.txt" -delimiter "-" | anew -q  "/tmp/vhosts_wordlist.txt"
> >
> > !# Sort
> >  sort -u "/tmp/vhosts_wordlist.txt" -o "/tmp/vhosts_wordlist.txt"
> >  wc -l < "/tmp/vhosts_wordlist.txt"
> > 
> > ```
> - [**Feroxbuster**](https://epi052.github.io/feroxbuster-docs/docs/)
> ```bash
>  !# Install @latest
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/feroxbuster" -o "/usr/local/bin/feroxbuster" && sudo chmod +xwr "/usr/local/bin/feroxbuster"
>
>  !# Fuzz
>  feroxbuster
> 
> ```
> - [**FFUF**](https://github.com/ffuf/ffuf#usage)
> ```bash
>  !# Install
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/ffuf" -o "/usr/local/bin/ffuf" && sudo chmod +xwr "/usr/local/bin/ffuf"
> 
>  !# Fuzz
>  ffuf
> 
> ```
> - [**GoBuster**](https://github.com/OJ/gobuster#vhost-mode)
> ```bash
>  !# Install
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/gobuster" -o "/usr/local/bin/gobuster" && sudo chmod +xwr "/usr/local/bin/gobuster"
> 
>  !# Fuzz
>   gobuster
> 
> ```
