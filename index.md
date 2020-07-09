# KAndy Helm Charts

## Add the repository to your helm

```bash
helm repo add kandy https://kandy.github.io/helm/repo
helm repo update
helm repo list
```
git
# Package List
{% for el in site.data.index.entries %}
    ##{{ el[0] }}
    {% for a in el[1] %}
        <div>
            <p>{{ a.description }}</p>
            <div>Version: {{ a.version }} </div>
            <pre><code>helm install kandy/{{ a.name }}</code></pre>
        </div>
    {% endfor %}    
{% endfor %}
