# KAndy Helm Charts

## Add the repository to your helm

```bash
helm repo add kandy 'https://raw.githubusercontent.com/kandy/helm/master/'
helm repo update
helm repo list
```

{% for el in data.index.entries %}
  <p>{{ el }}</p>
{% endfor %}
