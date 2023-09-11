- #### [Index]()
> - [**API Paths**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#api-paths)
> - [**DNS**(Subdomains)](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#dns-subdomains)
> - [**User-Agents**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#user-agents)
> - [**vHosts**](https://github.com/Azathothas/Wordlists/blob/main/Misc/README.md#vhosts)
---
- #### API Paths
> ---
> - [**Application.wadl**](https://eclipse-ee4j.github.io/jersey.github.io/documentation/latest/wadl.html)
> ```bash
> !# Install wadl-dumper: https://github.com/dwisiswant0/wadl-dumper
>  sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/wadl-dumper" -o "/usr/local/bin/wadl-dumper" && sudo chmod +xwr "/usr/local/bin/wadl-dumper"
> !# wadl-dumper also accepts direct urls: --input "https://example.com/app.wadl"
> !# Extract FUZZABLE Paths
> wadl-dumper --input "/path/to/specs.wadl" 
> !# Extract FUZZABLE Paths with $BASE_URL
> wadl-dumper --input "/path/to/specs.wadl" --show-base
> !# Get ALL Base_URLs+PATH || Replace {$} with `test` & httpx (use -fc 401,403 etc to filter by Status Code)
> wadl-dumper --input "/path/to/specs.wadl" --show-base --replace test | httpx -silent -include-response --json |  jq . | less
> ```
> ---
> - [**OpenAPI Spec (JSON | YAML)**](https://editor.swagger.io/)
> > ---
> > - [**SwagRoutes**](https://github.com/amalmurali47/swagroutes)
> ```bash
> !# Using SwagRoutes: https://github.com/amalmurali47/swagroutes
>  pip install swagroutes
> !# Extract $METHOD + $PATH
>  swagroutes "/path/to/specs"
> !# Extract $METHOD + $PATH + $QUERIES ($PARAMS)
> swagroutes "/path/to/specs" --include-params
> !# Extract FUZZABLE Paths for wordlist
> swagroutes "/path/to/specs" | grep -iv "{" | awk '{print $2}' | grep -oE '\/[^\ ]+' | sed 's/^\///' 
> !# Pass to HTTPx (the trailing slash `/` at the end of $domain.tld is REQUIRED)
> swagroutes "/path/to/specs" --include-params | grep -iv "{" | awk '{print $2}' | grep -oE '\/[^\ ]+' | sed 's/^\///' | sed 's|^|https://$domain.tld/|' | httpx -silent -include-response --json |  jq . | less
> ```
> > ---
> > - [**CherryBomb**](blst-security/cherrybomb)
> ```bash 
> !# Only Works if schema perfectly matches openapi v3 or greater
> !# Install
> sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/cherrybomb" -o "/usr/local/bin/cherrybomb" && sudo chmod +xwr "/usr/local/bin/cherrybomb"
> !# Passive Mode
> cherrybomb --file  "/path/to/specs" --profile passive
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
---
- #### DNS (Subdomains)
> - Sources
> > - https://github.com/yosriady/awesome-api-devtools
> > - https://github.com/ligurio/awesome-ci
> > - https://github.com/rootsongjc/awesome-cloud-native
> > - https://github.com/crazy-canux/awesome-monitoring
> > - https://github.com/awesome-selfhosted/awesome-selfhosted
> > - https://github.com/anaibol/awesome-serverless
> > - https://github.com/Atarity/deploy-your-own-saas
> > - 
> > ```bash
> > $placeholder to programmatically extract all tech names to add into x_dns
> > ```
--- 
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
> >  sed 's/[._-]/\n/g' "subdomains.txt" | tr -s '\n' | grep '^[[:alpha:]]\+$' | anew -q "/tmp/comb_in.txt"
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
> > !# sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/gorilla" -o "/usr/local/bin/gorilla" && sudo chmod +xwr "/usr/local/bin/gorilla"
> > !# gorilla --from-website https://example.com
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
> > - Clean Wordlist (Optional) [Not Recommended]
> > ```bash
> > !# If you wordlist is too large, you can optionally remove all words that have numerics (digits)
> >  sed -e 's/[^[:alpha:]]//g; /^[[:space:]]*$/d' -i "/tmp/vhosts_wordlist.txt"
> > !# sort
> >  sort -u "/tmp/vhosts_wordlist.txt" -o "/tmp/vhosts_wordlist.txt"
> >  wc -l < "/tmp/vhosts_wordlist.txt"
> > ```
> > ---
> - [**Feroxbuster**](https://epi052.github.io/feroxbuster-docs/docs/)
> ```bash
>  !# Install @latest
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/feroxbuster" -o "/usr/local/bin/feroxbuster" && sudo chmod +xwr "/usr/local/bin/feroxbuster"
>
>  !# Fuzz
>  feroxbuster currently can't do vHOST fuzzing
>  !# See: https://github.com/epi052/feroxbuster/issues/242
> 
> ```
> - [**FFUF**](https://github.com/ffuf/ffuf#usage) [NOT RECOMMENDED]
> ```bash
>  !# Install
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/ffuf" -o "/usr/local/bin/ffuf" && sudo chmod +xwr "/usr/local/bin/ffuf"
> 
>  !# Fuzz, use optional filters (-mc | -fc | -ms etc as you see fit)
>    ffuf -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" -w "/tmp/vhosts_wordlist.txt" -H "Host: FUZZ.$DOMAIN.TLD" -u "https://$host_or_ip"
> 
> ```
> - [**GoBuster**](https://github.com/OJ/gobuster#vhost-mode) [RECOMMENDED]
> ```bash
>  !# Install
>   sudo curl -qfsSL "https://raw.githubusercontent.com/Azathothas/Toolpacks/main/x86_64/gobuster" -o "/usr/local/bin/gobuster" && sudo chmod +xwr "/usr/local/bin/gobuster"
> 
>  !# Fuzz
>  !# Note: You must NOT Pass the complete url
>  !# Example: Complete URL: https://vhost.api.dev-stg.example.com
>  !# Then GOBUSTER_URL: https://api.dev-stg.example.com [ We Removed the actual vHOST as that's where we want to FUZZ]
>  gobuster vhost --useragent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36" --no-tls-validation --append-domain --wordlist "/tmp/vhosts_wordlist.txt" --url "GOBUSTER_URL_NOT_COMPLETE_URL"
> 
> ```
