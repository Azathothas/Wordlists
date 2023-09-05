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
