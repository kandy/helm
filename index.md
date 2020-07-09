# KAndy Helm Charts

## Add the repository to your helm

```bash
helm repo add kandy https://kandy.github.io/helm/repo
helm repo update
helm repo list
```

{% for el in site.data.index.entries %}
    <h3>{{ el[0] }}</h3>
    {% for a in el[1] %}
        <div>
            <p>{{ a.description }}</p>
            <div>Version: {{ a.version }} </div>
            <pre><code>helm install kandy/{{ a.name }}</code></pre>
        </div>
    {% endfor %}    
{% endfor %}
