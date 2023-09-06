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
